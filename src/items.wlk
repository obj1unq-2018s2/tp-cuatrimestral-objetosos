import oleadaMinions.*
import campeones.*

class AnilloDeDoran {
	var property activado
	
	method vida(campeon) = 60
	
	method ataque(campeon) = 15 

	
	method equiparA(campeon){
		campeon.recibirDanio(5)
	}
	
	method desequiparA(campeon){		
		campeon.recibirDanio(-10)
	} 
	
	method precio() = 300
	
	method habilidad(campeon){}
}


class TomoAmplificador {
	var property activado //BOOL
	
	method vida(campeon) = campeon.danio() * 0.25
	
	method ataque(campeon) = campeon.danio() * 0.05
	
	method equiparA(campeon){
		campeon.recibirBloqueos(2)
	}
	
	method desequiparA(campeon){		
		campeon.recibirBloqueos(1)
		campeon.recibirDanio(30)
	}
	
	method precio() = 500
	
	method habilidad(campeon){
		if(activado){
			if(campeon.dinero() < 500){
				campeon.dinero(500)
			}
		}
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
	
	override method precio() = super() + 100 
	
	override method habilidad(campeon){}
}

class PocionDeVida{
	var property activado //BOOL
	var usos =  2
	
	method vida(campeon) = 0
		
	method ataque(campeon) = 0
	
	method equiparA(campeon){}
	
	method desequiparA(campeon){}
	
	method precio() = 50
	
	method habilidad(campeon){
		if(activado){
			if(usos > 0){
				campeon.recibirDanio(-50)
				usos -= 1
			}else{}
		}
	}	
}
