#language:pt
Funcionalidade: Validar API
    Sendo um usuario
    Posso consultar filmes
    Para assistir

    @Pesquisarfilmes
    Cenario: Pesquisar Titulo dos Filmes
        Dado que informo o nome do diretor e produtor:
            | diretor   | George Lucas  |
            | produtor  | Rick McCallum |
        Quando faço uma chamada na API do swapi