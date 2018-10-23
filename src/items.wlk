import oleadaMinions.*
import campeones.*



class AnilloDeDoran {
	
	var _campeon 
	
	method vida() = 60
	
	method ataque() = 15 

	
	method equiparA(campeon){
		_campeon = campeon
		campeon.recibirDanio(5)
	}
	
	method desequiparA(campeon){		
		campeon.recibirDanio(-10)
		_campeon = null
	} 
}


class TomoAmplificador {
	
	var _campeon 
	
	method vida() = _campeon.danio()*1.25
	
	method ataque() = _campeon.danio()*1.05
	
	method equiparA(campeon){
		_campeon = campeon
		campeon.recibirBloqueos(2)
	}
	
	method desequiparA(campeon){		
		campeon.recibirBloqueos(1)
		campeon.recibirDanio(30)
		_campeon = null
	} 
}

class  SombreroDeRabadon inherits TomoAmplificador{
	override method vida(){
		return super() + 5
	} 
	
	override method ataque(){
		return _campeon.ataqueBase() * 2 
	} 
	
	
	override method desequiparA(campeon){} 
}