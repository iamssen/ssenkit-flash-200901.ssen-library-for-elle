package ssen.core.display 
{
	import ssen.core.display.SSenBitmap;
	import ssen.core.events.PaddingEvent;
	import ssen.core.geom.Padding;
	import ssen.core.geom.Position9;
	
	import flash.display.BitmapData;
	import flash.geom.Point;	
	/**
	 * @author SSen
	 */
	public class AbstThumbnailBitmap extends SSenBitmap 
	{
		/** 화면에 출력될 BitmapData */
		protected var _canvas : BitmapData;
		/** 소스 BitmapData */
		protected var _source : BitmapData;
		/** Thumnail 의 위치 Grid */
		protected var _padding : Padding;
		/** width */
		protected var _width : int;
		/** height */
		protected var _height : int;
		/** Thumnail bitmapData - top left */ 
		protected var _tl : BitmapData;
		/** Thumnail bitmapData - top center */
		protected var _tc : BitmapData;
		/** Thumnail bitmapData - top right */
		protected var _tr : BitmapData;
		/** Thumnail bitmapData - middle left */
		protected var _ml : BitmapData;
		/** Thumnail bitmapData - middle center */
		protected var _mc : BitmapData;
		/** Thumnail bitmapData - middle right */
		protected var _mr : BitmapData;
		/** Thumnail bitmapData - bottom left */
		protected var _bl : BitmapData;
		/** Thumnail bitmapData - bottom center */
		protected var _bc : BitmapData;
		/** Thumnail bitmapData - bottom right */
		protected var _br : BitmapData;
		/** smoothing option */
		protected var _smoothing : Boolean;
		// thumnail 이 하나라도 존재하는지 판단
		private var _isThumb : Boolean;

		/**
		 * SSenBitmap
		 * @param source 소스가 될 BitmapData
		 * @param width width
		 * @param height height
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
		public function AbstThumbnailBitmap(source : BitmapData, 
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
			_source = source;
			_width = (width > 0) ? width : source.width;
			_height = (height > 0) ? height : source.height;
			_padding = (padding == null) ? new Padding() : padding;
			_smoothing = smoothing;
			if (tl != null) _tl = tl.clone();
			if (tc != null) _tc = tc.clone();
			if (tr != null) _tr = tr.clone();
			if (ml != null) _ml = ml.clone();
			if (mc != null) _mc = mc.clone();
			if (mr != null) _mr = mr.clone();
			if (bl != null) _bl = bl.clone();
			if (bc != null) _bc = bc.clone();
			if (br != null) _br = br.clone();
			_isThumb = checkThumb();
			
			_padding.addEventListener(PaddingEvent.PADDING_CHANGE, paddingChange, false, 0, true);
			
			draw();
		}
		/** 
		 * 특정 위치에 Thumnail 을 추가한다
		 * @param bitmapData Thumnail 의 bitmapData
		 * @param position Position9 위치값
		 * @see ssen.core.geom.Position9
		 */
		public function addThumb(bitmapData : BitmapData, position : String = "middleCenter") : void
		{
			switch (position) {
				case Position9.TL : 
					_tl = bitmapData.clone(); 
					break;
				case Position9.TC : 
					_tc = bitmapData.clone(); 
					break;
				case Position9.TR : 
					_tr = bitmapData.clone(); 
					break;
				case Position9.ML : 
					_ml = bitmapData.clone(); 
					break;
				case Position9.MC : 
					_mc = bitmapData.clone(); 
					break;
				case Position9.MR : 
					_mr = bitmapData.clone(); 
					break;
				case Position9.BL : 
					_bl = bitmapData.clone(); 
					break;
				case Position9.BC : 
					_bc = bitmapData.clone(); 
					break;
				case Position9.BR : 
					_br = bitmapData.clone(); 
					break;
			}
			_isThumb = true;
			draw();	
		}
		/**
		 * 특정 위치의 Thumnail 을 삭제한다.
		 * @param position Position9 위치값
		 * @see ssen.core.geom.Position9
		 */
		public function removeThumb(position : int = 5) : void
		{
			switch (position) {
				case Position9.TL : 
					disposeBitmapData(_tl);
					_tl = null; 
					break;
				case Position9.TC : 
					disposeBitmapData(_tc);
					_tc = null; 
					break;
				case Position9.TR : 
					disposeBitmapData(_tr);
					_tr = null; 
					break;
				case Position9.ML : 
					disposeBitmapData(_ml);
					_ml = null; 
					break;
				case Position9.MC : 
					disposeBitmapData(_mc);
					_mc = null; 
					break;
				case Position9.MR : 
					disposeBitmapData(_mr);
					_mr = null; 
					break;
				case Position9.BL : 
					disposeBitmapData(_bl);
					_bl = null; 
					break;
				case Position9.BC : 
					disposeBitmapData(_bc);
					_bc = null; 
					break;
				case Position9.BR : 
					disposeBitmapData(_br);
					_br = null; 
					break;
			}
			_isThumb = checkThumb();
			draw();
		}
		/** 비트맵 데이터가 null 이 아니라면 삭제한다 */
		protected function disposeBitmapData(target : BitmapData) : void
		{
			if (target != null) {
				target.dispose();
			}
		}
		/** @copy #_source */
		public function get source() : BitmapData
		{
			return _source;
		}
		public function set source(bitmapData : BitmapData) : void
		{
			_source = bitmapData.clone();
			draw();
		}
		/** @copy #_width */
		override public function get width() : Number
		{
			return _width;
		}
		override public function set width(value : Number) : void
		{
			_width = value;
			draw();
		}
		/** @copy #_height */
		override public function get height() : Number
		{
			return _height;
		}
		override public function set height(value : Number) : void
		{
			_height = value;
			draw();
		}
		/** @copy #_padding */
		public function get padding() : Padding
		{
			return _padding.clone();
		}
		public function set padding(padding : Padding) : void
		{
			if (_padding.hasEventListener(PaddingEvent.PADDING_CHANGE)) {
				_padding.removeEventListener(PaddingEvent.PADDING_CHANGE, paddingChange);
			}
			_padding = padding;
			
			_padding.addEventListener(PaddingEvent.PADDING_CHANGE, paddingChange, false, 0, true);
			
			draw();
		}
		/** 최종 결과물을 그린다. */
		protected function draw() : void
		{
			if (_isThumb) {
				drawThum(_tl, Position9.TL);
				drawThum(_tc, Position9.TC);
				drawThum(_tr, Position9.TR);
				drawThum(_ml, Position9.ML);
				drawThum(_mc, Position9.MC);
				drawThum(_mr, Position9.MR);
				drawThum(_bl, Position9.BL);
				drawThum(_bc, Position9.BC);
				drawThum(_br, Position9.BR);
			}
			
			bitmapData = _canvas;
		}
		/** 내부 BitmapData 객체들을 제거한다. */
		public function dispose() : void
		{
			disposeBitmapData(_canvas);
			disposeBitmapData(_source);
			if (_isThumb) {
				disposeBitmapData(_tl);
				disposeBitmapData(_tc);
				disposeBitmapData(_tr);
				disposeBitmapData(_ml);
				disposeBitmapData(_mc);
				disposeBitmapData(_mr);
				disposeBitmapData(_bl);
				disposeBitmapData(_bc);
				disposeBitmapData(_br);
			}
			bitmapData.dispose();
		}
		private function checkThumb() : Boolean
		{
			if (_tl != null && _tc != null && _tr != null && _ml != null && _mc != null && _mr != null && _bl != null && _bc != null && _br != null) {
				return false;
			}
			return true;
		}
		// padding 이 변화하면 event 를 받아서 새로 그린다
		private function paddingChange(event : PaddingEvent) : void
		{
			draw();
		}
		// 특정 위치의 thumbnail 을 그린다.
		private function drawThum(bitmapData : BitmapData, position : String) : void
		{
			if (bitmapData != null) {
				var w : int = bitmapData.width;
				var h : int = bitmapData.height;
				if (_width > w + _padding.left + _padding.right && _height > h + _padding.top + _padding.bottom) { 
					var point : Point = _padding.getPosition(position, _width, _height, w, h);
					_canvas.copyPixels(bitmapData, bitmapData.rect, point, null, null, true);
				}
			}
		}
		/** 캔바스를 지우고, 새로 만든다 */
		protected function clear() : void
		{
			if (_canvas != null) {
				_canvas.dispose();
			}
			_canvas = new BitmapData(_width, _height, true, 0x000000);
		}
		override public function get smoothing() : Boolean
		{
			return _smoothing;
		}
		override public function set smoothing(smoothing : Boolean) : void
		{
			_smoothing = smoothing;
			draw();
		}
	}
}
