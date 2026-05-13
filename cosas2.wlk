object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultos() = 1
    
    method registrarCarga(){}
}
object bumblebee{
    var estaTransformadoEnRobot = false

    method peso() = 800
    method peligrosidad() = if (self.estaTransformadoEnRobot()) 30 else 15
    method bultos() = 2

    method estaTransformadoEnRobot() = estaTransformadoEnRobot
    method transformarseEnRobot(){
        estaTransformadoEnRobot = true
    }
    method transformarseEnAuto(){
        estaTransformadoEnRobot = false
    }
    method registrarCarga(){
        self.transformarseEnRobot()
    }
}
object paqueteLadrillos{
    var cantLadrillos = 1
    
    method peso() = 2 * cantLadrillos
    method peligrosidad() = 2
    method bultos(){
        if (cantLadrillos <= 100){
            return 1
        }
        else if(cantLadrillos.between(101, 300)){
            return 2
        }
        else{
            return 3
        }
    }

    method agregarLadrillos(cant){
        cantLadrillos += cant
    }
    method registrarCarga(){
        self.agregarLadrillos(12)
    }
}
object arenaGranel{
    var peso = 10
    
    method peligrosidad() = 1
    method bultos() = 1

    method agregarPeso(cant){
        peso += peso
    }
    method quitarPeso(cant){
        peso -= cant
    }
    method registrarCarga(){
        self.quitarPeso(10)
    }
}
object bateriaAntiaerea{
    var tieneMisiles = false
    method tieneMisiles() = tieneMisiles
    method peso() = if (tieneMisiles) 300 else 200
    method peligrosidad() = if (tieneMisiles) 100 else 0
    method bultos() = if(tieneMisiles) 2 else 1

    method cargarMisiles(){
        tieneMisiles = true
    }
    method descargarMisiles(){
        tieneMisiles = false
    }
    method registrarCarga(){
        self.cargarMisiles()
    }
}
object contenedorPortuario{
    const cosas = []

    method peso() = 100 + cosas.sum({c => c.peso()})
    method peligrosidad() = if (cosas.isEmpty()) 0 else self.cosaConPeligrosidadMasAlta().peligrosidad()
    method cosaConPeligrosidadMasAlta() = cosas.max({c => c.peligrosidad()})
    // method peligrosidadDeLasCosas() = cosas.map({c => c.peligrosidad()})
    method bultosContenidos() = cosas.sum({c => c.bultos()})
    method bultos() = 1 + self.bultosContenidos()

    method cargar(cosa){
        cosas.add(cosa)
    }
    method descargar(cosa){
        cosas.remove(cosa)
    }

    method registrarCarga(){
        cosas.forEach({c => c.registrarCarga()})
    }
}
object residuosRadioactivos{
    var peso = 100
    
    method peligrosidad() = 200
    method bultos() = 1

    method agregarPeso(cant){
        peso += cant
    }
    method quitarPeso(cant){
        peso -= cant
    }
    method registrarCarga(){
        self.agregarPeso(15)
    }
}
object embalaje{
    var property cosaEmbalada = residuosRadioactivos

    method peso() = cosaEmbalada.peso()
    method peligrosidad() = cosaEmbalada.peligrosidad()/2
    method bultos() = 2

    method registrarCarga(){}
}