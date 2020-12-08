# language:pt
 
@javascript
Funcionalidade: Visualizar informações do Portfólio
    Visualizar as informações do Portfólio

    Cenário de Fundo:
        Dado usuário está logado
		E possui o portfólio com slug 'my_portfolio'
        E o portfólio possui 1 Sobre
        E o portfólio possui 1 Informação Adicional
        E o portfólio possui 1 Educação
        E o portfólio possui 1 Experiência
        E o portfólio possui 1 Hobbies
        E o portfólio possui 1 Linguagens
        E o portfólio possui 1 Habilidades
        E o portfólio possui 1 Rede Social

    Cenário: Usuário acessa o portfólio
        Quando acessa o portfólio com slug 'my_portfolio'
        Então todos os blocos criados são exibidos