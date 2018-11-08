import oleadaMinions.*
import items.*


class Campeon{
	const vidaBase	
	const property ataqueBase
	var property dinero
	
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
	
	method comprar(item){
		if (self.dinero() >=  item.precio()) {
			self.dinero(self.dinero() - item.precio())
			self.agregarItem(item)
		}
	}
	method vender(item){
		self.dinero(self.dinero() + (item.precio() / 2))
		self.removerItem(item)
	}
}
