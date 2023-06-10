use gravity_books

-- 1 books --
SELECT 
	b.title,
	a.author_name,
	bl.language_name 
FROM book b 
inner join book_author ba 
on ba.book_id = b.book_id 
inner join author a 
on a.author_id = ba.author_id 
inner join book_language bl 
on bl.language_id = b.language_id 

-- 2 books --
SELECT 
	c.first_name,
	COUNT(c.first_name) as Cant_compras 
FROM cust_order co 
inner join customer c 
on c.customer_id = co.customer_id 
GROUP BY c.first_name HAVING COUNT(c.first_name)>1 

-- 3 books --
SELECT TOP 5
	b.title,
	COUNT(b.title) as Ventas 
FROM book b 
inner join order_line ol
on ol.book_id = b.book_id 
GROUP BY b.title HAVING COUNT(b.title)>1
ORDER BY Ventas DESC 

-- 4 books --
SELECT 
	c.country_name,
	sm.method_name
FROM cust_order co 
inner join shipping_method sm 
on sm.method_id = co.shipping_method_id 
inner join address a 
on a.address_id = co.dest_address_id 
inner join country c 
on c.country_id = a.country_id 
WHERE sm.method_name = 'Express'
GROUP by c.country_name, sm.method_name 

-- 5 books --
SELECT 
	b.title
FROM book b 
inner join order_line ol 
on ol.book_id = b.book_id
inner join cust_order co 
on co.order_id = ol.order_id 
inner join order_history oh 
on co.order_id = oh.order_id 
inner join order_status os 
on os.status_id = oh.status_id 
WHERE os.status_value = 'Cancelled'

-- 6 books --
SELECT 
	a.author_name,
	c.country_name,
	COUNT(c.country_name) as Influencia 
FROM book b 
inner join book_author ba 
on ba.book_id = b.book_id 
inner join author a 
on a.author_id = ba.author_id 
inner join order_line ol 
on ol.book_id = b.book_id 
inner join cust_order co 
on co.order_id = ol.order_id 
inner join address a2 
on co.dest_address_id = a2.address_id 
inner join country c 
on c.country_id = a2.country_id 
GROUP BY a.author_name, c.country_name HAVING COUNT(c.country_name)>1
ORDER BY c.country_name, Influencia DESC 

-- 7 books --
SELECT 
	c.first_name,
	os.status_value 
FROM cust_order co 
inner join order_history oh
on oh.order_id = co.order_id 
inner join order_status os 
on os.status_id = oh.status_id 
inner join customer c 
on c.customer_id = co.customer_id 
where os.status_value = 'Returned'

-- 8 books --
SELECT 
	b.title,
	COUNT(b.title) as Cant_recibida 
from cust_order co 
inner join order_line ol 
on ol.order_id = co.order_id 
inner join book b 
on ol.book_id = b.book_id 
inner join order_history oh 
on oh.order_id = co.order_id 
inner join order_status os 
on os.status_id = oh.status_id 
WHERE os.status_value = 'Order Received'
GROUP BY b.title HAVING COUNT(b.title)>1 

-- 9 books --
SELECT 
	c.first_name,
	COUNT(c.first_name) as Freq
FROM cust_order co 
inner join customer c 
on c.customer_id = co.customer_id 
GROUP BY c.first_name HAVING COUNT(c.first_name)>1
ORDER BY Freq DESC

-- 10 books --
SELECT TOP 2
	Month(co.order_date) as Mes,
	COUNT(co.order_date) as Pedidos
FROM order_line ol 
inner join cust_order co 
on co.order_id = ol.order_id 
GROUP BY MONTH(co.order_date) HAVING COUNT(co.order_date)>1 
ORDER BY Pedidos DESC 