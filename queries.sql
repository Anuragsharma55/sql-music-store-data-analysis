-- We want to assign a senior employee to lead a project.
-- This query finds the employee with the highest job level.
SELECT title, first_name, last_name, levels
FROM music.employee
ORDER BY levels DESC
LIMIT 1;

-- Which country has the most number of invoices?
-- This query groups invoices by billing country and finds the one with the highest count.
SELECT COUNT(*) AS 'total', billing_country
FROM music.invoice
GROUP BY billing_country
ORDER BY total DESC
LIMIT 1;

-- What is the value of the top 3 invoices?
-- This query returns the top 3 invoices with the highest total value.
SELECT *
FROM music.invoice
ORDER BY total DESC
LIMIT 3;

-- We would like to throw a promotional music festival in the city we made the most money.
-- This query finds the billing city with the highest total sales.
SELECT billing_city, SUM(total) AS 'most_money'
FROM music.invoice
GROUP BY billing_city
ORDER BY most_money DESC
LIMIT 1;

-- Who is the best customer? The customer who has spent the most money will be declared the best.
-- This query sums up the total invoice amount for each customer and returns the top spender.
SELECT customer.customer_id, first_name, last_name,
ROUND(SUM(invoice.total), 2) AS Amount
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer_id, first_name, last_name
ORDER BY Amount DESC
LIMIT 1;

-- Details of customers who listen to rock music.
-- This query filters customers who have at least one invoice for a rock genre track.
SELECT DISTINCT first_name, last_name, email
FROM music.customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN (
    SELECT track_id
    FROM track
    JOIN genre ON track.genre_id = genre.genre_id
    WHERE genre.name LIKE 'rock'
);

-- Let's invite the artists who have written the most rock music in our dataset.
-- This query counts how many rock songs each artist has and returns them in descending order.
SELECT artist.artist_id, artist.name, genre.name, COUNT(artist.artist_id) AS 'no_of_songs'
FROM music.artist
JOIN album ON artist.artist_id = album.artist_id
JOIN track ON album.album_id = track.album_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name LIKE 'rock'
GROUP BY artist.artist_id, artist.name, genre.name
ORDER BY no_of_songs DESC;

-- We want to find out the most popular music genre for each country.
-- This CTE ranks genres by quantity for each country, and selects the top one per country.
WITH cte_table AS (
    SELECT 
        invoice.billing_country,
        COUNT(invoice_line.quantity) AS Quantity,
        genre.name AS Genre,
        ROW_NUMBER() OVER (
            PARTITION BY invoice.billing_country 
            ORDER BY COUNT(invoice_line.quantity) DESC
        ) AS row_numb
    FROM music.invoice_line
    JOIN invoice ON invoice_line.invoice_id = invoice.invoice_id
    JOIN customer ON invoice.customer_id = customer.customer_id
    JOIN track ON invoice_line.track_id = track.track_id
    JOIN genre ON track.genre_id = genre.genre_id
    GROUP BY invoice.billing_country, genre.name
    ORDER BY invoice.billing_country
)
SELECT * FROM cte_table
WHERE row_numb <= 1;

-- We want to give gifts to top customers.
-- Determine which customer has spent the most on music for each country.
-- This CTE ranks customers per country based on total amount spent and selects the top one.
WITH cte_table AS (
    SELECT 
        customer.customer_id,
        customer.first_name,
        customer.last_name,
        invoice.billing_country AS country,
        COUNT(total) AS totalspent,
        customer.email,
        ROW_NUMBER() OVER (
            PARTITION BY invoice.billing_country 
            ORDER BY COUNT(total) DESC
        ) AS row_num
    FROM customer
    JOIN invoice ON customer.customer_id = invoice.customer_id
    GROUP BY customer.customer_id, customer.first_name, customer.last_name, invoice.billing_country, customer.email
)
SELECT * FROM cte_table
WHERE row_num <= 1;

-- Find how much amount is spent by each customer on each artist.
-- This query calculates the total spent per customer per artist and ranks them per customer.
WITH customer_artist_spending AS (
    SELECT 
        customer.customer_id,
        customer.first_name,
        customer.last_name,
        artist.name AS artist_name,
        ROUND(SUM(invoice_line.unit_price * invoice_line.quantity), 2) AS total_spent,
        ROW_NUMBER() OVER (
            PARTITION BY customer.customer_id 
            ORDER BY SUM(invoice_line.unit_price * invoice_line.quantity) DESC
        ) AS rn
    FROM customer
    JOIN invoice ON customer.customer_id = invoice.customer_id
    JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
    JOIN track ON invoice_line.track_id = track.track_id
    JOIN album ON track.album_id = album.album_id
    JOIN artist ON album.artist_id = artist.artist_id
    GROUP BY customer.customer_id, customer.first_name, customer.last_name, artist.artist_id, artist.name
)
SELECT * FROM customer_artist_spending;
