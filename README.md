# Customer-Behavior-Analysis

Python • SQL • Power BI | End-to-End Data Analysis

This project performs end-to-end Customer Analytics using a retail customer dataset.
The goal was to understand customer behavior, identify churn risk, segment customers, and uncover actionable insights for decision-making.

The workflow includes:

* Data Cleaning & Feature Engineering (Python)

* Business Questions Answered (SQL)

* Interactive Dashboard (Power BI)

Project Overview

The dataset included customer attributes such as:

->Age, Gender
->Item Purchased, Category
->Purchase Amount
->Location
->Size, Color, Season
->Review Rating
->Subscription Status
->Shipping Type
->Discount Applied, Promo Code Used
->Previous Purchases
->Payment Method
->Frequency of Purchases

All data cleaning and processing was done in a Jupyter Notebook.

Key cleaning steps:

o Removed inconsistencies & standardized column names
o Handled missing values
o Converted frequencies (Weekly, Monthly, Annually etc.) → Days
o Created new features like:
->purchase_frequency_days
->age_group

The SQL analysis helped uncover:
->Top contributing demographics
->Revenue-driving products and sizes
->Customer satisfaction patterns
->Subscription value & behavior
->High-value vs discount-driven customers
->Churn-prone customer groups
->Category-wise product performance
->Customer segmentation based on purchase history

These insights were later integrated into the Power BI Dashboard for interactive visualization.

A Power BI report was created to visualize the cleaned dataset and analytical outputs.

Dashboard includes visuals for:
Customer Segments
->Total Sales & Revenue
->Review Ratings Distribution
->Subscription Analysis
->Seasonal Buying Trends
->Shipping Type Breakdown

Interactive slicers allow filtering by:
->Gender
->Shipping Type
->Category
->Subscription Status



