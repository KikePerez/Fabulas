package 
{
	import flash.display.MovieClip;
	import com.greensock.TweenLite;
	import com.greensock.plugins.AutoAlphaPlugin;
	import com.greensock.plugins.TweenPlugin;
	import flash.display.SimpleButton;
	/**
	 * ...
	 * @author Kike Perez
	 */
	public class PopUpSeleccion extends MovieClip
	{
		
		private var botones	:	Array;
		private var anima	:	Boolean;
		private var status	:	Object;
		
		public function PopUpSeleccion() 
		{
			TweenPlugin.activate([AutoAlphaPlugin]);
			init();
		}
		
		private function init(){
			alpha = 0;
			visible = false;
			var i : int=1;
			for (i; i < 7;i++ ) {
				botones.push(getChildByName("_" + i));
				trace(botones);
			}
		}
		
		public function aparecer(stat:Object){
			visible = true;
			alpha = 0;
			status = stat;
			TweenLite.to(this, 0.5, { autoAlpha:1} );
		}
		
		public function desaparecer(){
			//visible = false;
			alpha = 1;
			TweenLite.to(this, 0.5, { autoAlpha:0, onComplete: desaparecerComplete} );
		}
		
		private function desaparecerComplete(){
			visible = false;
		}
		
		private function actualizarBotones(){
			var i : int=0;
			for (i; i < botones.length; i++ ) {
				MovieClip(botones[i]).name = "cuento_" + status.cuento + "_" + i;
			}
		}
		
	}

}