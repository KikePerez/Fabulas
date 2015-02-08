package 
{
	import	flash.display.Loader;
	import	flash.display.Sprite;
	import	flash.display.MovieClip;
	import	flash.events.Event;
	import 	flash.system.ApplicationDomain; 
	import	flash.filesystem.FileStream;
	import	flash.filesystem.File;
	import	flash.filesystem.FileMode;
	
	import flash.display.Loader;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	
	import	flash.net.URLRequest;
	import	events.EventoCuento;
	
	/**
	 * ...
	 * @author Kike Perez
	 */
	public class Main extends Sprite 
	{
		private var contenedor:MovieClip;
		//private var _loader:Loader;
		private var swf:MovieClip;
		private var loader:Loader;
		private var barra:MovieClip;
		private var fileStream:FileStream;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			//trace("INICIANDO MAIN!");
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			contenedor = new MovieClip();
			contenedor.x = 0;
			contenedor.y = 0;
			
			addChild(contenedor);
			CargarSWF("Home");
			barra = new BarraNavegacion();
			barra.x = 79;
			barra.y = 1174;
			addChild(barra);
		}
		
		public function CargarSWF(cual:String) {
			
		/*	var _urlRequest:URLRequest = new URLRequest(cual+".swf");
			_loader = new Loader();
			trace("Trayendo cuento");
			
			var _lc:LoaderContext = new LoaderContext();
			_lc.applicationDomain = ApplicationDomain.currentDomain;
			
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, cargaTerminada);
			
			_loader.load(_urlRequest, _lc);
			
			_loader.x = 0;
			_loader.y = 0;*/
			
			
			//var file:File = File.applicationDirectory.resolvePath( "/data/data/" + "swfs/" + cual + ".swf"  );
			
			var file:File = File.applicationDirectory;
			file = file.resolvePath("swfs/"+cual+".swf"); 
			trace(file.url); // app:/images
			
			if (file.exists) {
				trace("el archivo se encontró!");
				
				this.fileStream = new FileStream();
				this.fileStream.addEventListener(Event.COMPLETE, this.cargaTerminada)
				this.fileStream.openAsync(file, FileMode.READ);
			}else{
				trace("el archivo no se encuentra");
			}
			

			//contenedor.addChild(swf);
			//
			//swf.content.addEventListener(EventoCuento.CAMBIO_CUENTO, manejadorCambioCuento);
			//addEventListener(EventoCuento.VOLVER_A_HOME, manejadorCambioCuento);
			//swf.contentLoaderInfo.removeEventListener(Event.COMPLETE, cargaTerminada);
			
		}
		
		private function cargaTerminada(e:Event){
			//trace("carga Terminada");
				
			// Read SWF bytes into byte array and close file
			var swfBytes: ByteArray = new ByteArray();
				this.fileStream.readBytes( swfBytes );
				this.fileStream.close();
			 
			// Prepare the loader context to avoid security error
			var loaderContext: LoaderContext = new LoaderContext();
				loaderContext.allowLoadBytesCodeExecution = true; // that's it!
			 
			// Now you could use this with a Loader instance
			loader = new Loader();
			loader.loadBytes( swfBytes, loaderContext );
			 
			//this.swf = MovieClip(loader );
			
			
			contenedor.addChild(loader);
			
			loader.addEventListener(EventoCuento.CAMBIO_CUENTO, this.manejadorCambioCuento);
			addEventListener(EventoCuento.VOLVER_A_HOME, manejadorCambioCuento);
			this.fileStream.removeEventListener(Event.COMPLETE, this.cargaTerminada);
			this.fileStream.close();
		}
		
		private function manejadorCambioCuento(e:EventoCuento){
			trace("Cargando swf respectivo");
			CargarSWF(e.result as String);
		}
		
	}
	
}