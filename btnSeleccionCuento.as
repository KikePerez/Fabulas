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
			//trace("despachando evento");
			switch(name){
				case "Home":
					dispatchEvent(new EventoCuento(EventoCuento.VOLVER_A_HOME,name, true));
					dispatchEvent(new EventoCuento(EventoCuento.BACK,name, true));
					
					break;
				case "popup":
					dispatchEvent(new EventoCuento(EventoCuento.POPUP, name, true));
					dispatchEvent(new EventoCuento(EventoCuento.BACK,name, true));
					
					break;
				case "back":
					dispatchEvent(new EventoCuento(EventoCuento.BACK,name, true));
					
					break;
				default:
					dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_CUENTO,name, true));
					break;
			}
			
		}
		
	}

}