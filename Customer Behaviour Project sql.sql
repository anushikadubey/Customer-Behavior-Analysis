SELECT * FROM customer;
#DEMO AND SEGMENTATION QUESTION
# 1 WHICH AGE GROUP CONTRIBUTES TO MOST REVENUE
select age_group, sum(purchase_amt)as amount from customer group by age_group order by amount desc ;
# How does purchase behavior differ between genders?
SELECT gender,
       COUNT(*) AS total_orders,
       AVG(purchase_amt) AS avg_spend
FROM customer
GROUP BY gender;

# Which age group purchases most frequently?
select * from customer;
select age_group, avg(purchase_frequency_days) as frequent_purchase from customer group by age_group order by frequent_purchase desc;

#Age-wise category preference
select age_group, category, count(*) as total_order from customer group by age_group, category order by age_group, total_order desc;

#Subscription status by age group
select age_group, subscription_status, count(*) as total_customer from customer group by age_group, subscription_status;

#Review rating by demographic segments
select age_group, gender, round(avg(review_rating),2) as avg_rating from customer group by age_group, gender;

#Product & Category Insights
# Highest revenue-generating category
select category, sum(purchase_amt) as total_revenue from customer group by category order by total_revenue desc;

#Which sizes sell the most?
select size, count(*) as item_sold from customer group by size order by item_sold;

# Customer Loyalty & Retention
# Relationship between previous purchases & review rating
SELECT previous_purchases, AVG(review_rating) AS avg_rating
FROM customer
GROUP BY previous_purchases
ORDER BY previous_purchases;

# Predicting churn from frequency
SELECT customer_id, purchase_frequency_days
FROM customer
ORDER BY purchase_frequency_days DESC;  -- higher = more likely churn
# which customer spent more even after having discount
select customer_id, purchase_amt from customer where discount_applied ='YES' and purchase_amt >= (select avg(purchase_amt) from customer);
# top 5 products with highest avg review rating
select item_purchased, round(avg(review_rating),2) as avgrating from customer group by item_purchased  order by avg(review_rating) desc limit 5;

# Compare avg purchase amout b/w standard and express shipping
select shipping_type, avg(purchase_amt) from customer where shipping_type in ('Standard', 'Express') group by shipping_type;

# subscribed customers spend more?
select * from customer;
select subscription_status, avg(purchase_amt) as avg_amount, sum(purchase_amt) as total_revenue from customer group by subscription_status;

# 5 products having high % of purchase with discount applied
select item_purchased,
round((sum(case when discount_applied = 'YES' then 1 else 0 end) /count(*))*100,2) as discount from customer group by item_purchased;

#segmentation of customers into new, returning and loyal
with customer_type as (select customer_id, previous_purchases, 
case when previous_purchases = 1 then 'New'
when previous_purchases between 2 and 10 then 'returning'
else 'Loyal' end as customer_segment from customer) SELECT customer_segment, COUNT(*) AS total_customers
FROM customer_type
GROUP BY customer_segment;

# top 3 most purchase products within category
WITH product_counts AS (
    SELECT 
        category,
        item_purchased,
        COUNT(*) AS total_purchases,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY COUNT(*) DESC) AS rn
    FROM customer
    GROUP BY category, item_purchased
)
SELECT category, item_purchased, total_purchases
FROM product_counts
WHERE rn <= 3;






