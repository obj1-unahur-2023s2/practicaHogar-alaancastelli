import habitacion.*
import Personas.*

class Casa {
	
	const habitaciones = {}
	
	method estaEnUnaHabitacion(unaPersona){
		return habitaciones.any (	{p => p.estaEnLaHabitacion(unaPersona)}	)
	}
	method habitacionEnLaQueEsta(unaPersona){
		return habitaciones.find(	{p	=> p.estaEnUnaHabitacion(unaPersona)}	)
	}
	method sacarPersona(unaPersona){
		
	}
	method moverPersona(unaPersona,habitacion){
		if(self.estaEnUnaHabitacion(unaPersona)){
			self.habitacionEnLaQueEsta(unaPersona).remove(unaPersona)	
		}
			habitacion.agregarPersona(unaPersona)
	}
	method habitacionesQueEstanOcupadas(){
		return habitaciones.find(	{p => !p.estaVacia()}	)
	}
	method responsablesDeCasa(){
		return habitaciones.	
	}
	
}
