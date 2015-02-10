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
	public class btnCuentoPopup extends SimpleButton 
	{
		private	var	_cual	:	String= "_";
		
		public function btnCuentoPopup() 
		{
			addEventListener(MouseEvent.CLICK, callback);
			
		}
		
		private function callback(e:MouseEvent) {
			trace("BOTON CUENTO POPUP PRESIONADO");
			var cuentoALlamar: String = _cual+name ;
			dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_CUENTO_POPUP, cuentoALlamar, true));
			dispatchEvent(new EventoCuento(EventoCuento.BACK,name, true));
			
		}
		
		public function get cual():String 
		{
			return _cual;
		}
		
		public function set cual(value:String):void 
		{
			_cual = value;
		}
		
		
		
	}

}