package 
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import events.EventoCuento;
	/**
	 * ...
	 * @author Kike Perez
	 */
	public class btnSeleccionCuento extends SimpleButton 
	{
		
		public function btnSeleccionCuento() 
		{
			addEventListener(MouseEvent.CLICK, callback);
			
		}
		private function callback(e:MouseEvent) {
			trace("despachando evento");
			if(name=="Home"){
				dispatchEvent(new EventoCuento(EventoCuento.VOLVER_A_HOME,name, true));
			}else{
				dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_CUENTO,name, true));
			}
		}
		
	}

}