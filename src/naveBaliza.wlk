import naveBase.*

class NaveBaliza inherits NaveBase{
	var color
	var cambioColor=false
	
	method cambiarColorDeBaliza(colorNuevo) {color=colorNuevo; cambioColor=true}
	
	override method prepararViaje(){
		super()
		color="verde" 
		self.ponerseParaleloAlSol()}
	
	override method estaTranquila(){
		super()
		return color !="rojo"}
		
	override method escapar(){self.irHaciaElSol()}
	override method avisar(){color="rojo"}
	
	override method pocaActividad()= !cambioColor
}