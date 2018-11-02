import items.*
import campeones.*


class OleadaMinions{
	var property cantidadMinions
	var property plus
		
	method ataque() = if(self.oleadaViva()) cantidadMinions + plus else 0
	
	method recibirAtaque(danio){
		 if(cantidadMinions < danio){
		 	 cantidadMinions -= danio
		 	 }
		 	 else {
		 	 	cantidadMinions == 0
		 	 }
		}
	
	method oleadaViva() = cantidadMinions > 0 
	
}