import oleadaMinions.*
import items.*


class Campeon{
	var property puntosDeVida = null
	var property puntosDeAtaque = null
	var property puntosDeDanio = null
	var property bloqueos = null 
	
	var itemsEquipados = []
	
	method agregarItems(item) {
		itemsEquipados.add(item)
		puntosDeVida += item.aportaVida()
		puntosDeAtaque += item.aportaAtaque()
		puntosDeDanio += item.aportaDanio()
		bloqueos += item.aportaBloqueos()
		
	} 
	
	method removerItems(item) = itemsEquipados.remove(item)
	
	method estaVivo(){
		return puntosDeVida >= puntosDeDanio
	}
	
	method recibirAtaque(danioDelAtaque){
		
	}
	
	method atacarA(unaOleada){
	
	}
	
}