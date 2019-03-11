package ssen.core.events 
{
	import flash.events.Event;
	/**
	 * @author SSen
	 */
	public class FontRenderEvent extends Event 
	{
		public static const RENDER_CHANGE : String = "renderChange";
		private var _sharpness : int;
		private var _thickness : int;

		public function FontRenderEvent(type : String, sharpness : int, thickness : int, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			_sharpness = sharpness;
			_thickness = thickness;
		}
		public function get sharpness() : int
		{
			return _sharpness;
		}
		public function get thickness() : int
		{
			return _thickness;
		}
		/** @private */
		override public function toString() : String
		{
			return '[FontRenderEvent type="' + type + '" sharpness="' + _sharpness + '" thickness="' + _thickness + '"]';
		}
	}
}
