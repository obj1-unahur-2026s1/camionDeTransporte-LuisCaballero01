object camion {
    const cosas = []

    method pesoDeLaCarga() = cosas.sum({c => c.peso()})
    method peso() = 1000 + self.pesoDeLaCarga()
    method todoPesaPar() = cosas.all({c => c.peso().even()})
    method algoPesa(unPeso) = cosas.any({c => c.peso() == unPeso})
    method cargaDePeligrosidad(nivelPeligrosidad) = cosas.find({c => c.peligrosidad() == nivelPeligrosidad})
    method cosasQueSuperenPeligrosidad(nivelPeligrosidad) = cosas.filter({c => c.peligrosidad() > nivelPeligrosidad})
    method cosasMasPeligrosasQue(unaCosa) = cosas.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
    method estaExcedidoEnPeso() = self.peso() > 2500
    method puedeCircularEnRuta(nivelPeligrosidadMaximo) = !self.estaExcedidoEnPeso().and(self.cosasQueSuperenPeligrosidad(nivelPeligrosidadMaximo).isEmpty())


    method cargar(cosa){
        cosas.add(cosa)
    }
    method descargar(cosa){
        cosas.remove(cosa)
    }
    
}