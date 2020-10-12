# language:pt

Funcionalidade: Listar Portifólios
    Portifólios do usuário são exibidos ao acessar a lista de portifólios

    Cenário de Fundo:
        Dado usuário está logado

    Cenário: Usuário logado com portifólios cadastrados
        E possui 5 portifólios cadastrados
        Quando acessa a lista de portifólios
        Então os 5 portifólios são listados

    Cenário: Usuário logado e sem portifólios cadastrados
        E possui 0 portifólios cadastrados
        Quando acessa a lista de portifólios
        Então nenhum portifólio é listado

    Cenário: Usuário não está logado
        E possui 5 portifólios cadastrados
        Quando faz o logout
        E acessa a lista  de portifólios
        Então volta para página de login