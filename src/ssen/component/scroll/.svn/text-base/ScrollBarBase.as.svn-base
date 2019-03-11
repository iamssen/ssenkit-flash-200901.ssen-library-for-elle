package ssen.component.scroll 
{
	import ssen.component.base.InputUtil;
	import ssen.core.display.SSenSprite;		
	/**
	 * @author SSen
	 */
	public class ScrollBarBase extends SSenSprite
	{
		private var _track : IScroller;

		public function ScrollBarBase(container : IScrollContainer, sec : Number = 0, isTrackHide : Boolean = false, trackMode : String = "point", minValue : Number = 0, maxValue : Number = 0)
		{
		}
		/* *********************************************************************
		 * implement IScroller
		 ********************************************************************* */
		public function page(delta : int) : void
		{
			trace(delta);
		}
		public function wheel(delta : int) : void
		{
			trace(delta);
		}
		public function move(pixel : int) : void
		{
			trace(pixel);
		}
		public function resourceKill() : void
		{
			trace("resource kill");
		}
		public function get container() : IScrollContainer
		{
			return null;
		}
		public function set container(container : IScrollContainer) : void
		{
			trace(container);
		}
		public function get sight() : Number
		{
			return 0;
		}
		public function get minValue() : Number
		{
			return 0;
		}
		public function set minValue(minValue : Number) : void
		{
			trace(minValue);
		}
		public function get maxValue() : Number
		{
			return 0;
		}
		public function set maxValue(maxValue : Number) : void
		{
			trace(maxValue);
		}
		public function get sec() : Number
		{
			return 0;
		}
		public function set sec(sec : Number) : void
		{
			trace(sec);
		}
		public function get enable() : Boolean
		{
			return false;
		}
		public function set enable(enable : Boolean) : void
		{
			trace(enable);
		}
		public function get value() : Object
		{
			return 0;
		}
		public function set value(value : Object) : void
		{
			/*
			if (InputUtil.valueTypeCheck(this, value, valueType)) {
				trace(value);
			}
			 * 
			 */
		}
		public function get valueType() : Class
		{
			return Number;
		}
	}
}
