package TN3_FabulasG.ClassesSWF 
{
	import flash.display.MovieClip;
	import TN3_FabulasG.mainSWF;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Kike Perez
	 */
	public class btns_pasoPagina extends MovieClip 
	{
		
		private	var	swf	:	mainSWF;
		private	var btns	:	MovieClip;
		
		
		public function btns_pasoPagina(miSwf:mainSWF) 
		{
			swf = miSwf;

			btns = new pasoPagina();
			addChild(btns);
			
			btns.sig.addEventListener(MouseEvent.CLICK, anteriorPagina);
			btns.ant.addEventListener(MouseEvent.CLICK, siguientePagina);
			
		}
		
		private function anteriorPagina(e:MouseEvent){
			swf.AvanzarPagina();
		}
		private function siguientePagina(e:MouseEvent){
			swf.DevolverPagina();
		}
		
	}

}