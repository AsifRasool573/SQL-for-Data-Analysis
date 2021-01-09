-- ****** INNER JOIN ******************
-- **********************************
-- **** JOINING TWO TABLES ***********
-- Query 1
-- select order_id, p.product_id, name, quantity_in_stock, oi.unit_price
-- from products p
-- join order_items oi on p.product_id = oi.product_id
-- Where order_id <= 3
-- order by name desc;

-- Query 2
-- SELECT 
--     order_id, name, order_date, status
-- FROM
--     orders o
-- JOIN
--     shippers s ON o.shipper_id = s.shipper_id;

-- ***** JOINING TWO TABLES ACROSS TWO DATABASES *************

-- NOTE: you have to mention in which database, external table exists

-- select order_id, p.product_id, name, quantity_in_stock, oi.unit_price
-- from sql_inventory.products p
-- join order_items oi on p.product_id = oi.product_id


-- ***** SELF JOIN ************

-- use sql_hr;
-- select 
-- 	e.first_name, e.last_name, m.first_name as manager
-- from employees e 
-- join employees m on e.reports_to = m.employee_id;
-- 
-- 
-- ***** JOINING MULTIPLE TABLES ******

-- Query 1

-- use store;
-- SELECT 
--     o.order_id,
--     o.order_date,
--     c.first_name,
--     os.name AS status,
--     s.name AS shipper
-- FROM
--     orders o
--         JOIN
--     customers c ON o.customer_id = c.customer_id
--         JOIN
--     order_statuses os ON o.status = os.order_status_id
--         JOIN
--     shippers s ON o.shipper_id = s.shipper_id


-- Query 2

-- use invoicing;
-- SELECT 
--     c.client_id,
--     c.name AS client_name,
--     c.state AS client_state,
--     p.invoice_id,
--     p.amount AS Amount_Paid,
--     i.invoice_date AS last_invoice_date,
--     pm.name AS payment_method,
--     i.invoice_total - p.amount AS Remaining_balance,
--     i.due_date
-- FROM
--     payments p
--         JOIN
--     payment_methods pm ON p.payment_method = pm.payment_method_id
--         JOIN
--     clients c ON p.client_id = c.client_id
--         JOIN
--     invoices i ON p.invoice_id = i.invoice_id
-- ORDER BY Remaining_balance DESC
-- 
-- **************************************************************************
-- **********   OUTER JOIN  *************************************************
-- **** there are two types of outer joins, left join and right join.
-- Left join, fetches the records from the left table who are either matching or not. 
-- Right Join, fetches the records from the left table who are either matching or not.

-- use store;

-- SELECT 
--     c.customer_id, c.first_name, o.order_id
-- FROM
--     orders o
-- 	RIGHT JOIN
--     customers c ON c.customer_id = o.customer_id
--     
    
    
-- SELECT 
--     c.customer_id, c.first_name, o.order_id
-- FROM
--     customers c
--         LEFT JOIN
--     orders o ON c.customer_id = o.customer_id


-- SELECT 
--     p.product_id, p.name, oi.quantity
-- FROM
--     products p
--         LEFT JOIN
--     order_items oi ON p.product_id = oi.product_id
-- ORDER BY p.product_id


-- *********** OUTER JOIN ON MULTIPLE TABLES *******************
-- *************************************************************
-- SELECT 
--     c.customer_id,
--     c.first_name,
--     o.order_id,
--     o.shipper_id,
--     s.name,
--     os.name as status
-- FROM
--     customers c
--         LEFT JOIN
--     orders o ON c.customer_id = o.customer_id
--         LEFT JOIN
--     shippers s ON o.shipper_id = s.shipper_id
--         LEFT JOIN
--     order_statuses os ON o.status = os.order_status_id
-- ORDER BY c.customer_id
--     
-- 
-- SELECT 
--     o.order_id,
--     o.order_date,
--     c.first_name as customer,
--     s.name as shipper,
--     os.name as status
-- FROM
--     orders o
-- 	JOIN
--     customers c ON o.customer_id = c.customer_id
--     left join
--     shippers s on o.shipper_id = s.shipper_id
--     join
--     order_statuses os on o.status = os.order_status_id
--     order by status


-- *********************** SELF OUTER JOIN **************
-- ******************************************************
-- use sql_hr;
-- SELECT 
--     e.employee_id, e.first_name, m.first_name AS manager
-- FROM
--     employees e
--         LEFT JOIN
--     employees m ON e.reports_to = m.employee_id;
-- 






