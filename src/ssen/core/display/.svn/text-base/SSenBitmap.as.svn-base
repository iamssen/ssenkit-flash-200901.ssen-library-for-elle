package ssen.core.display 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;		
	/**
	 * GridBitmap, PatternBitmap 의 기본형
	 * @author SSen
	 */
	public class SSenBitmap extends Bitmap implements ISSenDisplayObject
	{
		private var _controller : SSenDisplayObjectController;

		public function SSenBitmap(bitmapData : BitmapData = null, pixelSnapping : String = "auto", smoothing : Boolean = false)
		{
			super(bitmapData, pixelSnapping, smoothing);
			_controller = new SSenDisplayObjectController(this);
		}
		/* *********************************************************************
		 * implement ISSenDisplayObject
		 ********************************************************************* */
		/** @copy ssen.core.display.ISSenSprite#hover */		
		public function get hover() : Boolean
		{
			return _controller.hover;
		}
		public function set hover(hover : Boolean) : void
		{
			_controller.hover = hover;
		}
		/** @copy ssen.core.display.ISSenSprite#canvas */
		public function get canvas() : Sprite
		{
			return _controller.canvas;
		}
		/** @copy ssen.core.display.ISSenSprite#globalPosition */
		public function get globalPosition() : Point
		{
			return _controller.globalPosition;
		}
		public function set globalPosition(point : Point) : void
		{
			_controller.globalPosition = point;
		}
		/** @copy ssen.core.display.ISSenSprite#globalX */
		public function get globalX() : Number
		{
			return _controller.globalX;
		}
		public function set globalX(value : Number) : void
		{
			_controller.globalX = value;
		}
		/** @copy ssen.core.display.ISSenSprite#globalY */
		public function get globalY() : Number
		{
			return _controller.globalY;
		}
		public function set globalY(value : Number) : void
		{
			_controller.globalY = value;
		}
		/** @copy ssen.core.display.ISSenSprite#position */
		public function get position() : Point
		{
			return _controller.position;
		}
		public function set position(point : Point) : void
		{
			_controller.position = point;
		}
		/** @copy ssen.core.display.ISSenSprite#nextX() */
		public function nextX(spaceX : int = 0) : Number
		{
			return _controller.nextX(spaceX);
		}
		/** @copy ssen.core.display.ISSenSprite#nextY() */
		public function nextY(spaceY : int = 0) : Number
		{
			return _controller.nextY(spaceY);
		}
		/** @copy ssen.core.display.ISSenSprite#index */
		public function get index() : int
		{
			return _controller.index;
		}
		public function set index(index : int) : void
		{
			_controller.index = index;
		}
		/** @copy ssen.core.display.ISSenSprite#nextPosition() */
		public function nextPosition(spaceX : int = 5) : Point
		{
			return _controller.nextPosition(spaceX);
		}
		/** @copy ssen.core.display.ISSenSprite#nextPositionBr() */
		public function nextPositionBr(spaceY : int = 5) : Point
		{
			return _controller.nextPositionBr(spaceY);
		}
	}
}
