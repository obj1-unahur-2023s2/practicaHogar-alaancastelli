import Personas.*

class Habitacion{
	var ocupantes	
	var nivelDeConfort
	
	method nivelDeConfort(unaPersona) = 10 + self.nivelQueAporta(unaPersona)
	method nivelQueAporta(unaPersona)
	method ingresarPersona(unaPersona){
		ocupantes.add(unaPersona)
	}
	method puedeEntrar()
	method ocupantes() = ocupantes
	method estaEnLaHabitacion(unaPersona){
		return ocupantes.contain(unaPersona)
	}
	method estaVacia(){
		return ocupantes.size() == 0
	}
	method mayorDeLaHabitacion(){
		ocupantes.
		
	}
	
	
	
}
class usoGeneral inherits Habitacion{
}

class banio inherits Habitacion{
	
	override method nivelQueAporta(unaPersona){
		if(self.esMenorQue(unaPersona,4)){
			return 2
		}else{
			return 4
		}
	}
	override method ingresarPersona(unaPersona){
		if(unaPersona.edad() > 4 and !self.puedeEntrar() ){
			self.error("no puede entrar a la habitacion")
		}else{
			super(unaPersona)
		}
	}
	override method puedeEntrar(){
		return self.tieneOcupanteMenor() or self.estaVacia()
	}

	method tieneOcupanteMenor(){
		return ocupantes.contain(	{p => self.esMenorQue(p,4)}	)
	}
	method esMenorQue(unaPersona,edad){
		return unaPersona.edad() <= edad
	}
}
class cocina inherits Habitacion{
	const metros 
	
	override method nivelQueAporta(unaPersona){
		if(unaPersona.sabeCocinar()){
			return conforExtra.valor() * metros
		}else{
			return 0
		}
	}
	override method ingresarPersona(unaPersona){
		if(unaPersona.sabeCocinar() and self.hayAlgunoQueCocina()){
			self.error("no puede ingresar")
		}else{
			super(unaPersona)
		}
		
	}
	method hayAlgunoQueCocina(){
		return ocupantes.any(	{p => p.sabeCocinar()}	)
	}
	override method puedeEntrar() {}
	
}
object conforExtra {
	var property valor = 10
}
class Dormitorio inherits Habitacion{
	const personasQueDuermen = []
	
	method personasQueDuermen(){
		return personasQueDuermen.size()
	}
	override method nivelQueAporta(unaPersona){
		return if (self.duermeAca(unaPersona)) 10 / self.personasQueDuermen() else 0
	}
	method duermeAca(unaPersona){
		return personasQueDuermen.contain(	{ p => p == unaPersona}	)
	}
	override method ingresarPersona(unaPersona){
		if(!self.puedeEntrar()){
			self.error("no puede entrar a la habitacion")
		}else{
			super(unaPersona)
		}
	}
	override method puedeEntrar(){
		return ocupantes.all(	{ p => self.ocupanteDuerme(p)}	)
	}
	method ocupanteDuerme(unOcupante){
		return personasQueDuermen.contain(unOcupante)
	}
}
