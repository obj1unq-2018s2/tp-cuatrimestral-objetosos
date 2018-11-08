import oleadaMinions.*
import campeones.*


class AnilloDeDoran {
	
	var puedeActivarHabilidad = false
	
	method precio() = 100
	
	method habilidadActivable(campeon) { self.error("item no posee habilidad activable") }
	
	method vida(campeon) = 60
	
	method ataque(campeon) = 15 

	
	method equiparA(campeon){
		campeon.recibirDanio(5)
	}
	
	method desequiparA(campeon){		
		campeon.recibirDanio(-10)
	} 
}


class TomoAmplificador {
	
	var puedeActivarHabilidad = true
	
	method precio() = 500
	
	method habilidadActivable(campeon){
		if (puedeActivarHabilidad && campeon.dinero() < 500) {
			campeon.dinero(self.precio())
			puedeActivarHabilidad = false
		}
	}
	
	method vida(campeon) = campeon.danio() * 1.25
	
	method ataque(campeon) = campeon.danio() * 1.05
	
	method equiparA(campeon){
		campeon.recibirBloqueos(2)
	}
	
	method desequiparA(campeon){		
		campeon.recibirBloqueos(1)
		campeon.recibirDanio(30)
	}
}
 
class  SombreroDeRabadon inherits TomoAmplificador{
	override method precio() = super() + 100

	override method habilidadActivable(campeon){ self.error("item no posee habilidad activable") }
	
	override method vida(campeon){
		return super(campeon) + 5
	} 
	
	override method ataque(campeon){
		return campeon.ataqueBase() * 2 
	} 
	
	override method equiparA(campeon){
		super(campeon) 
		campeon.recibirDanio(5)
	}
	
	override method desequiparA(campeon){} 
}

class Pocion {
	var puedeActivarHabilidad = true
	var cantidad = 2
	method precio() = 50
	method vida(campeon) = 0
	method ataque(campeon) = 0
	method habilidadActivable(campeon){ 
		if (puedeActivarHabilidad && cantidad > 0) {
			campeon.puntosDeDanio(-50)
			cantidad = cantidad - 1
		}
	}
}
