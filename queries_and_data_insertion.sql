-- =====================================================
-- SCRIPT DE INSERÇÃO DE DADOS - ECOMMERCE
-- =====================================================

use ecommerce;

-- 1. Inserir dados na tabela clients (independente)
INSERT INTO clients (Fname, Minit, Lname, CPF, Address) VALUES
('João', 'S', 'Silva', '12345678901', 'Rua A, 123'),
('Maria', 'A', 'Oliveira', '23456789012', 'Av B, 456'),
('Carlos', 'R', 'Pereira', '34567890123', 'Travessa C, 789'),
('Ana', 'C', 'Souza', '45678901234', 'Praça D, 101'),
('Paulo', 'M', 'Lima', '56789012345', 'Alameda E, 202'),
('Fernanda', 'K', 'Costa', '67890123456', 'Rodovia F, 303'),
('Ricardo', 'L', 'Alves', '78901234567', 'Viela G, 404'),
('Juliana', 'P', 'Martins', '89012345678', 'Largo H, 505'),
('Roberto', 'N', 'Rodrigues', '90123456789', 'Estrada I, 606'),
('Cristina', 'F', 'Gomes', '01234567890', 'Avenida J, 707');

-- 2. Inserir dados na tabela product (independente)
INSERT INTO product (Pname, Classification_kids, Category, Evaluation, size) VALUES
('Smartphone', false, 'Eletronicos', 4.5, '15cm'),
('Camiseta', false, 'Roupas', 4.2, 'M'),
('Boneca', true, 'Brinquedos', 4.8, '30cm'),
('Arroz', false, 'Alimentos', 4.0, '1kg'),
('Sofá', false, 'Moveis', 4.7, '2m'),
('Notebook', false, 'Eletronicos', 4.9, '35cm'),
('Calça Jeans', false, 'Roupas', 4.3, '42'),
('Carrinho', true, 'Brinquedos', 4.6, '25cm'),
('Feijão', false, 'Alimentos', 3.9, '500g'),
('Mesa', false, 'Moveis', 4.5, '1.5m');

-- 3. Inserir dados na tabela supplier (independente)
INSERT INTO supplier (socialName, CNPJ, contact) VALUES
('TechFornece Ltda', '12345678000199', '11999999999'),
('ModaBrasil', '23456789000188', '11988888888'),
('BrinqMundo', '34567890000177', '11977777777'),
('AlimCenter', '45678901000166', '11966666666'),
('MobHouse', '56789012000155', '11955555555'),
('EletroSuprimentos', '67890123000144', '11944444444'),
('Vestuário Sul', '78901234000133', '11933333333'),
('BrinqMaster', '89012345000122', '11922222222');

-- 4. Inserir dados na tabela seller (independente)
INSERT INTO seller (socialName, abstName, CNPJ, CPF, location, contact) VALUES
('VendeTudo Online', 'VTO', '12345678000112', NULL, 'São Paulo', '11944444444'),
('ModaExpress', 'ME', NULL, '12345678901', 'Rio de Janeiro', '11933333333'),
('CasaBrinquedos', 'CB', '23456789000123', NULL, 'Belo Horizonte', '11922222222'),
('TechSellers', 'TS', '34567890000134', NULL, 'Curitiba', '11911111111'),
('MercadoPopular', 'MP', NULL, '23456789012', 'Porto Alegre', '11900000000');

-- 5. Inserir dados na tabela productStorage (independente)
INSERT INTO productStorage (storageLocation, quantity) VALUES
('Galpão A - SP', 100),
('Galpão B - RJ', 50),
('Galpão C - MG', 200),
('Galpão D - RS', 75),
('Galpão E - BA', 150);

-- 6. Inserir dados na tabela orders (dependente de clients)
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES
(1, 'Confirmado', 'Pedido de smartphone', 15.00, false),
(2, 'Em processamento', 'Camiseta e boneca', 20.00, true),
(3, 'Entregue', 'Arroz e sofá', 30.00, false),
(4, 'Cancelado', 'Apenas arroz', 10.00, false),
(5, 'Confirmado', 'Sofá', 25.00, true),
(6, 'Em processamento', 'Notebook e mesa', 18.00, false),
(7, 'Entregue', 'Calça jeans', 12.00, true),
(8, 'Confirmado', 'Carrinho e boneca', 22.00, false),
(9, 'Cancelado', 'Feijão', 8.00, false),
(10, 'Em processamento', 'Smartphone e carrinho', 20.00, true);

-- 7. Inserir dados na tabela payments (dependente de orders)
INSERT INTO payments (idOrder, paymentMethod, installments, paymentValue, paymentDate, paymentStatus) VALUES
(1, 'Cartão de Crédito', 3, 115.00, '2024-01-15 10:30:00', 'Aprovado'),
(2, 'Dinheiro', 1, 70.00, '2024-01-16 14:20:00', 'Aprovado'),
(3, 'Pix', 1, 130.00, '2024-01-17 09:45:00', 'Aprovado'),
(4, 'Cartão de Débito', 1, 10.00, '2024-01-18 16:00:00', 'Cancelado'),
(5, 'Cartão de Crédito', 2, 225.00, '2024-01-19 11:15:00', 'Aprovado'),
(6, 'Boleto', 1, 300.00, '2024-01-20 08:00:00', 'Pendente'),
(7, 'Dinheiro', 1, 50.00, '2024-01-21 13:30:00', 'Aprovado'),
(8, 'Pix', 1, 90.00, '2024-01-22 10:00:00', 'Aprovado'),
(9, 'Cartão de Crédito', 1, 8.00, '2024-01-23 15:45:00', 'Cancelado'),
(10, 'Cartão de Crédito', 4, 180.00, '2024-01-24 12:00:00', 'Aprovado');

-- 8. Inserir dados na tabela productSeller (dependente de seller e product)
INSERT INTO productSeller (idPseller, idPproduct, prodQuantity) VALUES
(1, 1, 10),   -- Vendedor 1 vende produto 1 (Smartphone)
(1, 2, 20),   -- Vendedor 1 vende produto 2 (Camiseta)
(2, 3, 15),   -- Vendedor 2 vende produto 3 (Boneca)
(3, 4, 5),    -- Vendedor 3 vende produto 4 (Arroz)
(2, 5, 8),    -- Vendedor 2 vende produto 5 (Sofá)
(4, 6, 12),   -- Vendedor 4 vende produto 6 (Notebook)
(5, 7, 25),   -- Vendedor 5 vende produto 7 (Calça Jeans)
(3, 8, 18),   -- Vendedor 3 vende produto 8 (Carrinho)
(5, 9, 30),   -- Vendedor 5 vende produto 9 (Feijão)
(4, 10, 7),   -- Vendedor 4 vende produto 10 (Mesa)
(1, 6, 5),    -- Vendedor 1 também vende Notebook
(2, 8, 10);   -- Vendedor 2 também vende Carrinho

-- 9. Inserir dados na tabela productOrder (dependente de product e orders)
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
(1, 1, 1, 'Disponível'),
(2, 2, 2, 'Disponível'),
(3, 2, 1, 'Disponível'),
(4, 3, 3, 'Sem estoque'),
(5, 5, 1, 'Disponível'),
(6, 6, 1, 'Disponível'),
(7, 7, 1, 'Disponível'),
(8, 8, 2, 'Disponível'),
(3, 8, 1, 'Disponível'),
(9, 9, 2, 'Sem estoque'),
(10, 6, 1, 'Disponível'),
(1, 10, 1, 'Disponível'),
(8, 10, 1, 'Disponível'),
(4, 4, 1, 'Sem estoque'),
(5, 3, 1, 'Disponível');

-- 10. Inserir dados na tabela storageLocation (dependente de product e productStorage)
INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
(1, 1, 'Prateleira A1'),
(2, 2, 'Prateleira B2'),
(3, 3, 'Prateleira C3'),
(4, 1, 'Prateleira A2'),
(5, 2, 'Prateleira B5'),
(6, 4, 'Prateleira D1'),
(7, 5, 'Prateleira E2'),
(8, 3, 'Prateleira C5'),
(9, 1, 'Prateleira A3'),
(10, 4, 'Prateleira D4'),
(2, 5, 'Prateleira E1'),
(5, 3, 'Prateleira C1');

-- 11. Inserir dados na tabela productSupplier (dependente de supplier e product)
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
(1, 1, 50),   -- Fornecedor 1 fornece produto 1 (Smartphone)
(2, 2, 30),   -- Fornecedor 2 fornece produto 2 (Camiseta)
(3, 3, 20),   -- Fornecedor 3 fornece produto 3 (Boneca)
(4, 4, 100),  -- Fornecedor 4 fornece produto 4 (Arroz)
(5, 5, 10),   -- Fornecedor 5 fornece produto 5 (Sofá)
(6, 6, 40),   -- Fornecedor 6 fornece produto 6 (Notebook)
(7, 7, 60),   -- Fornecedor 7 fornece produto 7 (Calça Jeans)
(8, 8, 35),   -- Fornecedor 8 fornece produto 8 (Carrinho)
(4, 9, 80),   -- Fornecedor 4 fornece produto 9 (Feijão)
(5, 10, 15),  -- Fornecedor 5 fornece produto 10 (Mesa)
(1, 6, 25),   -- Fornecedor 1 também fornece Notebook
(2, 8, 20);   -- Fornecedor 2 também fornece Carrinho

-- =====================================================
-- CONSULTAS DE VERIFICAÇÃO (opcionais)
-- =====================================================

-- Verificar todos os inserts realizados
SELECT '=== TABELA: clients ===' AS '';
SELECT * FROM clients;

SELECT '=== TABELA: product ===' AS '';
SELECT * FROM product;

SELECT '=== TABELA: supplier ===' AS '';
SELECT * FROM supplier;

SELECT '=== TABELA: seller ===' AS '';
SELECT * FROM seller;

SELECT '=== TABELA: productStorage ===' AS '';
SELECT * FROM productStorage;

SELECT '=== TABELA: orders ===' AS '';
SELECT * FROM orders;

SELECT '=== TABELA: payments ===' AS '';
SELECT * FROM payments;

SELECT '=== TABELA: productSeller ===' AS '';
SELECT * FROM productSeller;

SELECT '=== TABELA: productOrder ===' AS '';
SELECT * FROM productOrder;

SELECT '=== TABELA: storageLocation ===' AS '';
SELECT * FROM storageLocation;

SELECT '=== TABELA: productSupplier ===' AS '';
SELECT * FROM productSupplier;

-- Estatísticas finais
SELECT '=== ESTATÍSTICAS FINAIS ===' AS '';
SELECT 'Total de clientes:' AS '', COUNT(*) FROM clients
UNION ALL
SELECT 'Total de produtos:', COUNT(*) FROM product
UNION ALL
SELECT 'Total de pedidos:', COUNT(*) FROM orders
UNION ALL
SELECT 'Total de pagamentos:', COUNT(*) FROM payments
UNION ALL
SELECT 'Total de fornecedores:', COUNT(*) FROM supplier
UNION ALL
SELECT 'Total de vendedores:', COUNT(*) FROM seller
UNION ALL
SELECT 'Total de estoques:', COUNT(*) FROM productStorage;

-- Mensagem final
SELECT '✅ SCRIPT EXECUTADO COM SUCESSO! Todos os dados foram inseridos corretamente.' AS 'Status';