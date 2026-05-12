object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}
object bumblebee{
    var estaTransformadoEnRobot = false
    method peso() = 800
    method peligrosidad() = if (self.estaTransformadoEnRobot()) 30 else 15

    method estaTransformadoEnRobot() = estaTransformadoEnRobot
    method transformarse(){
        estaTransformadoEnRobot = !estaTransformadoEnRobot
    }
}
object paqueteLadrillos{
    var property cantLadrillos = 1
    
    method peso() = 2 * cantLadrillos
    method peligrosidad() = 2
}
object arenaGranel{
    var property peso = 10
    method peligrosidad() = 1
}
object bateriaAntiaerea{
    var tieneMisiles = false

    method peso() = if (tieneMisiles) 300 else 200
    method peligrosidad() = if (tieneMisiles) 100 else 0

    method cargarMisiles(){
        tieneMisiles = true
    }
    method descargarMisiles(){
        tieneMisiles = false
    }
}
object contenedorPortuario{
    const cosas = []

    method peso() = 100 + cosas.sum({c => c.peso()})
    method peligrosidad() = if (cosas.isEmpty()) 0 else self.cosaConPeligrosidadMasAlta().peligrosidad()
    method cosaConPeligrosidadMasAlta() = cosas.max({c => c.peligrosidad()})
    // method peligrosidadDeLasCosas() = cosas.map({c => c.peligrosidad()})

    method cargar(cosa){
        cosas.add(cosa)
    }
    method descargar(cosa){
        cosas.remove(cosa)
    }
}
object residuosRadioactivos{
    var property peso = 100
    method peligrosidad() = 200
}
object embalaje{
    var property cosaEmbalada = residuosRadioactivos

    method peso() = cosaEmbalada.peso()
    method peligrosidad() = cosaEmbalada.peligrosidad()/2
}