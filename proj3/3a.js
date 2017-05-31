// Aggregate
db.distritos.aggregate([{
    '$project': {
        'listas': 1
    }
}, {
    '$unwind': '$listas'
}, {
    '$group': {
        '_id': '$listas.partido',
        'total_mandatos': {
            '$sum': '$listas.mandatos'
        }
    }
}, {
    '$sort': {
        'total_mandatos': -1
    }
}]);

// Map-Reduce
db.distritos.mapReduce(function() {
    for (var i = 0; i < this.listas.length; i++) {
        var element = this.listas[i];
        var key = element.partido;
        var value = element.mandatos;
        emit(key, value);
    }
}, function(partido, array_partido_mandatos) {
    return Array.sum(array_partido_mandatos)
}, {
    out: {
        inline: 1
    }
});