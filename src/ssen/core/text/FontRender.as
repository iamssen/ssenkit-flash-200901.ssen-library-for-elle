package ssen.core.text 
{
	import ssen.core.events.FontRenderEvent;
	
	import flash.events.EventDispatcher;		
	/**
	 * @author SSen
	 */
	public class FontRender extends EventDispatcher 
	{
		private var _sharpness : int;
		private var _thickness : int;

		public function FontRender(sharpness : int = 0, thickness : int = 0)
		{
			_sharpness = sharpness;
			_thickness = thickness;
		}
		public function get sharpness() : int
		{
			return _sharpness;
		}
		public function set sharpness(sharpness : int) : void
		{
			_sharpness = sharpness;
			dispatchEvent(new FontRenderEvent(FontRenderEvent.RENDER_CHANGE, _sharpness, _thickness));
		}
		public function get thickness() : int
		{
			return _thickness;
		}
		public function set thickness(thickness : int) : void
		{
			_thickness = thickness;
			dispatchEvent(new FontRenderEvent(FontRenderEvent.RENDER_CHANGE, _sharpness, _thickness));
		}
	}
}
