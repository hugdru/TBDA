db.distritos.aggregate([{
    $project: {
        'concelhos.nome': 1,
        'concelhos.freguesias': 1
    }
}, {
    $unwind: '$concelhos'
}, {
    $match: {
        'concelhos.nome': 'Lisboa'
    }
}, {
    $unwind: '$concelhos.freguesias'
}, {
    $unwind: '$concelhos.freguesias.votacoes'
}, {
    $match: {
        'concelhos.freguesias.votacoes.partido': 'CDSPP'
    }
}, {
    $project: {
        nome: '$concelhos.freguesias.nome',
        votos: '$concelhos.freguesias.votacoes.votos'
    }
}, {
    $sort: {
        votos: -1
    }
}]);