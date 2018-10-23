import oleadaMinions.*
import items.*


class Campeon{
	var property puntosDeVida = null
	var property puntosDeAtaque = null
	var property puntosDeDanio = null
	var property bloqueos = null 

	
	var itemsEquipados = []
	
	//
	method agregarItems(item) {
		itemsEquipados.add(item)
		item.equiparA(self)
		
	} 

	method removerItems(item){
		itemsEquipados.remove(item)
		item.desequipaA(self)
		
	} 
	
	method estaVivo(){
		return puntosDeVida >= puntosDeDanio
	}
	
	//Maza

	
	method recibirAtaque(danioDelAtaque){
		if(bloqueos >= 1){}
		else{
			puntosDeVida -= danioDelAtaque
			bloqueos -= 1
		}
		
	}
	
	//Maza
	method atacarA(unaOleada){
		unaOleada.recibirAtaque(self.puntosDeAtaque())
		self.recibirAtaque(unaOleada.atacarA(self))
	}
	
}