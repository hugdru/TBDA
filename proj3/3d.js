db.distritos.aggregate([{
    '$project': {
      	"nome": 1,
      	"concelhos.nome": 1,
        "concelhos.freguesias": 1
    }
}, {
    '$unwind': "$concelhos"
}, {
    '$unwind': "$concelhos.freguesias"
}, {
    '$unwind': "$concelhos.freguesias.votacoes"
}, {
	'$group': {
		'_id': {
			'distrito': '$nome',
			'concelho': '$concelhos.nome',
			'partido': '$concelhos.freguesias.votacoes.partido'
		},
		'votos_distrito_partido_concelho': {'$sum': '$concelhos.freguesias.votacoes.votos'} 
	}
}, {
	'$sort': {
		'_id.distrito': 1,
		'_id.concelho': 1,
		'votos_distrito_partido_concelho': -1
	}
}]);