import oleadaMinions.*
import campeones.*


// Pablo 
class AnilloDeDoran {
	
	method puntosVida(campeon) = 60
	
	method puntosAtaque() = 15 
	
	method puntosDanios() = 5
	
	method equiparA(campeon){
		// campeon recibe daño  en 5 
	}
	
	method desequiparA(campeon){
		// campeon recuepera 10 
	} 
}


class TomoAmplificador inherits Items{
	
	
	method puntosVida() = 
	
	method puntosAtaque() =  
	
	method puntosDanios() = 
	
	method equiparA(campeon){
		// campeon recibe 2 bloqueo
	}
	
	method desequipar(campeon){
		// campeon recibe 30 daños y 1 bloqueo
	} 
}

class  SombreroDeRabadon inherits TomoAmplificador{
	
}