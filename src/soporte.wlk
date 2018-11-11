import campeones.*

class Soporte inherits Campeon {
	var campeonVinculado = null
	
	method inventario() = self.itemsEquipados().asSet().union(campeonVinculado.itemsEquipados().asSet()).asList()
	
	method camperonVinculado() = campeonVinculado

	method vincularCampeon(campeon) {
		campeonVinculado = campeon
	}
	
	method desvincularCampeon(campeon){
		campeonVinculado = null
	}
	
	override method vida() = vidaBase + self.inventario().sum{item=> item.vida(self)}
	
	override method ataque() = ataqueBase + self.inventario().sum{item=> item.ataque(self)}
	
	override method atacarA(unaOleada){		
		super(unaOleada)
		campeonVinculado.recudirDanio(10) // propiedad de soporte
	}
	

	override method activarHabilidadItem(item){}
}
