# language:pt
 
@javascript
Funcionalidade: Adicionar redes sociais ao Portfólio
	Adiciona uma nova rede social ao Portfólio
 
	Cenário de Fundo:
		Dado usuário está logado
		E possui o portfólio com slug 'my_portfolio'
		E o portfólio possui um bloco de Rede Social
		E acessa a página de edição do portfólio
 
	Cenário: Usuário adiciona uma nova rede social ao Portfolio
		Quando adiciona uma Rede Social
		Então a Rede Social é adicionada ao Portfólio