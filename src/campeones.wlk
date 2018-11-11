import oleadaMinions.*
import items.*


class Campeon{
	const vidaBase 
	const property ataqueBase
	
	var puntosDeDanio = 0
	var bloqueos = 0 
	const property itemsEquipados = []
	var property dinero
	
	
	method comprar(item){
		dinero -= item.precio()
		self.agregarItem(item)
	}
			
	method vender(item){
		dinero += item.precio() / 2 
		self.removerItem(item)		
	}
		
	method recibirBloqueos(cant){
		bloqueos += cant
	}
	
	method danio() = puntosDeDanio
	
	
	method recibirDanio(danio){
		if(puntosDeDanio  <=  danio){
			puntosDeDanio += danio
		}else{
			puntosDeDanio = 0
		}
	}
	
	method recudirDanio(danio){
		if (puntosDeDanio > 0) {
			puntosDeDanio -= danio
		}
	}
	
	method vida() = vidaBase + itemsEquipados.sum{item=> item.vida(self)}
	
	method ataque() = ataqueBase + itemsEquipados.sum{item=> item.ataque(self)}
	
	
	method agregarItem(item){
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

	method dineroRecolectadoDe(minions) = if(self.ataque() > minions) minions else self.ataque() 
	//esta conciderado que si la cantidad de minions son 0 (osea estan muertos) retorna  0 
	
	method atacarA(unaOleada){		
		if (bloqueos ==  0){
			self.recibirDanio(unaOleada.ataque())
			dinero += self.dineroRecolectadoDe(unaOleada.cantidadMinions())
			unaOleada.recibirAtaque(self.ataque())
		}
		else{
			bloqueos = bloqueos - 1
			unaOleada.recibirAtaque(self.ataque())
		}
	}
	
	method activarHabilidadItem(item){ 
		item.habilidad(self)
	}
}
