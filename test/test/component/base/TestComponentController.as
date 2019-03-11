package test.component.base 
{
	import ssen.core.number.MathEx;	

	import flash.display.Graphics;	
	import flash.events.MouseEvent;	
	import flash.display.Sprite;	
	/**
	 * @author SSen
	 */
	public class TestComponentController 
	{
		private var _object : Sprite;

		public function TestComponentController(object : Sprite)
		{
			_object = object;
			var g : Graphics = _object.graphics;
			g.beginFill(MathEx.rand(0x000000, 0xffffff));
			g.drawRoundRect(0, 0, 100, 100, 10, 10);
			g.endFill();
			_object.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		} 
		private function mouseDown(event : MouseEvent) : void
		{
			_object.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			_object.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			trace(_object, "down");
		}
		private function mouseUp(event : MouseEvent) : void
		{
			_object.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
			_object.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			trace(_object, "up");
		}
	}
}
