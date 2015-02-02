package
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Kike Perez
	 */
	public class Main extends Sprite 
	{
		private var contenedor:MovieClip;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			contenedor = new MovieClip();
			contenedor.x = 0;
			contenedor.y = 0;
			
			addChild(contenedor);
			
		}
		
		public function CargarSWF(){
			
		}
		
		public function CambiarSWF() {
			
		}
	}
	
}