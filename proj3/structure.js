// Estrutura das coleções

distritos = [{
    codigo: int,
    nome: string,
    regiao: string,
    concelhos: [{
        codigo: string,
        nome: string,
        freguesias: [{
            codigo: string,
            nome: string,
            votacoes: [{
                partido: string,
                votos: int
            }, {
                // ...
            }]
        }, {
            // ...
        }]
    }, {
        // ...
    }],
    participacoes: {
        inscritos: int,
        votantes: int,
        abstencoes: int,
        brancos: int,
        nulos: int
    },
    listas: [{
        partido: string,
        mandatos: string
    }, {
        // ...
    }]
}];

partidos = [{
    sigla: string,
    designacao: string
}, {
    // ...
}];