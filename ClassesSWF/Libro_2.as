package ClassesSWF 
{
	/**
	 * ...
	 * @author Kike Perez
	 */
	public class Libro_2 extends mainSWF
	{
		
		public function Libro_2() 
		{
			super();
			reinicializarStatus();
			tipo = "libro";
			editarStatus(2,0,1);
			irAPagina(1);
		}
		
	}

}