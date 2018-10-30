import oleadaMinions.*
import items.*


class Campeon{
	const vidaBase = null
	const property ataqueBase = null
	
	
	var puntosDeDanio = 0
	var bloqueos = 0 
	
	var itemsEquipados = []
	
		
	method recibirBloqueos(cant){
		bloqueos += cant
	}
	
	method danio(){  
		return puntosDeDanio
	}
	
	method recibirDanio(danio){
		puntosDeDanio += danio
	}
	
	method vida() = vidaBase + itemsEquipados.sum{item=> item.vida(self)}
	
	method ataque() = ataqueBase + itemsEquipados.sum{item=> item.ataque(self)}
	
	
	method agregarItem(item) {
		itemsEquipados.add(item)
		item.equiparA(self)
		
	} 

	method removerItem(item){
		itemsEquipados.remove(item)
		item.desequiparA(self)
		
	} 
	
	method estaVivo(){
		return self.vida() >= puntosDeDanio
	}	
	
	method atacarA(unaOleada){		
		if (bloqueos ==  0){
			self.recibirDanio(unaOleada.ataque())
		}
		else{
			bloqueos = bloqueos - 1
		}
	}
}