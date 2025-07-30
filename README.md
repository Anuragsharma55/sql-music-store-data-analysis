
# 🎵 SQL Music Store Analysis

## 📊 Project Type
**Data Analytics**

## 🛠️ Tech Stack / Tools Used
- SQL Workbench
- MySQL
- DB schema: Chinook-style Music Store database

---

## 🎯 Objective
The company is planning to launch a new product and needs **data-driven insights** to make informed decisions.

---

## ❓ Problem Statements

1. **Who is the senior-most employee?**  
2. **Which country has the highest number of invoices?**  
3. **Who are the top 3 customers by invoice value?**  
4. **How much has each customer spent on each artist?**  
5. **Which is the most popular genre by purchase count?**  
6. **Which city has the highest total invoice amount?**  
7. **Identify top 10 tracks with highest revenue.**  

---

## 📁 Data Source
A simulated music store database consisting of:
- `customer`, `invoice`, `invoice_line`
- `track`, `album`, `artist`, `genre`
- `employee`, `media_type`, and other metadata tables

---

## 🔍 Key Insights

- The USA has the highest number of invoices.
- Prague and Paris are top in revenue-generating cities.
- Rock is the most purchased genre.
- Each customer's top artist and spending can be extracted with analytical queries.

---

## 🧑‍💻 How to Run This Project

1. Open **SQL Workbench**
2. Load the database (`Chinook` or similar schema)
3. Open and run `queries.sql` script
4. View result sets for each analysis question

---

## 📸 Database Schema
![Database Schema](database%20schema.png)

---

## 🖼️ Screenshots / Visuals

### 1. Senior Most Employee
![Senior Most Employee](screenshots/Screenshot 2025-07-30 022631.png)

### 2. Country with Most Invoices
![Country with Most Invoices](screenshots/Screenshot 2025-07-30 022731.png)

### 3. Top 3 Customers by Invoice Value
![Top Customers](screenshots/Screenshot 2025-07-30 022818.png)

### 4. Customer Spending per Artist
![Customer Artist Spend](screenshots/Screenshot 2025-07-30 022929.png)

### 5. Most Popular Genre by Purchase Count
![Popular Genre](screenshots/Screenshot 2025-07-30 022953.png)

### 6. City with Highest Invoice Value
![Top City](screenshots/Screenshot 2025-07-30 023014.png)

### 7. Top Revenue Tracks
![Top Tracks](screenshots/Screenshot 2025-07-30 023052.png)

### 8. Sales Distribution by Genre
![Genre Distribution](screenshots/Screenshot 2025-07-30 023125.png)

### 9. Invoice Value by Country
![Invoice by Country](screenshots/Screenshot 2025-07-30 023157.png)

### 10. Artist Revenue Summary
![Artist Revenue](screenshots/Screenshot 2025-07-30 023226.png)

---

## 👨‍💻 Author
**Anurag Sharma**

---

## 📂 Files Included

| File Name           | Description                                |
|---------------------|--------------------------------------------|
| `README.md`         | Project documentation                      |
| `queries.sql`       | All SQL queries used for analysis          |
| `database schema.png` | Schema diagram of the database           |
| `screenshots/`      | Output screenshots of each query           |

---

## 📌 Notes
This project showcases how raw SQL can be used effectively for business decision support, without needing external tools like Python or Excel.

---
