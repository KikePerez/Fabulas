package TN3_FabulasG.events
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Kike Perez
	 */
	public class EventoCuento extends Event
	{
		public static const CAMBIO_CUENTO:String = "cambio_cuento";

		// this is the object you want to pass through your event.
		public var result:Object;

		public function EventoCuento(type:String, result:Object, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.result = result;
		}

		// always create a clone() method for events in case you want to redispatch them.
		public override function clone():Event
		{
			return new EventoCuento(type, result, bubbles, cancelable);
		}
	}

}