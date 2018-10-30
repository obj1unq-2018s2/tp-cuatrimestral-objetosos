import oleadaMinions.*
import campeones.*

class AnilloDeDoran {
	
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