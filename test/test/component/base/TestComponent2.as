package test.component.base 
{
	import flash.display.MovieClip;
	import flash.events.Event;	
	/**
	 * @author SSen
	 */
	public class TestComponent2 extends MovieClip 
	{
		private var _controller : TestComponentController;
		
		public function TestComponent2()
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
