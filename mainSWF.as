package TN3_FabulasG 
{
	import adobe.utils.CustomActions;
	import flash.utils.getDefinitionByName;
	import TN3_FabulasG.ClassesSWF.btns_pasoPagina;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Kike Perez
	 */
	public class mainSWF extends Sprite
	{
		public	var	manejador	:	Main;
		public	var	tipo	:	String;
		public	var	status	:	Object;
		private var cont	:	MovieClip;
		
		private var botonesPaginas	:	btns_pasoPagina;
		
		public function mainSWF() 
		{
			cont = new MovieClip();
			cont.x = 0;
			cont.y = 0;
			addChild(cont);
			botonesPaginas = new btns_pasoPagina(this as mainSWF);
			addChild(botonesPaginas);
		}
		
		public function reinicializarStatus(){
			status = new Object();
			status.libro = 0;
			status.cuento = 0;
			status.pagina = 1;
			
		}
		
		public function irAPagina(cual:int) {
			
			var pag : MovieClip = createInstance(tipo+"_" + status.libro + "_" + status.cuento+"_"+cual.toString()) as MovieClip;
			var i:int;

			if(cont.getChildByName("paginaActual")!=null){
				cont.removeChild(cont.getChildByName("paginaActual"));
			}
			pag.name = "paginaActual";
			cont.addChild(pag);
			
			pag.x = 0;
			pag.y = 0;
			
		}
		
		public function AvanzarPagina(){
			status.pagina	+= 1;
			var pag : MovieClip = createInstance(tipo+"_" + status.libro + "_" +status.cuento+"_"+ status.pagina) as MovieClip;
			var i:int;
			
			if(cont.getChildByName("paginaActual")!=null){
				cont.removeChild(cont.getChildByName("paginaActual"));
			}
			
			pag.name = "paginaActual";
			cont.addChild(pag);
			
			pag.x = 0;
			pag.y = 0;
		}
		public function	DevolverPagina(){
			status.pagina -= 1;
			var pag : MovieClip = createInstance(tipo+"_" + status.libro + "_"+ status.cuento+"_" + status.pagina) as MovieClip;
			var i:int;

			if(cont.getChildByName("paginaActual")!=null){
				cont.removeChild(cont.getChildByName("paginaActual"));
			}
			pag.name = "paginaActual";
			cont.addChild(pag);
			
			pag.x = 0;
			pag.y = 0;
		}
		
		public function createInstance(className:String):Object
		{
		  var myClass:Class = getDefinitionByName(className) as Class;
		  var instance:Object = new myClass();
		  return instance;
		}
		
		
	}

}