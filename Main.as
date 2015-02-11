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
		private var popup: PopUpSeleccion;
		private var fileStream:FileStream;
		private	var	statusActual	:	Object;
		private var swfActual	:	String;
		
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
			
			statusActual = new Object();
			
			contenedor = new MovieClip();
			contenedor.x = 0;
			contenedor.y = 0;
			
			addChild(contenedor);
			barra = new BarraNavegacion();
			barra.x = 79;
			barra.y = 1174;
			addChild(barra);
			barra.visible = false;
			
			CargarSWF("libro_1");

			
			popup = new PopUpSeleccion();
			addChild(popup);
			
		}
		
		public function CargarSWF(cual:String) {
			trace(cual);
			if (cual == "Home") {
				trace("cual == Home ");
				barra.visible = false;
			}else{
				barra.visible = true;
			}
			
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
			
			manejadorStatus(cual);

			//contenedor.addChild(swf);
			//
			//swf.content.addEventListener(EventoCuento.CAMBIO_CUENTO, manejadorCambioCuento);
			//addEventListener(EventoCuento.VOLVER_A_HOME, manejadorCambioCuento);
			//swf.contentLoaderInfo.removeEventListener(Event.COMPLETE, cargaTerminada);
			
		}
		
		private function cargaTerminada(e:Event){
			//trace("carga Terminada");
			var LoaderViejo:Loader = contenedor.getChildByName("loaderActual") as Loader;
			
			if(LoaderViejo!=null){
				LoaderViejo.unloadAndStop(true);
				contenedor.removeChild(LoaderViejo);
			}
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
			
			loader.name = "loaderActual";
			contenedor.addChild(loader);
			
			//trace("EXISTEN: "+contenedor.numChildren+" LOADERS");
			
			loader.addEventListener(EventoCuento.CAMBIO_CUENTO, this.manejadorCambioCuento);
			
			addEventListener(EventoCuento.CAMBIO_CUENTO_POPUP, this.manejadorCambioCuento);
			addEventListener(EventoCuento.VOLVER_A_HOME, manejadorCambioCuento);
			addEventListener(EventoCuento.POPUP, manejadorPopup);
			
			this.fileStream.removeEventListener(Event.COMPLETE, this.cargaTerminada);
			this.fileStream.close();
		}
		
		private function manejadorCambioCuento(e:EventoCuento){
			//trace("Cargando swf respectivo");
			CargarSWF(e.result as String);
		}
		private function manejadorPopup(e:EventoCuento){
			//trace("apareciendo Popup??");
			popup.aparecer(statusActual);
		}
		private function manejadorStatus(cual:String){
			
			if(cual.indexOf("cuento_1")>=0||cual.indexOf("libro_1")>=0){
				statusActual.cuento = 1;
				trace("EL LIBRO_1");
			}
			else if(cual.indexOf("cuento_2")>=0||cual.indexOf("libro_2")>=0){
				statusActual.cuento = 2;
				trace("EL LIBRO_2");
				
			}
			
		}
	}
	
}