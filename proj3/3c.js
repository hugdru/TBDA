db.distritos.aggregate([{
    '$project': {
        '_id': 1,
        'nome': 1,
        'listas': 1
    }
}, {
    '$unwind': '$listas'
}, {
    '$sort': {
        'nome': 1,
        'listas.mandatos': -1
    }
}, {
    '$group': {
        '_id': '$_id',
        'nome': {
            '$first': '$nome'
        },
        'max_partido': {
            '$first': '$listas.partido'
        },
        'max_partido_mandatos': {
            '$first': '$listas.mandatos'
        },
        'sum_partidos_mandatos': {
            '$sum': '$listas.mandatos'
        }
    }
}, {
    '$project': {
        '_id': 1,
        'nome': 1,
        'partido': '$max_partido',
        'has_majority': {
            '$gt': ['$max_partido_mandatos', {
                '$subtract': ['$sum_partidos_mandatos', '$max_partido_mandatos']
            }]
        }
    }
}, {
    '$match': {
        'has_majority': {
            '$eq': true
        }
    }
}, ]);