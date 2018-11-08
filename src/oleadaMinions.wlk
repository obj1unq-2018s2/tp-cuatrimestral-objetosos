import items.*
import campeones.*


class OleadaMinions{
	var property cantidadMinions
	var property plus
		
	method ataque() = if(self.oleadaViva()) cantidadMinions + plus else 0
	
	method recibirAtaque(danio) {
	  if(cantidadMinions > danio){
	 	 cantidadMinions -= danio
	 	 }
	 	 else {
	 	 	cantidadMinions = 0
	  }
	}
	
	method oleadaViva() = cantidadMinions > 0 
	
	method cantidadMinions() = cantidadMinions
	
	
	 
}

class EjercitoMinions {
	
	var property ejercito = []
	
	method recibirAtaque(danio) = ejercito.forEach{oleada => oleada.recibirAtaque(danio)}
		
	method ataque() = ejercito.sum{oleada => oleada.ataque()}
	
	method cantidadMinions() = ejercito.sum{oleada => oleada.cantidadMinions()}
	
	method ejercitoVivo() = ejercito.any{oleada => oleada.oleadaViva()}
	
}
