#language:pt

@javascript
Funcionalidade: Criar novo Portfólio
    Criar um novo portfólio para ser gerenciado

    Cenário de Fundo:
        Dado usuário está logado
        E possui 2 portfólios cadastrados

    Cenário: Usário cria um novo portfólio
        E acessa a lista de portfólios
        Quando clica para criar um novo portfólio
        Então o usuário deve ter 3 portfólios cadastrados
        E é direcionado para a página de edição do portfólio
        E deve ver os dados iniciais do portfólios