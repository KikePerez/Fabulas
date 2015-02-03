package TN3_FabulasG
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;

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
				case "_1":
					trace("voy a cuento 1_1");
					(parent.parent)
					break;
				case "_2":
					break;
				case "_3":
					break;
				case "_4":
					break;
				case "_5":
					break;
				case "_6":
					break;
					
			}
		}
		
	}

}