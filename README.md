
# 🎵 SQL Music Store Analysis

## 📊 Project Type
Data Analytics

## 🛠️ Tech Stack / Tools Used
- SQL Workbench
- MySQL (Chinook Database)

## 🎯 Objective
The company plans to launch a new music product and needs **actionable insights** from existing customer and sales data to guide decision-making.

## 🧩 Problem Statements & Business Questions

1. 🧑‍💼 Assigning a project lead — Who is the **senior-most employee** based on job title?
2. 🌍 Identifying customer base — Which **country has the most invoices**?
3. 💰 Revenue focus — What are the **top 3 highest invoices**?
4. 🎉 Marketing opportunity — Which **city generated the most revenue**?
5. 🥇 Top spender — Who is the **best customer** based on total spending?
6. 🎸 Music preference — Which customers listen to **Rock music**?
7. 🤘 Artist collaboration — Which artists have **written the most Rock songs**?
8. 🌎 Genre trends — What is the **most popular genre by country**?
9. 🎁 Customer rewards — Which customer has **spent the most per country**?
10. 💵 Artist revenue — How much **each customer spent on each artist**?

## 📥 Data Source
- Sample music store database (`music` schema), similar to Chinook

## 🚀 Key Features / Insights

- Use of **Common Table Expressions (CTEs)** for country- and customer-level segmentation
- Use of **aggregations and window functions** like `ROW_NUMBER()` and `SUM()`
- Identification of **top customers**, **most played genres**, and **revenue-contributing cities**
- Focused on **actionable business metrics** for marketing and product development

## ▶️ How to Run This Project

1. Open **SQL Workbench**.
2. Connect to the database containing the `music` schema.
3. Paste and run each query from the SQL script.
4. Review output tables in the result grid.

> 💡 Make sure your database matches the structure of the Chinook dataset (tables like `customer`, `invoice`, `track`, `artist`, etc.).

## 👤 Author
**Anurag Sharma**
