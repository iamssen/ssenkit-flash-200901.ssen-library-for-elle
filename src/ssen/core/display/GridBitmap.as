package ssen.core.display  
{
	import ssen.core.geom.Padding;
	import ssen.core.graphics.BitmapEx;

	import flash.display.BitmapData;
	import flash.geom.Rectangle;	
	/**
	 * Scale9Grid 기능을 하는 Bitmap
	 * @author SSen
	 */
	public class GridBitmap extends AbstThumbnailBitmap
	{
		// scale9grid
		private var _scale9Grid : Rectangle;
		private var _gridType : String;

		/**
		 * GridBitmap
		 * @param source 소스가 될 BitmapData
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
		public function GridBitmap(source : BitmapData,
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
			_scale9Grid = (scale9Grid == null) ? new Rectangle(0, 0, width, height) : scale9Grid;
			_gridType = gridType;
			switch (gridType) {
				case GridType.SCALE_3_GRID_HORIZONTAL :
					height = source.height;
					break;
				case GridType.SCALE_3_GRID_VERTICAL : 
					width = source.width;
					break;
			}
			super(source, width, height, padding, smoothing, tl, tc, tr, ml, mc, mr, bl, bc, br);
		}
		/** 같은 설정의 GridBitmap 을 복사한다 */
		public function clone() : GridBitmap
		{
			return new GridBitmap(_source.clone(), _scale9Grid.clone(), _gridType, _width, _height, _padding, _smoothing, _tl, _tc, _tr, _ml, _mc, _mr, _bl, _bc, _br);
		}
		/** Scale9Grid */
		override public function get scale9Grid() : Rectangle
		{
			return _scale9Grid;
		}
		override public function set scale9Grid(grid : Rectangle) : void
		{
			_scale9Grid = grid;
			draw();
		}
		/** @private */
		override public function set width(value : Number) : void
		{
			if (_gridType == GridType.SCALE_3_GRID_VERTICAL) {
				trace("SSEN// grid type scale3Grid vertical 은 width 가 source.width 로 강제 고정됩니다.");
				super.width = _source.width;
			} else {
				super.width = value;
			}
		}
		/** @private */
		override public function set height(value : Number) : void
		{
			if (_gridType == GridType.SCALE_3_GRID_HORIZONTAL) {
				trace("SSEN// grid type scale3Grid horizontal 은 height 가 source.height 로 강제 고정됩니다.");
				super.height = _source.height;
			} else {
				super.height = value;
			}
		}
		/** @private */
		override protected function draw() : void
		{
			clear();
			switch (_gridType) {
				case GridType.SCALE_3_GRID_HORIZONTAL : 
					_canvas.draw(BitmapEx.drawGrid3BitmapHorizontal(_source, _scale9Grid, _width, _smoothing));
					break;
				case GridType.SCALE_3_GRID_VERTICAL :
					_canvas.draw(BitmapEx.drawGrid3BitmapVertical(_source, _scale9Grid, _height, _smoothing));
					break;
				default :
					_canvas.draw(BitmapEx.drawGrid9Bitmap(_source, _scale9Grid, _width, _height, _smoothing));
					break;
			}
			super.draw();
		}
		/** grid type */
		public function get gridType() : String
		{
			return _gridType;
		}
		public function set gridType(gridType : String) : void
		{
			if (_gridType != gridType) {
				_gridType = gridType;
				switch (_gridType) {
					case GridType.SCALE_3_GRID_HORIZONTAL :
						trace("SSEN// grid type scale3Grid horizontal 은 height 가 source.height 로 강제 고정됩니다.");
						_height = _source.height;
						break;
					case GridType.SCALE_3_GRID_VERTICAL :
						trace("SSEN// grid type scale3Grid vertical 은 width 가 source.width 로 강제 고정됩니다.");
						_width = _source.width;
						break;
				}
				draw();
			}
		}
	}
}
