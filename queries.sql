use finest_ecommerce;

-- 1. Recuperação simples7
SELECT idProduct, productName, category, rating FROM product;

-- 2. Filtro com WHERE
SELECT productName, rating FROM product 
WHERE isKids = TRUE AND rating > 4.0;

-- 3. Atributos derivados (valor total do pedido)
SELECT o.idOrder, 
       SUM(po.quantity * p.rating) AS subtotal,
       o.shippingValue AS shipping,
       (SUM(po.quantity * p.rating) + o.shippingValue) AS total_value
FROM orders o
JOIN productOrder po ON o.idOrder = po.idOrder
JOIN product p ON po.idProduct = p.idProduct
GROUP BY o.idOrder;

-- 4. Ordenação
SELECT productName, rating FROM product ORDER BY rating DESC;

-- 5. HAVING (clientes com mais de 1 pedido)
SELECT c.idClient, c.firstName, COUNT(o.idOrder) AS total_orders
FROM clients c
JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient
HAVING COUNT(o.idOrder) > 1;

-- 6. Junção complexa
SELECT p.productName AS product,
       s.corporateName AS supplier,
       ps.supplyQuantity AS supplied_quantity,
       pst.storageLocation AS warehouse,
       sl.locationDetails AS shelf_location
FROM product p
JOIN productSupplier ps ON p.idProduct = ps.idProduct
JOIN supplier s ON ps.idSupplier = s.idSupplier
LEFT JOIN storageLocation sl ON p.idProduct = sl.idProduct
LEFT JOIN productStorage pst ON sl.idStorage = pst.idStorage
ORDER BY p.productName;