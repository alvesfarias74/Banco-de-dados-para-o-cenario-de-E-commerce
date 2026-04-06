-- Criação do banco de dados para o cenário de E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- Criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
	Fname varchar(15),
	Minit char(3),
	Lname varchar(20),
	CPF char(11) not null,
	Address varchar(30),
	constraint unique_cpf_client unique(CPF)
);
alter table clients auto_increment=1;
-- desc clients;

-- Criar tabela produto
-- size equivale a dimensão do produto
create table product(
	idProduct int auto_increment primary key,
	Pname varchar(15) not null,
	Classification_kids boolean default false,
	Category enum('Eletronicos', 'Roupas', 'Brinquedos', 'Alimentos', 'Moveis') not null,
	Evaluation float default 0,
	size varchar(10)
);
desc product;

-- Criar tabela pagamento
CREATE TABLE payments(
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idOrder INT NOT NULL,
    paymentMethod ENUM('Cartão de Crédito', 'Cartão de Débito', 'Boleto', 'Pix', 'Dinheiro') NOT NULL,
    installments INT DEFAULT 1,
    paymentValue DECIMAL(10,2) NOT NULL,
    paymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    paymentStatus ENUM('Pendente', 'Aprovado', 'Cancelado', 'Estornado') DEFAULT 'Pendente',
    CONSTRAINT fk_payment_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder) ON DELETE CASCADE
);
desc payments;

-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama esquema relacional
-- criar constraints relacionadas ao pagamento
      
-- Criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
	idOrderClient int,
	orderStatus enum('Em processamento', 'Confirmado', 'Cancelado', 'Entregue') default 'Em processamento',
	orderDescription varchar(255),
	sendValue float default 10,
	paymentCash boolean default false,
	constraint fk_orders_client foreign key(idOrderClient) references clients(idClient)
		on update cascade
);
desc orders;

-- Criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
	storageLocation varchar(255),
	quantity int default 0
);

-- Criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
	socialName varchar(255) not null,
    CNPJ char(15),
	contact char(11) not null,
    constraint unique_supplier unique(CNPJ)
);
desc supplier;

-- Criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
	socialName varchar(255) not null,
    abstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
	contact char(11) not null,
    constraint unique_CNPJ_seller unique(CNPJ),
    constraint unique_CPF_seller unique(CPF)
);
desc seller;

-- Criar tabela produtos_vendedor
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key(idPseller, idPproduct),
    constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
    constraint fk_product_product foreign key(idPproduct) references product(idProduct)    
);
desc productSeller;

create table productOrder(
	idPOproduct int,
	idPOorder int,
	poQuantity int default 1,
	poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
	primary key(idPOproduct, idPOorder),
	constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
	constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);
desc productOrder;

create table storageLocation(
	idLproduct int,
	idLstorage int,
	location varchar(255) not null,
	primary key (idLproduct, idLstorage),
	constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
	constraint fk_product_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);
desc storageLocation;

create table productSupplier(
	idPsSupplier int,
	idPsProduct int,
	quantity int not null,
	primary key (idPsSupplier, idPsProduct),
	constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
	constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);
desc productSupplier;

show tables;

show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';