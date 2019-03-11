package ssen.component.scroll 
{
	import ssen.component.base.InputUtil;
	import ssen.core.display.ISkinObject;
	import ssen.core.display.SSenSprite;		
	/**
	 * @author SSen
	 */
	public class SliderBase extends SSenSprite implements ISlider
	{
		private var _track : ISkinObject;
		private var _thumb : ISkinObject;
		private var _direction : String;
		private var _minValue : Number;
		private var _maxValue : Number;
		private var _segment : Number;
		private var _trackStart : int;
		private var _trackEnd : int;

		public function SliderBase()
		{
			super();
		}
		/* *********************************************************************
		 * setting
		 ********************************************************************* */
		/**
		 * @param track track skin object
		 * @param thumb thumb skin object
		 * @param direction thumb 이 움직일 방향
		 * @param minValue 최소값
		 * @param maxValue 최대값
		 * @param value 최초값
		 * @param segment value 의 특정 간격으로만 움직이게 된다
		 * @param trackStart thumb 이 minValue 로 취급할 track 의 x 또는 y 지점
		 * @param trackEnd thumb 이 maxValue 로 취급할 track 의 x 또는 y 지점
		 */
		protected function setting(track : ISkinObject, thumb : ISkinObject, direction : String, 
									minValue : Number, maxValue : Number, value : Number = 0, 
									segment : Number = -1, trackStart : int = -1, trackEnd : int = -1) : void
		{
			_track = track;
			_thumb = thumb;
			_direction = direction;
			_minValue = minValue;
			_maxValue = maxValue;
			_segment = segment;
			_trackStart = (trackStart > 0) ? trackStart : 0;
			_trackEnd = (trackEnd > 0) ? trackEnd : track.width;
		}
		/* *********************************************************************
		 * implement ISlider
		 ********************************************************************* */
		public function wheel(delta : int) : void
		{
		}
		public function move(pixel : int) : void
		{
		}
		public function get minValue() : Number
		{
			return 0;
		}
		public function set minValue(minValue : Number) : void
		{
		}
		public function get maxValue() : Number
		{
			return 0;
		}
		public function set maxValue(maxValue : Number) : void
		{
		}
		public function get sec() : Number
		{
			return 0;
		}
		public function set sec(sec : Number) : void
		{
		}
		/* *********************************************************************
		 * implements ISSenComponent, IInput
		 ********************************************************************* */
		public function get enable() : Boolean
		{
			return false;
		}
		public function set enable(enable : Boolean) : void
		{
		}
		public function get value() : Object
		{
			return null;
		}
		public function set value(value : Object) : void
		{
			if (InputUtil.valueTypeCheck(this, value, valueType)) {
				
			}
		}
		public function get valueType() : Class
		{
			return Number;
		}
		public function resourceKill() : void
		{
		}
	}
}
