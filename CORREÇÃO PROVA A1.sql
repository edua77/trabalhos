create table tb_produto(
id_produto number (6),
nm_produto varchar2 (40) constraint tb_produto_nm_produto_nn not null,
ds_unidade varchar2 (5) constraint tb_produto_ds_unidade_nn not null,
nr_preco number (12,2) constraint tb_produto_nr_preco_nn not null,
constraint tb_produto_id_produto_pk primary key (id_produto)
);

create table tb_cep(
id_cep varchar2 (8),
ds_endereco varchar2 (50) constraint tb_cep_ds_endereco_nn not null,
ds_bairro varchar2 (40) constraint tb_cep_ds_bairro_nn not null,
constraint tb_cep_id_cep_pk primary key (id_cep)
);

create table tb_clientes(
id_cliente number (7),
nm_cliente varchar2 (40) constraint tb_clientes_nm_cliente_nn not null,
nr_endereco number (5) constraint tb_clientes_nr_endereco_nn not null,
id_cep varchar2 (8),
constraint tb_clientes_id_clientee_pk primary key (id_cliente),
constraint tb_clientes_id_cep_fk foreign key (id_cep) references tb_cep (id_cep)
);

create table tb_pedidos(
id_pedidos number (9),
dt_venda date constraint tb_pedidos_dt_vendas_nn not null,
ds_observacao varchar2 (40),
id_cliente number (7),
constraint tb_pedidos_id_pedidos_pk primary key (id_pedidos),
constraint tb_pedidos_id_clientes_fk foreign key (id_cliente) references tb_clientes (id_cliente)
);

--ERRO FOI NÃO CRIAR AS PRIMARY KEY'S--
create table tb_itens_pedidos(
id_pedidos number (9),
id_produto number (6),
nr_quantidade number (12,2) constraint tb_itens_pedidos_nr_quant_nn not null,
constraint tb_itens_pedidos_id_pedidos_fk foreign key (id_pedidos),
constraint tb_itens_pedidos_id_produto_fk foreign key (id_produto),
constraint tb_itens_pedidos_id_pedidos_fk foreign key (id_pedidos) references tb_pedidos (id_pedidos),
constraint tb_itens_pedidos_id_produto_fk foreign key (id_produto) references tb_produto (id_produto)
);

--CORRIGIDO--
create table tb_itens_pedidos(
id_pedidos number (9),
id_produto number (6),
nr_quantidade number (12,2) constraint tb_itens_pedidos_nr_quant_nn not null,
constraint tb_itens_pedidos_id_pedidos_pk primary key (id_pedidos, id_produto),
constraint tb_itens_pedidos_id_pedidos_fk foreign key (id_pedidos) references tb_pedidos (id_pedidos),
constraint tb_itens_pedidos_id_produto_fk foreign key (id_produto) references tb_produto (id_produto)
);

