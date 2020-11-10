#language:pt

@javascript
Funcionalidade: Remove Tags do Portfólio
    Remove tags do Portfólio

    Cenário de Fundo:
        Dado que existem as tags cadastradas
            | title  |
            | Ruby   |
        E usuário está logado
        E possui o portfólio com slug 'my_portofolio'
        E que o portfólio possui a tag 'Ruby'
        E acessa a página de edição do portfólio

    Cenário: Usuário remove uma Tag do Portfólio
        Quando remove uma tag 'Ruby'
        Então a tag 'Ruby' é removida do Portfólio