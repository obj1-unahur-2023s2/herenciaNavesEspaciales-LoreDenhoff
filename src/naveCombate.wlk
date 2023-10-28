import naveBase.*

class NaveCombate inherits NaveBase{
	var visibilidad=true
	var misiles
	const mensajes=[]
	
	method ponerseVisible(){visibilidad= true}
	method ponerseInvisible(){visibilidad= false}
	method estaInvisible()= !visibilidad
	
	method desplegarMisiles(){misiles= true}
	method replegarMisiles(){misiles= false}
	method misilesDesplegados()= misiles
	
	method emitirMensaje(mensaje){mensajes.add(mensaje)}
	method mensajesEmitidos()=mensajes.size()
	method primerMensajeEmitido()= if (mensajes.isEmpty()) self. error ("No hay mensajes") else mensajes.first()
	method ultimoMensajeEmitido()= if (mensajes.isEmpty()) self. error ("No hay mensajes") else mensajes.last()
	method esEscueta()= mensajes.all({m => m.size()<30})
	method emitioMensaje(mensaje)=mensajes.contains(mensaje)
	
	override method prepararViaje(){
		super()
		self.ponerseVisible() 
		self.replegarMisiles()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en misión")
	}
	
	override method estaTranquila(){
		return super() && self.misilesDesplegados()
	}
	override method escapar(){self.irHaciaElSol(); self.irHaciaElSol()}
	override method avisar(){self.emitirMensaje("Amenaza recibida")}
	
	override method pocaActividad()= self.esEscueta()

}

//Nave combate sigilosa
class NaveCombateSigilosa inherits NaveCombate{
	override method estaTranquila() = super() && visibilidad
	
	override method recibirAmenaza(){
		super()
		self.misilesDesplegados()
		self.ponerseInvisible()
	}
}
