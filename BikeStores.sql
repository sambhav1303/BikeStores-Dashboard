use BikeStores;
show TABLES;
SELECT
    orders.order_id,
    CONCAT(customers.first_name, " ", customers.last_name) AS customer_name,
    customers.city,
    customers.state,
    order_date,
    SUM(order_items.quantity) AS Total_Units,
    SUM(order_items.quantity * order_items.list_price) AS Revenue,
    products.product_name,
    categories.category_name,
    brands.brand_name,
    stores.store_name,
    CONCAT(staffs.first_name," ", staffs.last_name) AS 'Sales_Rep'
    from orders
    JOIN customers on orders.customer_id = customers.customer_id
    JOIN order_items on orders.order_id = order_items.order_id
    JOIN products on order_items.product_id = products.product_id
    JOIN categories on products.category_id = categories.category_id
    JOIN brands on products.brand_id = brands.brand_id
    JOIN stores on orders.store_id = stores.store_id
    JOIN staffs on orders.store_id = staffs.store_id
    GROUP BY 
        orders.order_id,
        customer_name,
        city,
        state,
        order_date,
        products.product_name,
        categories.category_name,
        brands.brand_name,
        stores.store_name,
        Sales_Rep
    order by orders.order_id;
