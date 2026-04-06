use finest_ecommerce;

-- Inserindo clientes (PF e PJ)
INSERT INTO clients (firstName, middleInit, lastName, cpf, cnpj, address, clientType)
	VALUES('João', 'S', 'Silva', '12345678901', NULL, 'Rua A, 123', 'PF'),
		  ('Maria', 'A', 'Oliveira', '23456789012', NULL, 'Av B, 456', 'PF'),
		  ('Carlos', 'R', 'Pereira', '34567890123', NULL, 'Travessa C, 789', 'PF'),
		  ('Ana', 'C', 'Souza', '45678901234', NULL, 'Praça D, 101', 'PF'),
		  ('Paulo', 'M', 'Lima', '56789012345', NULL, 'Alameda E, 202', 'PF'),
		  ('Fernanda', 'K', 'Costa', '67890123456', NULL, 'Rodovia F, 303', 'PF'),
		  ('Ricardo', 'L', 'Alves', '78901234567', NULL, 'Viela G, 404', 'PF'),
		  ('Juliana', 'P', 'Martins', '89012345678', NULL, 'Largo H, 505', 'PF'),
		  ('Roberto', 'N', 'Rodrigues', '90123456789', NULL, 'Estrada I, 606', 'PF'),
		  ('Cristina', 'F', 'Gomes', '01234567890', NULL, 'Avenida J, 707', 'PF');

-- Inserindo clientes PJ (Pessoa Jurídica) - exemplo adicional para demonstrar o novo formato
INSERT INTO clients (firstName, middleInit, lastName, cpf, cnpj, address, clientType)
	VALUES(NULL, NULL, 'Tech Solutions Ltda', NULL, '11222333000181', 'Av Tecnológica, 1000', 'PJ'),
		  (NULL, NULL, 'Moda Fashion SA', NULL, '99888777000166', 'Rua das Modas, 500', 'PJ'),
		  ('Empresa XYZ', NULL, NULL, NULL, '12345678000199', 'Rodovia C, 1000', 'PJ');


-- Inserindo produtos
INSERT INTO product (productName, isKids, category, rating, size)
	VALUES('Smartphone', FALSE, 'Eletronicos', 4.5, '15cm'),
		  ('Camiseta', FALSE, 'Roupas', 4.2, 'M'),
		  ('Boneca', TRUE, 'Brinquedos', 4.8, '30cm'),
		  ('Arroz', FALSE, 'Alimentos', 4.0, '1kg'),
		  ('Sofá', FALSE, 'Moveis', 4.7, '2m');

-- Inserindo formas de pagamento
INSERT INTO payment (idClient, paymentType, cardLimit, cardNumber, expirationDate)
	VALUES(1, 'Credit Card', 5000.00, '1111222233334444', '2028-12-31'),
		  (1, 'Pix', NULL, NULL, NULL),
		  (2, 'Debit Card', 2000.00, '5555666677778888', '2027-10-31'),
		  (3, 'Boleto', NULL, NULL, NULL);

-- Inserindo pedidos com entrega
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, shippingValue, isCashPayment, trackingCode, deliveryStatus)
	VALUES(1, 'Confirmed', 'Pedido de smartphone', 15.00, FALSE, 'BR123456789', 'Shipped'),
		  (2, 'Delivered', 'Camiseta e boneca', 20.00, TRUE, 'BR987654321', 'Delivered'),
		  (3, 'Processing', 'Arroz e sofá', 30.00, FALSE, NULL, 'Order placed');

-- Inserindo produtos nos pedidos
INSERT INTO productOrder (idProduct, idOrder, quantity, availabilityStatus)
	VALUES(1, 1, 1, 'Available'),
		  (2, 2, 2, 'Available'),
		  (3, 2, 1, 'Available'),
		  (4, 3, 3, 'Available'),
		  (5, 3, 1, 'Available');

-- Inserindo fornecedores
INSERT INTO supplier (corporateName, cnpj, contactPhone)
	VALUES('TechFornece Ltda', '12345678000199', '11999999999'),
		  ('ModaBrasil', '23456789000188', '11988888888');

-- Inserindo produtos_fornecedores
INSERT INTO productSupplier (idSupplier, idProduct, supplyQuantity)
	VALUES(1, 1, 50),
		  (1, 4, 30),
		  (2, 2, 100);

-- Inserindo vendedores
INSERT INTO seller (corporateName, tradingName, cnpj, cpf, location, contactPhone)
	VALUES('VendeTudo Online', 'VTO', '12345678000112', NULL, 'São Paulo', '11944444444'),
		  ('ModaExpress', 'ME', NULL, '12345678901', 'Rio de Janeiro', '11933333333');

-- Inserindo produtos_vendedores
INSERT INTO productSeller (idSeller, idProduct, stockQuantity)
	VALUES(1, 1, 10),
		  (1, 3, 5),
		  (2, 2, 20);

-- Inserindo estoques
INSERT INTO productStorage (storageLocation, quantity)
	VALUES('Galpão A - SP', 100),
		  ('Galpão B - RJ', 50);

-- Inserindo localizações de estoque
INSERT INTO storageLocation (idProduct, idStorage, locationDetails)
	VALUES(1, 1, 'Prateleira A1'),
		  (2, 2, 'Prateleira B2'),
		  (3, 1, 'Prateleira A3');