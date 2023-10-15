
class NaveBase{
	var velocidad= 0
	var direccion= 0
	var combustible= 0
	
	method acelerar(cuanto) {100000.min(velocidad+= cuanto)}
	method desacelerar(cuanto) {0.max(velocidad-= cuanto)}
	method irHaciaElSol() {velocidad=10}
	method escaparDelSol() {velocidad=-10}
	method ponerseParaleloAlSol(){velocidad=0}
	method acercarseUnPocoAlSol() {direccion= 10.min(direccion + 1)}
	method alejarseUnPocoDelSol(){direccion = -10.max(direccion - 1)}
	method estaTranquila()= combustible>=400 && velocidad<=1200
	method escapar()
	method avisar()
	method recibirAmenaza(){
		self.escapar()
		self.avisar()
	}
	method pocaActividad()
	method estaRelajo()= self.estaTranquila() && self.pocaActividad()
}

class NaveBaliza inherits NaveBase{
	var color
	var cambioColor=false
	
	method cambiarColorDeBaliza(colorNuevo) {color=colorNuevo; cambioColor=true}
	method prepararViaje(){color="verde"; self.ponerseParaleloAlSol()}
	override method estaTranquila(){
		super()
		return color !="rojo"
	}
	override method escapar(){self.irHaciaElSol()}
	override method avisar(){color="rojo"}
	override method estaRelajo(){
		return super() && !cambioColor 
	}
}

class NavePasajeros inherits NaveBase{
	var pasajeros= 0
	var comida= 0
	var bebida= 0
	
	method cargarComidas(cant) {comida += cant}
	method descargarComidas(cant){comida -= cant}
	method cargarBebida(cant){bebida +=cant}
	method descargarBebida(cant){bebida -=cant}
	method prepararViaje(){
		self.cargarComidas(4*pasajeros)
		self.cargarBebida(6*pasajeros)
		self.acercarseUnPocoAlSol()
	}
	override method escapar()=velocidad*2
	override method avisar() {
		self.cargarComidas(pasajeros)
		self.cargarBebida(pasajeros*2)
	}
	override method estaRelajo(){
		return comida<50
	}
}

class NaveCombate inherits NaveBase{
	var visibilidad
	var misiles
	const mensajes=[]
	
	method ponerseVisible(){visibilidad= true}
	method ponerseInvisible(){visibilidad= false}
	method estaInvisible()= visibilidad
	method desplegarMisiles(){misiles= true}
	method replegarMisiles(){misiles= false}
	method misilesDesplegados()= misiles
	method emitirMensaje(mensaje)=mensajes.add(mensaje)
	method mensajesEmitidos()=mensajes.asList()
	method primerMensajeEmitido()= mensajes.first()
	method ultimoMensajeEmitido()= mensajes.last()
	method esEscueta()= mensajes.forEach({m => m.size()>30})
	method emitioMensaje(mensaje)=mensajes.contains(mensaje)
	method prepararViaje(){
		self.ponerseVisible() 
		self.replegarMisiles()
		self.acelerar(15000)
		return self.emitirMensaje("Saliendo en misión")
	}
	override method estaTranquila(){
	super()
	return self.misilesDesplegados()
	}
	override method escapar(){self.irHaciaElSol(); self.irHaciaElSol()}
	override method avisar()=self.emitirMensaje("Amenaza recibida")
	override method estaRelajo(){
		return self.esEscueta()
	}	
}

class NaveHospital inherits NavePasajeros{
	var property quirofanosPreparados	
	override method estaTranquila()=quirofanosPreparados	
	override method recibirAmenaza(){
		super()
		self.quirofanosPreparados(true)
	}	
}

class NaveCombateSigilosa inherits NaveCombate{
	override method estaTranquila(){
		super()
		return !self.estaInvisible()
	}
	override method recibirAmenaza(){
		super()
		self.misilesDesplegados()
		self.ponerseInvisible()
	}
}




