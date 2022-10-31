-- inserção de dados e queries
use ecommerce;
show tables;

desc cliente;
-- primeiroNome, nomeDoMeioInicial, sobrenome, cpf_cnpj, dataNascimento, rua, numero, bairro, cidade, estado, cep
insert into cliente (primeiroNome, nomeDoMeioInicial, sobrenome, cpf_cnpj, dataNascimento, rua, numero, bairro, cidade, estado, cep) 
	   values('Maria','M','Silva', 12346789, '1987-05-28', 'rua silva de prata', '29', 'Carangola', 'Cidade das flores', 'SP', '12345000'),
		     ('Matheus','O','Pimentel', 987654321,'1988-04-15','rua alemeda', '289', 'Centro', 'Cidade das flores', 'SP', '23456000'),
			 ('Ricardo','F','Silva', 45678913,'1992-10-05','avenida alemeda vinha', '1009', 'Centro', 'Cidade das flores', 'SP', '34567000'),
			 ('Julia','S','França', 789123456,'1968-02-02','rua lareijras', '861', 'Centro', 'Cidade das flores', 'SP', '45678000'),
			 ('Roberta','G','Assis', 98745631,'1978-05-16','avenidade koller', '19', 'Centro', 'Cidade das flores', 'SP', '56789000'),
			 ('Isabela','M','Cruz', 654789123,'1997-08-28','rua alemeda das flores', '28', 'Centro', 'Cidade das flores', 'SP', '67891000');

select * from cliente;

desc produto;
-- nomeProduto, classificacaoInfantil, categoria('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliacao, tamanho, valor
insert into produto (nomeProduto, classificacaoInfantil, categoria, avaliacao, tamanho, valor) values
							  ('Fone de ouvido',false,'Eletrônico','4',null, 130.00),
                              ('Barbie Elsa',true,'Brinquedos','3',null, 89.00),
                              ('Body Carters',true,'Vestimenta','5', 'único', 56.00),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null, 235.00),
                              ('Sofá retrátil',False,'Móveis','3','3x57x80', 1680.00),
                              ('Farinha de arroz',False,'Alimentos','2', '500g', 6.99),
                              ('Fire Stick Amazon',False,'Eletrônico','3',null, 2130.00 );
select * from produto;

desc pedido;
-- cliente_idCliente, statusPedido, descricao, frete
insert into pedido (cliente_idCliente, statusPedido, descricao, frete) values 
							 (1, default,'compra via aplicativo', 30),
                             (2,default,'compra via aplicativo', 50),
                             (3,'Confirmado',null,45),
                             (4,default,'compra via web site',150),
                             (1, default,'compra via aplicativo', 40);
select * from pedido;                             
							 

-- idProduto, idPedido, quantidadeProdutoPedido
insert into relacao_produto_pedido (produto_idProduto, pedido_idPedido, quantidadeProdutoPedido) values
						 (1,2,2),
                         (2,2,1),
                         (3,4,1),
                         (4,1,3);
select * from relacao_produto_pedido;

-- localEstoque,quantidadeEstoque
insert into estoque (localEstoque,quantidadeEstoque) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);
select * from estoque;

-- produto_idProduto, estoque_idEstoque
insert into produtos_em_estoque (produto_idProduto, estoque_idEstoque) values
						 (1,2),
                         (2,6),
                         (3,2),
                         (4,1),
                         (5,3),
                         (6,4),
                         (7,5);
select * from produtos_em_estoque;

desc fornecedor;
-- razaoSocial, CNPJ, contato
insert into fornecedor (razaoSocial, CNPJ, contato) values 
							('Almeida e filhos', 123456789123456,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Eletrônicos Valma', 934567893934695,'21975474');
select * from fornecedor;

desc produtos_fornecedor;
-- produto_idProduto, fornecedor_idFornecedor, quantidadeProdutosFornecedor
insert into produtos_fornecedor (produto_idProduto, fornecedor_idFornecedor, quantidadeProdutosFornecedor) values
						 (1,1,500),
                         (1,2,400),
                         (2,3,633),
                         (3,3,5),
                         (2,2,10),
						 (4,1,400),
                         (5,2,10),
                         (6,3,1000),
                         (7,1,80);

select * from produtos_fornecedor;

desc vendedor;
-- razaoSocialVendedor, CNPJVendedor, localVendedor, contatoVendedor
insert into vendedor (razaoSocialVendedor, CNPJVendedor, localVendedor, contatoVendedor) values 
						('Tech eletronics', 123456789456321, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas', 987654321951357, 'Rio de Janeiro', 219567895),
						('Kids World', 456789123654485, 'São Paulo', 1198657484);
select * from vendedor;

desc produtos_vendedor;
-- vendedor_idVendedor, produto_idProduto, quantidadeProdutoVendedor
insert into produtos_vendedor (vendedor_idVendedor, produto_idProduto, quantidadeProdutoVendedor) values 
						 (1,1,80),
                         (1,4,10),
                         (3,2,30);
select * from produtos_vendedor;