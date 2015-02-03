package TN3_FabulasG
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import TN3_FabulasG.events.EventoCuento;
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
			
			switch(name){
				case "_1_1":
					trace("voy a cuento 1_1");
					dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_CUENTO,"cuento"+name, true));
					
					break;
				case "_1_2":
					break;
				case "_1_3":
					break;
				case "_1_4":
					break;
				case "_1_5":
					break;
				case "_1_6":
					break;
					
			}
		}
		
	}

}