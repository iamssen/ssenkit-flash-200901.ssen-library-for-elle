package test.component.base 
{
	import flash.events.Event;	
	import flash.display.Sprite;
	/**
	 * @author SSen
	 */
	public class TestComponent1 extends Sprite 
	{
		private var _controller : TestComponentController;

		public function TestComponent1()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		private function addedToStage(event : Event) : void
		{
			_controller = new TestComponentController(this);
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
	}
}
