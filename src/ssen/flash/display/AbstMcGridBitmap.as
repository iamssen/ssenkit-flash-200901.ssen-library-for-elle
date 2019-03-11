package ssen.flash.display 
{
	import ssen.core.display.GridBitmap;
	import ssen.core.display.GridType;
	import ssen.core.geom.GeomEx;
	import ssen.core.geom.Padding;
	import ssen.core.graphics.BitmapEx;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Rectangle;		
	/**
	 * @author SSen
	 */
	public class AbstMcGridBitmap extends Sprite
	{
		protected var _gridBitmap : GridBitmap;

		protected function init(gridType : String) : void
		{
			var tl : BitmapData = getThumbnail("tl");
			var tc : BitmapData = getThumbnail("tc");
			var tr : BitmapData = getThumbnail("tr");
			var ml : BitmapData = getThumbnail("ml");
			var mc : BitmapData = getThumbnail("mc");
			var mr : BitmapData = getThumbnail("mr");
			var bl : BitmapData = getThumbnail("bl");
			var bc : BitmapData = getThumbnail("bc");
			var br : BitmapData = getThumbnail("br");
			var padding : Padding = getPadding("padding");
			
			var w : Number = width;
			var h : Number = height;
			
			scaleX = 1;
			scaleY = 1;
			
			var grid : Rectangle = scale9Grid;
			var bmd : BitmapData = new BitmapData(width, height);
			bmd.draw(this);
			
			_gridBitmap = new GridBitmap(bmd, grid, gridType, w, h, padding, false, tl, tc, tr, ml, mc, mr, bl, bc, br);
			
			var f : int;
			for (f = 0;f < numChildren; f++) {
				removeChildAt(f);
			}
			
			addChild(_gridBitmap);
			switch (gridType) {
				case GridType.SCALE_3_GRID_HORIZONTAL :
					height = h;
					break; 
				case GridType.SCALE_3_GRID_VERTICAL :
					width = w;
					break;
				default :
					setBlank(w, h); 
					break; 
			}
		}
		/** @private */
		override public function set width(value : Number) : void
		{
			scaleX = 1;
			_gridBitmap.width = value;
			if (int(value) != _gridBitmap.width) {
				super.width = value;
				setBlank(_gridBitmap.width, height);
			} else {
				setBlank(value, height);
			}
		}
		/** @private */
		override public function set height(value : Number) : void
		{
			scaleY = 1;
			_gridBitmap.height = value;
			if (int(value) != _gridBitmap.height) {
				super.height = value;
				setBlank(width, _gridBitmap.height);
			} else {
				setBlank(width, value);
			}
		}
		/** scale9Grid */
		override public function get scale9Grid() : Rectangle
		{
			if (_gridBitmap == null || _gridBitmap.scale9Grid == null) {
				return super.scale9Grid;
			} else {
				return _gridBitmap.scale9Grid;
			}
		}
		override public function set scale9Grid(grid : Rectangle) : void
		{
			_gridBitmap.scale9Grid = grid;
		}
		/** 
		 * gridType
		 * @default scale9Grid
		 */
		public function get gridType() : String
		{
			return _gridBitmap.gridType;
		}
		public function set gridType(gridType : String) : void
		{
			_gridBitmap.gridType = gridType;
		}
		/** int 형식의 Bitmap Size 의 공백을 메꾼다 */
		protected function setBlank(width : Number, height : Number) : void
		{
			var g : Graphics = graphics;
			g.clear();
			var w : int = width;
			var h : int = height;
			if ((width - w) != 0 || (height - h) != 0) {
				g.beginFill(0x000000, 0);
				g.drawRect(0, 0, width, height);
				g.endFill();
			}
		}
		/*
		 * util methods
		 */
		// 특정 movie clip 에서 padding 을 추출한다 
		private function getPadding(name : String) : Padding
		{
			var displayObject : DisplayObject = getChildByName(name);
			if (displayObject != null && displayObject.scale9Grid != null) {
				removeChild(displayObject);
				return GeomEx.rectangleToPadding(displayObject.scale9Grid, displayObject.width, displayObject.height);
			} 
			return null;
		}
		// 특정 movie clip 을 bitmap data 로 추출한다
		private function getThumbnail(name : String) : BitmapData
		{
			var displayObject : DisplayObject = getChildByName(name);
			if (displayObject != null) {
				removeChild(displayObject);
				return BitmapEx.displayObjectToBitmapData(displayObject, true);
			}
			return null;
		}
	}
}
