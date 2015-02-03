package TN3_FabulasG
{
	import	flash.display.Loader;
	import	flash.display.Sprite;
	import	flash.display.MovieClip;
	import	flash.events.Event;
	import 	flash.system.ApplicationDomain; 
    import	flash.system.LoaderContext; 
	import	flash.net.URLRequest;
	import	TN3_FabulasG.events.EventoCuento;
	
	/**
	 * ...
	 * @author Kike Perez
	 */
	public class Main extends Sprite 
	{
		private var contenedor:MovieClip;
		private var _loader:Loader;
		
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
			CargarSWF("home");
		}
		
		public function CargarSWF(cual:String) {
			
			var _urlRequest:URLRequest = new URLRequest("swfs/"+cual+".swf");
			_loader = new Loader();
			trace("Trayendo cuento");
			
			var _lc:LoaderContext = new LoaderContext();
			_lc.applicationDomain = ApplicationDomain.currentDomain;
			
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, cargaTerminada);
			_loader.load(_urlRequest, _lc);
			
			_loader.x = 0;
			_loader.y = 0;
			
		}
		
		private function cargaTerminada(e:Event){
			trace("carga Terminada");
			contenedor.addChild(_loader);
			var miswf	:	mainSWF = mainSWF(_loader.content);
			miswf.manejador = this;
			
			_loader.content.addEventListener(EventoCuento.CAMBIO_CUENTO, manejadorCambioCuento);
			
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, cargaTerminada);
		}
		
		private function manejadorCambioCuento(e:EventoCuento){
			trace("Cargando swf respectivo");
			CargarSWF(e.result as String);
		}
		
	}
	
}