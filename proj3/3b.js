db.distritos.aggregate([{
    $match: {
        nome: "Lisboa"
    }
}, {
    $project: {
        "concelhos.freguesias": 1
    }
}, {
    $unwind: "$concelhos"
}, {
    $unwind: "$concelhos.freguesias"
}, {
    $unwind: "$concelhos.freguesias.votacoes"
}, {
    $match: {
        "concelhos.freguesias.votacoes.partido": "CDSPP"
    }
}, {
    $project: {
        nome: "$concelhos.freguesias.nome",
        votos: "$concelhos.freguesias.votacoes.votos"
    }
}, {
    $sort: {
        votos: -1
    }
}]);