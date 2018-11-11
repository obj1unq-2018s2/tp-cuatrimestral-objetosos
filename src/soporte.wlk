import campeones.*

class Soporte inherits Campeon {
	var campeonVinculado = null
	
	method inventario() = self.itemsEquipados() + self.interseccionInventarios()
	
	method interseccionInventarios() = campeonVinculado.itemsEquipados().asSet().difference(self.itemsEquipados()).asList()
	
	method camperonVinculado() = campeonVinculado

	method vincularCampeon(campeon) {
		campeonVinculado = campeon
		campeon.itemsEquipados().forEach{ item => 
			self.itemsEquipados().add(item)
		}
	}
	
	method desvincularCampeon(campeon){
		campeon.itemsEquipados().forEach{ item => 
			self.itemsEquipados().remove(item)
		}
		campeonVinculado = null
	}
	
	
	
	override method atacarA(unaOleada){		
		super(unaOleada)
		campeonVinculado.recudirDanio(10) // propiedad de soporte
	}
	
	
	override method activarHabilidadItem(item){}
}
