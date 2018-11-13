import oleadaMinions.*
import campeones.*

class Item {
	
	method vida(campeon) = 0
	method ataque(campeon) = 0
	
	method equiparA(campeon){}
	method desequiparA(campeon){}
	
	method habilidad(campeon){}
	
	method precio() = 0
	
		
}

class AnilloDeDoran inherits Item{
	
	override method vida(campeon) = 60
	
	override method ataque(campeon) = 15 

	
	override method equiparA(campeon){
		campeon.recibirDanio(5)
	}
	
	override method desequiparA(campeon){		
		campeon.recibirDanio(-10)
	} 
	
	override method precio() = 300
}


class TomoAmplificador inherits Item {
	
	override method vida(campeon) = campeon.danio() * 0.25
	
	override method ataque(campeon) = campeon.danio() * 0.05
	
	override method equiparA(campeon){
		campeon.recibirBloqueos(2)
	}
	
	override method desequiparA(campeon){		
		campeon.recibirBloqueos(1)
		campeon.recibirDanio(30)
	}
	
	override method precio() = 500
	
	override method habilidad(campeon){
		if(campeon.dinero() < 500){
				campeon.dinero(500)
			}
	}
	
	
}

class  SombreroDeRabadon inherits TomoAmplificador{
	override method vida(campeon) =  super(campeon) + 5
	
	override method ataque(campeon)= campeon.ataqueBase() * 2 
	
	override method equiparA(campeon){
		super(campeon) 
		campeon.recibirDanio(5)
	}
	
	override method precio() = super() + 100 
	
}

class PocionDeVida inherits Item{
	var usos =  2

	override method precio() = 50
	

	override method habilidad(campeon){
		if(usos > 0){
				campeon.recibirDanio(-50)
				usos -= 1
			}
	}
	
}


class BastonDelVacio inherits Item{
	const property materiales = []
	
	override method vida(campeon) = materiales.size() / 2
	
	override method ataque(campeon) = materiales.sum{material => material.ataque(campeon)}
	
	override method habilidad(campeon){
		materiales.forEach{material => material.habilidad(campeon)}
	}
}
