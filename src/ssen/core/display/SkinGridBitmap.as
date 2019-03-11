package ssen.core.display 
{
	import flash.utils.Dictionary;	

	import ssen.core.display.GridBitmap;
	import ssen.core.geom.Padding;

	import flash.display.BitmapData;
	import flash.geom.Rectangle;	
	/**
	 * 여러컷의 skin 을 가지고 있는 ISkinObject 가 적용된 GridBitmap
	 * @author SSen
	 */
	public class SkinGridBitmap extends GridBitmap implements ISkinObject 
	{
		private var _sources : Dictionary;
		private var _flag : String;

		/**
		 * SkinGridBitmap
		 * @param sources 소스가 될 BitmapData 들
		 * @param gridType bitmap resize 시 적용할 grid 형태
		 * @param width width
		 * @param height height
		 * @param scale9Grid Scale9Grid
		 * @param padding Thumbnail 의 위치에 간섭하는 Padding
		 * @param tl Thumnail bitmapData - top left
		 * @param tc Thumnail bitmapData - top center
		 * @param tr Thumnail bitmapData - top right
		 * @param ml Thumnail bitmapData - middle left
		 * @param mc Thumnail bitmapData - middle center
		 * @param mr Thumnail bitmapData - middle right
		 * @param bl Thumnail bitmapData - bottom left
		 * @param bc Thumnail bitmapData - bottom center
		 * @param br Thumnail bitmapData - bottom right
		 */
		public function SkinGridBitmap(sources : Dictionary, 
										scale9Grid : Rectangle = null, 
										gridType : String = "scale9Grid", 
										width : int = 0, 
										height : int = 0, 
										padding : Padding = null, 
										smoothing : Boolean = false, 
										tl : BitmapData = null, 
										tc : BitmapData = null, 
										tr : BitmapData = null, 
										ml : BitmapData = null, 
										mc : BitmapData = null, 
										mr : BitmapData = null, 
										bl : BitmapData = null, 
										bc : BitmapData = null, 
										br : BitmapData = null
										)
		{
			_sources = sources;
			_flag = SkinMode.DEFAULT;
			
			super(BitmapData(sources[_flag]).clone(), scale9Grid, gridType, width, height, padding, smoothing, tl, tc, tr, ml, mc, mr, bl, bc, br);
		}
		public function skinning(modeName : String = "default") : void
		{
			if (_flag != modeName) {
				source = BitmapData(_sources[modeName]);
				_flag = modeName;
			}
		}
		public function get flag() : String
		{
			return _flag;
		}
		public function get skinList() : Array
		{
			var arr : Array = new Array();
			var name : String;
			for (name in _sources) {
				arr.push(name);
			}
			return arr;
		}
	}
}
