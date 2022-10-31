use ecommerce;

-- Quantos pedido foram feitos por cada cliente?
select idCliente, primeiroNome, count(*) as Número_Pedidos from cliente 
inner join pedido on idCliente = cliente_idCliente
group by idCliente; 


-- Algum vendedor também é fornecedor?
select razaoSocialVendedor as Razão_Social_Vendedor, CNPJVendedor as CNPJ_Vendedor, razaoSocial as Razão_Social_Fornecedor, CNPJ as CNPJ_Fornecedor
from vendedor, fornecedor
where CNPJVendedor = CNPJ;


-- Relação de produtos e fornecedor:
select idProduto, nomeProduto, f.razaoSocial, f.CNPJ from produto
		inner join produtos_fornecedor on idProduto = produto_idProduto
        inner join fornecedor f on idFornecedor = fornecedor_idFornecedor;
        
        
-- Relação de Produto e Estoque:
select idProduto, nomeProduto, idEstoque, localEstoque, quantidadeEstoque from produto
		inner join produtos_em_estoque pe on idProduto = produto_idProduto
        inner join estoque e on idEstoque = estoque_idEstoque
        order by idEstoque;


-- Relação de nomes dos fornecedores e nome dos produtos
select razaoSocial as Razão_Social, nomeProduto as Nome_Produto, quantidadeProdutosFornecedor as Qtdade_Produtos from fornecedor
		inner join produtos_fornecedor on idFornecedor = fornecedor_idFornecedor
        inner join produto on idProduto = produto_idProduto
        order by razaoSocial;


-- Relação de produtos com estoque menor que 50 
select nomeProduto, quantidadeEstoque from produto
		inner join estoque pe on idProduto = idEstoque
        having quantidadeEstoque < 50
        order by quantidadeEstoque;
