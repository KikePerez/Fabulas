package ClassesSWF 
{
	/**
	 * ...
	 * @author Kike Perez
	 */
	public class Libro_1  extends mainSWF
	{
		
		public function Libro_1() 
		{
			super();
			reinicializarStatus();
			tipo = "libro";
			editarStatus(1,0,1);
			irAPagina(1);
		}
		
	}

}