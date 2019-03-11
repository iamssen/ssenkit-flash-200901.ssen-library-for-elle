package test 
{
	import ssen.debug.TestBoxes;	
	import ssen.component.scroll.IScrollPane;	
	import ssen.core.events.OnOffEvent;	
	import ssen.component.buttons.ButtonType;	
	import ssen.component.buttons.IButton;	
	import ssen.core.number.MathEx;	
	
	import flash.display.DisplayObject;	
	
	import ssen.core.array.RandomProperty;
	import ssen.core.display.ISkinObject;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;	
	/**
	 * @author SSen
	 */
	public class MovieClipsTest extends MovieClip 
	{
		private var _skin9 : ISkinObject;
		private var _skin9RP : RandomProperty;
		private var _grid9 : DisplayObject;
		private var _grid3h : DisplayObject;
		private var _grid3v : DisplayObject;
		private var _button : IButton;
		private var _pane : IScrollPane;

		public function MovieClipsTest()
		{
			_skin9 = getChildByName("skin9") as ISkinObject;
			_skin9.addEventListener(MouseEvent.CLICK, scale9SkinClick);
			_skin9RP = new RandomProperty(_skin9.skinList);
			
			_grid9 = getChildByName("grid9") as DisplayObject;
			_grid3h = getChildByName("grid3h") as DisplayObject;
			_grid3v = getChildByName("grid3v") as DisplayObject;
			_button = getChildByName("button") as IButton;
			_button.buttonType = ButtonType.TOGGLE;
			
			_pane = getChildByName("pane") as IScrollPane;
			_pane.content = TestBoxes.getLineBox();
			
			_grid9.addEventListener(MouseEvent.CLICK, gridClick);
			_grid3v.addEventListener(MouseEvent.CLICK, gridClick);
			_grid3h.addEventListener(MouseEvent.CLICK, gridClick);
			_button.addEventListener(OnOffEvent.ONOFF, onoff);
		}
		private function onoff(event : OnOffEvent) : void
		{
			trace(event.target, event.onoff);
		}
		private function gridClick(event : MouseEvent) : void
		{
			var d : DisplayObject = event.target as DisplayObject;
			d.width = MathEx.rand(30, 150);
			d.height = MathEx.rand(30, 150);
		}
		private function scale9SkinClick(event : MouseEvent) : void
		{
			var mode : String = String(_skin9RP.random());
			_skin9.skinning(mode);
		}
	}
}
