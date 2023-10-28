import naveBase.*

class NavePasajeros inherits NaveBase{
	var pasajeros= 0
	var comida= 0
	var bebida= 0
	var descargadas=0
	
	method cargarComidas(cant) {comida += cant}
	method descargarComidas(cant){0.max(comida -= cant)}
	
	method cargarBebida(cant){bebida +=cant}
	method descargarBebida(cant){0.max(bebida -=cant)}
	
	override method prepararViaje(){
		super()
		self.cargarComidas(4*pasajeros)
		self.cargarBebida(6*pasajeros)
		self.acercarseUnPocoAlSol()
	}
	
	override method escapar() {self.acelerar(velocidad)}
	override method avisar() {
		self.cargarComidas(pasajeros)
		self.cargarBebida(pasajeros*2)
	}
	
	override method pocaActividad()= descargadas < 50
}

//Nave hospital
class NaveHospital inherits NavePasajeros{
	var property quirofanosPreparados= false
	
	override method estaTranquila()= super() and !quirofanosPreparados	
	
	override method recibirAmenaza(){
		super()
		quirofanosPreparados =true
	}	
}
