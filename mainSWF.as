package  
{
	import adobe.utils.CustomActions;
	import events.EventoCuento;
	import flash.utils.getDefinitionByName;
	import ClassesSWF.btns_pasoPagina;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.AutoAlphaPlugin;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Kike Perez
	 */
	public class mainSWF extends Sprite
	{
		//public	var	manejador	:	Main;
		public	var	tipo	:	String;
		public	var	status	:	Object;
		private	var cont	:	MovieClip;
		private	var	anima	:	Boolean;
		
		private var paginaActual: MovieClip;
		
		
		private var botonesPaginas	:	btns_pasoPagina;
		
		public function mainSWF() 
		{
			//reinicializarStatus();
			cont = new MovieClip();
			cont.x = 0;
			cont.y = 0;
			addChild(cont);
			botonesPaginas = new btns_pasoPagina(this as mainSWF);
			addChild(botonesPaginas);
			TweenPlugin.activate([AutoAlphaPlugin]);
			}
		
		public function reinicializarStatus(){
			status = new Object();
			status.libro = 0;
			status.cuento = 0;
			status.pagina = 1;
			//dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_STATUS, status, true));

		}
		
		public function editarStatus(lib:int = 0, cuen:int = 0, pag:int = 0){
			status = new Object();
			status.libro = lib;
			status.cuento = cuen;
			status.pagina = pag;
			//dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_STATUS, status, true));

		}
		
		public function irAPagina(cual:int) {
			
			try{
				/*var pag : MovieClip */ paginaActual= createInstance(tipo+"_" + status.libro + "_" + status.cuento+"_"+cual.toString()) as MovieClip;
			}catch(e:Error){
				//trace("La pagina no existe");
				return ;
			} 
			var i:int;

			if (cont.getChildByName("paginaActual") != null) {
				desaparecerMC(cont.getChildByName("paginaActual")as MovieClip);
				//cont.removeChild(cont.getChildByName("paginaActual"));
			}
			
			paginaActual.name = "paginaActual";
			cont.addChild(paginaActual); 
			aparecerMC(paginaActual);
	
			paginaActual.x = 1536;
			paginaActual.y = 0;
			
		}
		
		
			
		public function AvanzarPagina(){
			if (!anima) {
				
				
				if(paginaActual.x==1536){
					paginaActual.x = 0;
				}else {
					status.pagina	+= 1;
					try {
						/*var pag : MovieClip*/paginaActual = createInstance(tipo+"_" + status.libro + "_" +status.cuento+"_"+ status.pagina) as MovieClip;
					}catch(e:Error){
						trace("La pagina no existe");
						
						status.pagina -= 1;
						if (tipo == "cuento") {
							var actual:String = tipo + "_" + status.libro + "_" +status.cuento;
							if (actual == "cuento_1_6") {
								trace("PASO A CREDITOS");
								dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_CUENTO, "creditos" , true));
							}
							dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_CUENTO, tipo+"_" + status.libro + "_" + (status.cuento+1) , true));
						}else if(tipo=="libro"){
							dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_CUENTO, "cuento_" + status.libro + "_" + 1 , true));
						}
						return;
					}
					
					if(cont.numChildren>1){
						var i:int = 1;
						for (i; i < cont.numChildren; i++ ) {
							TweenLite.killTweensOf(cont.getChildAt(i));					
							cont.removeChildAt(i);
						}
					}else{
						desaparecerMC(cont.getChildByName("paginaActual")as MovieClip);
					}
					
					paginaActual.name = "paginaActual";
					cont.addChild(paginaActual); 
					aparecerMC(paginaActual);
					paginaActual.x = 1536;
					paginaActual.y = 0;
				}
				
				
			}
			
		}
		
		
		public function	DevolverPagina(){
			if (!anima) {
				
				
				if(paginaActual.x==0){
					paginaActual.x = 1536;
				}else {
					status.pagina	-= 1;
					try {
						/*var pag : MovieClip*/paginaActual = createInstance(tipo+"_" + status.libro + "_" +status.cuento+"_"+ status.pagina) as MovieClip;
					}catch(e:Error){
						trace("La pagina no existe");
						
						status.pagina += 1;
						if (tipo == "cuento") {
							var actual:String = tipo + "_" + status.libro + "_" +status.cuento;
							if(actual=="cuento_1_6"){
								dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_CUENTO, "creditos"+"_" + status.libro , true));
							}
							dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_CUENTO, tipo+"_" + status.libro + "_" + (status.cuento+1) , true));
						}else if(tipo=="libro"){
							dispatchEvent(new EventoCuento(EventoCuento.CAMBIO_CUENTO, "cuento_" + status.libro + "_" + 1 , true));
						}
						return;
					}
					
					if(cont.numChildren>1){
						var i:int = 1;
						for (i; i < cont.numChildren; i++ ) {
							TweenLite.killTweensOf(cont.getChildAt(i));					
							cont.removeChildAt(i);
						}
					}else{
						desaparecerMC(cont.getChildByName("paginaActual")as MovieClip);
					}
					
					paginaActual.name = "paginaActual";
					cont.addChild(paginaActual); 
					aparecerMC(paginaActual);
					paginaActual.x = 0;
					paginaActual.y = 0;
				}
				
				
			}
		}
		
		//OPERACIONES DE TWEENS DE MCS
		private function desaparecerMC(mc :MovieClip ) {
			//trace("DESAPARECIENDO MC");
			mc.alpha = 1;
			TweenLite.to(mc, 0.5, { autoAlpha:0, onComplete: removerMC, onCompleteParams: [mc] } );
			anima = true;
		}
		private function aparecerMC(mc:MovieClip) {
			mc.alpha = 0;
			TweenLite.to(mc, 0.5, {autoAlpha:1});
		}
		private function removerMC(mc:MovieClip) {
			//trace("REMOVIENDO MC");
			cont.removeChild(mc);
			anima = false;
			var i:int;
			for (i= 0; i < cont.numChildren;i++ ) {
				trace("hijo numero: "+ cont.getChildAt(i));
			}
		}
		
		
		//METODO QUE CREA LAS INSTANCIAS
		public function createInstance(className:String):Object
		{
			var myClass:Class = getDefinitionByName(className) as Class;
			var instance:Object;
			
			try{
			  instance = new myClass();
			  //return instance;
			}
			catch(e:Error){
				trace("Pagina no existente");
				return null;
			}
			return instance;
		}
		
		
	}

}