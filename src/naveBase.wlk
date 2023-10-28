
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
	
	method cargarCombustible(cant){combustible+=cant}
	method descargarCombustible(cant){0.max(combustible-=cant)}
	
	method prepararViaje(){
		self.cargarCombustible(30000)
		self.acelerar(5000)		
	}
	
	method estaTranquila()= combustible>=4000 && velocidad<=1200
	
	method escapar()
	method avisar()
	method recibirAmenaza(){
		self.escapar()
		self.avisar()
	}
	
	
	method estaRelajo()= self.estaTranquila() && self.pocaActividad()
	method pocaActividad()	
}


