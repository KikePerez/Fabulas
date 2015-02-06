package ClassesSWF 
{

	/**
	 * ...
	 * @author Kike Perez
	 */
	public class cuento1_1 extends mainSWF 
	{
		
		public function cuento1_1() 
		{
			super();
			status = new Object();
			status.libro = 1;
			status.cuento = 1;
			status.pagina = 1;
			tipo = "cuento";
			irAPagina(1);
		}
		
	}

}