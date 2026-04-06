-- =====================================================
-- ESQUEMA REFINADO PARA E-COMMERCE
-- =====================================================

create database finest_ecommerce;
use finest_ecommerce;

-- Tabela cliente: agora com tipo PF ou PJ
create table clients(
	idClient int auto_increment primary key,
	Fname varchar(15),
	Minit char(3),
	Lname varchar(20),
	CPF char(11) unique,
	CNPJ char(15) unique,
	Address varchar(255),
	tipoCliente enum('PF', 'PJ') not null,
	constraint check_cpf_cnpj check (
		(tipoCliente = 'PF' and CPF is not null and CNPJ is null) or
		(tipoCliente = 'PJ' and CNPJ is not null and CPF is null)
	)
);

-- Tabela produto (mantida)
create table product(
	idProduct int auto_increment primary key,
	Pname varchar(50) not null,
	Classification_kids boolean default false,
	Category enum('Eletronicos', 'Roupas', 'Brinquedos', 'Alimentos', 'Moveis') not null,
	Evaluation float default 0,
	size varchar(10)
);

-- Tabela pagamento: múltiplas formas por cliente
create table payment(
	idPayment int auto_increment primary key,
	idClient int not null,
	tipoPagamento enum('Cartão de Crédito', 'Cartão de Débito', 'Boleto', 'Pix', 'Dinheiro') not null,
	limite_disponivel decimal(10,2),
	numero_cartao varchar(20),
	validade date,
	foreign key (idClient) references clients(idClient)
);

-- Tabela pedido (com entrega)
create table orders(
	idOrder int auto_increment primary key,
	idOrderClient int,
	orderStatus enum('Em processamento', 'Confirmado', 'Cancelado', 'Entregue') default 'Em processamento',
	orderDescription varchar(255),
	sendValue float default 10,
	paymentCash boolean default false,
	codigo_rastreio varchar(50),
	status_entrega enum('Pedido realizado', 'Em separação', 'Enviado', 'Em transporte', 'Entregue') default 'Pedido realizado',
	foreign key (idOrderClient) references clients(idClient)
);

-- Tabela produto_pedido
create table productOrder(
	idPOproduct int,
	idPOorder int,
	poQuantity int default 1,
	poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
	primary key(idPOproduct, idPOorder),
	foreign key (idPOproduct) references product(idProduct),
	foreign key (idPOorder) references orders(idOrder)
);

-- Tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
	storageLocation varchar(255),
	quantity int default 0
);

-- Tabela localização_estoque
create table storageLocation(
	idLproduct int,
	idLstorage int,
	location varchar(255) not null,
	primary key (idLproduct, idLstorage),
	foreign key (idLproduct) references product(idProduct),
	foreign key (idLstorage) references productStorage(idProdStorage)
);

-- Tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
	socialName varchar(255) not null,
	CNPJ char(15) unique,
	contact char(11) not null
);

-- Tabela produto_fornecedor
create table productSupplier(
	idPsSupplier int,
	idPsProduct int,
	quantity int not null,
	primary key (idPsSupplier, idPsProduct),
	foreign key (idPsSupplier) references supplier(idSupplier),
	foreign key (idPsProduct) references product(idProduct)
);

-- Tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
	socialName varchar(255) not null,
	abstName varchar(255),
	CNPJ char(15) unique,
	CPF char(11) unique,
	location varchar(255),
	contact char(11) not null
);

-- Tabela produto_vendedor
create table productSeller(
	idPseller int,
	idPproduct int,
	prodQuantity int default 1,
	primary key(idPseller, idPproduct),
	foreign key(idPseller) references seller(idSeller),
	foreign key(idPproduct) references product(idProduct)
);