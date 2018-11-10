import campeones.*

class Soporte inherits Campeon {
	var campeonVinculado = null
	
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
		self.itemsEquipados().clear()
		campeonVinculado = null
	}
	
	override method atacarA(unaOleada){		
		super(unaOleada)
		campeonVinculado.recudirDanio(10) // propiedad de soporte
	}
	
	
	override method activarHabilidadItem(item){}
}
