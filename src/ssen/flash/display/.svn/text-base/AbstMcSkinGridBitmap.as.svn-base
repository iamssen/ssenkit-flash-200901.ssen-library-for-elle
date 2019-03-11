package ssen.flash.display 
{
	import ssen.core.display.GridBitmap;
	import ssen.core.display.GridType;
	import ssen.core.display.ISkinObject;
	import ssen.core.display.SSenMovieClip;
	import ssen.core.geom.GeomEx;
	import ssen.core.geom.Padding;
	import ssen.core.graphics.BitmapEx;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;	
	/**
	 * @author SSen
	 */
	public class AbstMcSkinGridBitmap extends SSenMovieClip implements ISkinObject 
	{
		private var _gridBitmaps : Vector.<GridBitmap>;
		private var _gridBitmap : GridBitmap;
		private var _width : Number;
		private var _height : Number;
		private var _currentFrame : int;
		private var _labels : Dictionary;
		private var _scale9Grid : Rectangle;
		private var _gridType : String;

		protected function init(gridType : String) : void
		{
			_gridType = gridType;
			_width = width;
			_height = height;
			_labels = new Dictionary(true);
			
			scaleX = 1;
			scaleY = 1;
			
			var f : int;
			var s : int;
			var w : int;
			var h : int;
			var grid : Rectangle = scale9Grid;
			var bmd : BitmapData;
			var gridBitmap : GridBitmap;
			
			var tl : BitmapData;
			var tc : BitmapData;
			var tr : BitmapData;
			var ml : BitmapData;
			var mc : BitmapData;
			var mr : BitmapData;
			var bl : BitmapData;
			var bc : BitmapData;
			var br : BitmapData;
			var padding : Padding;
			var tempPadding : Padding;
			var children : int;
			
			_gridBitmaps = new Vector.<GridBitmap>();
			
			for (f = 1;f <= totalFrames; f++) {
				super.gotoAndStop(f);
				
				if (super.currentLabel != "" && _labels[super.currentLabel] == undefined) {
					_labels[super.currentLabel] = currentFrame;
				}
				
				tl = getThumbnail("tl");
				tc = getThumbnail("tc");
				tr = getThumbnail("tr");
				ml = getThumbnail("ml");
				mc = getThumbnail("mc");
				mr = getThumbnail("mr");
				bl = getThumbnail("bl");
				bc = getThumbnail("bc");
				br = getThumbnail("br");
				tempPadding = getPadding("padding");
				padding = (tempPadding != null) ? tempPadding : padding;
				
				w = width;
				h = height;
				
				bmd = new BitmapData(width, height);
				bmd.draw(this);
				gridBitmap = new GridBitmap(bmd, grid, gridType, w, h, padding, false, tl, tc, tr, ml, mc, mr, bl, bc, br);
				_gridBitmaps.push(gridBitmap);
			}
			super.gotoAndStop(1);
			_currentFrame = 1;
			_scale9Grid = grid;
			
			_gridBitmap = _gridBitmaps[0];
			_gridBitmap.x = 0;
			_gridBitmap.y = 0;
			_gridBitmap.width = _width;
			_gridBitmap.height = _height;
			addChild(_gridBitmap);
			
			children = numChildren;
			for (s = children - 2;s >= 0; s--) {
				removeChildAt(s);
			}
			
			switch (gridType) {
				case GridType.SCALE_3_GRID_HORIZONTAL :
					height = _height;
					break; 
				case GridType.SCALE_3_GRID_VERTICAL :
					width = _width;
					break;
				default :
					setBlank(_width, _height); 
					break; 
			}
		}
		/** scale9Grid */
		override public function get scale9Grid() : Rectangle
		{
			if (_gridBitmap == null || _gridBitmap.scale9Grid == null) {
				return super.scale9Grid;
			} else {
				return _scale9Grid;
			}
		}
		override public function set scale9Grid(grid : Rectangle) : void
		{
			_scale9Grid = grid;
			_gridBitmap.scale9Grid = grid;
		}
		/** @private */
		override public function set width(value : Number) : void
		{
			scaleX = 1;
			_gridBitmap.width = value;
			_width = value;
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
			_height = value;
			if (int(value) != _gridBitmap.height) {
				super.height = value;
				setBlank(width, _gridBitmap.height);
			} else {
				setBlank(width, value);
			}
		}
		/** 
		 * gridType
		 * @default scale9Grid
		 */
		public function get gridType() : String
		{
			return _gridType;
		}
		public function set gridType(gridType : String) : void
		{
			_gridType = gridType;
			_gridBitmap.gridType = gridType;
		}
		/*
		 * frame methods
		 */
		override public function gotoAndPlay(frame : Object, scene : String = null) : void
		{
			changeBitmap(frame);
		}
		override public function gotoAndStop(frame : Object, scene : String = null) : void
		{
			changeBitmap(frame);
		}
		override public function nextFrame() : void
		{
			var frame : int;
			if (_currentFrame >= _gridBitmaps.length) {
				frame = _currentFrame;
			} else {
				frame = _currentFrame + 1;
			}
			changeBitmap(frame);
		}
		override public function prevFrame() : void
		{
			var frame : int;
			if (_currentFrame <= 1) {
				frame = _currentFrame;
			} else {
				frame = _currentFrame - 1;
			}
			changeBitmap(frame);
		}
		/*
		 * implement ISkinObject
		 */
		public function skinning(modeName : String = "default") : void
		{
			changeBitmap(modeName);
		}
		public function get flag() : String
		{
			for (var name:String in _labels) {
				if (_labels[name] == _currentFrame) return name;
			}
			return null;
		}
		public function get skinList() : Array
		{
			var list : Array = new Array();
			for (var name:String in _labels) {
				list.push(name);
			}
			return list;
		}
		/*
		 * utils
		 */
		private function getLabelFrameNumber(labelName : String) : int
		{
			if (_labels[labelName] != undefined) {
				return _labels[labelName];
			} else {
				trace("SSEN// ssen.core.display::McScaleBitmapMovieClip#getLabelFrameNumber() labelName 에 해당하는 label 이 없습니다.");
				return 1;
			}
		}
		private function changeBitmap(frame : Object) : void
		{
			if (frame is String) frame = getLabelFrameNumber(String(frame));
			var f : int = Number(frame);
			if (_currentFrame != f) {
				var gridBitmap : GridBitmap = _gridBitmaps[f - 1];
				gridBitmap.x = 0;
				gridBitmap.y = 0;
				gridBitmap.width = _width;
				gridBitmap.height = _height;
				gridBitmap.scale9Grid = _scale9Grid;
				gridBitmap.gridType = _gridType;
				
				removeChild(_gridBitmap);
				addChild(gridBitmap);
				_gridBitmap = gridBitmap;
				
				_currentFrame = f;
			}
		}
		// int 형식의 Bitmap Size 의 공백을 메꾼다
		private function setBlank(width : Number, height : Number) : void
		{
			var g : Graphics = graphics;
			g.clear();
			var w : int = width;
			var h : int = height;
			if ((width - w) != 0 || (height - h) != 0) {
				g.beginFill(0xffffff, 0);
				g.drawRect(0, 0, width, height);
				g.endFill();
			}
		}
		// 특정 movie clip 에서 padding 을 추출한다 
		private function getPadding(name : String) : Padding
		{
			var displayObject : DisplayObject = getChildByName(name);
			if (displayObject != null && displayObject.scale9Grid != null) {
				displayObject.visible = false;
				return GeomEx.rectangleToPadding(displayObject.scale9Grid, displayObject.width, displayObject.height);
			} 
			return null;
		}
		// 특정 movie clip 을 bitmap data 로 추출한다
		private function getThumbnail(name : String) : BitmapData
		{
			var displayObject : DisplayObject = getChildByName(name);
			if (displayObject != null) {
				displayObject.visible = false;
				return BitmapEx.displayObjectToBitmapData(displayObject, true);
			}
			return null;
		}
	}
}
