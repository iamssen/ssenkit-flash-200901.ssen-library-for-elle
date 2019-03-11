package ssen.core.text 
{
	import flash.text.AntiAliasType;	

	import ssen.core.events.FontRenderEvent;	
	import ssen.core.display.ISSenInteractiveObject;
	import ssen.core.display.SSenInteractiveObjectController;
	import ssen.core.text.TextFieldEx;
	import ssen.core.text.TextStyle;

	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;	
	/**
	 * SSen Textfield
	 * @author SSen
	 */
	public class SSenTextField extends TextField implements ITextObject, ISSenInteractiveObject
	{
		private var _autoReplaceOverText : Boolean;
		private var _text : String;
		private var _fixWidth : Number;
		private var _fixHeight : Number;
		private var _htmlMode : Boolean;
		private var _controller : SSenInteractiveObjectController;
		private var _fontRender : FontRender;

		public function SSenTextField()
		{
			_text = "";
			_controller = new SSenInteractiveObjectController(this);
		}
		/** text 에 맞춰서 자동으로 폭을 맞춘다 */
		public function autoSizeWidth() : void
		{
			width = fixWidth;
		}
		/** text 에 맞춰서 자동으로 높이를 맞춘다 */
		public function autoSizeHeight() : void
		{
			height = fixHeight;
		}
		/** text 에 맞춰진 고정 폭 */
		public function get fixWidth() : Number
		{
			if (_autoReplaceOverText) {
				return _fixWidth;
			} else {
				if (!multiline) {
					return textWidth + 4;
				} else {
					var max : Number = 0;
					var temp : Number;
					var i : int;
					for (i = 0;i < numLines; i++) {
						temp = getLineMetrics(i).width;
						if (temp > max) {
							max = temp;
						}
					}
					return max + 4;
				}
			} 
		}
		/** text 에 맞춰진 고정 높이 */
		public function get fixHeight() : Number
		{
			if (_autoReplaceOverText) {
				return _fixHeight;
			} else {
				if (!multiline) {
					return textHeight + 4;
				} else {
					var total : Number = 0;
					var i : int;
					for (i = 0;i < numLines; i++) {
						total += getLineMetrics(i).height;
					}
					return total + 4;
				}
			}
			
			return (_autoReplaceOverText) ? _fixHeight : textHeight + 4;
		}
		/** @private */
		override public function get text() : String
		{
			if (!_autoReplaceOverText) {
				return super.text;
			} else if (!_htmlMode) {
				return _text;
			} else {
				var str : String;
				autoReplaceOverText = false;
				str = super.text;
				autoReplaceOverText = true;
				return str;
			}
		} 
		override public function set text(text : String) : void
		{
			_htmlMode = false;
			
			_text = text;
			super.text = _text;
			_fixWidth = textWidth + 4;
			_fixHeight = textHeight + 4;
			if (_autoReplaceOverText) {
				replaceOverText();
			}
		}
		/** @private */
		override public function get htmlText() : String
		{
			if (!_autoReplaceOverText) {
				return super.htmlText;
			} else {
				var str : String;
				autoReplaceOverText = false;
				str = super.htmlText;
				autoReplaceOverText = true;
				return str;
			}
		} 
		override public function set htmlText(htmlText : String) : void
		{
			_htmlMode = true;
			
			_text = htmlText;
			super.htmlText = _text;
			_fixWidth = textWidth + 4;
			_fixHeight = textHeight + 4;
			if (_autoReplaceOverText) {
				replaceOverText();
			}
		}
		/** @private */
		override public function set width(value : Number) : void
		{
			super.width = value;
			writeText();
			_fixWidth = textWidth + 4;
			if (_autoReplaceOverText) {
				replaceOverText();
			}
		}
		/** @private */
		override public function set height(value : Number) : void
		{
			super.height = value;
			writeText();
			_fixHeight = textHeight + 4;
			if (_autoReplaceOverText) {
				replaceOverText();
			}
		}
		/** 사이즈에 따라 자동으로 OverText 를 줄임처리 한다 */
		public function get autoReplaceOverText() : Boolean
		{
			return _autoReplaceOverText;
		}
		public function set autoReplaceOverText(autoReplaceOverText : Boolean) : void
		{
			if (autoReplaceOverText) {
				if (_autoReplaceOverText) {
					_fixWidth = textWidth + 4;
					_fixHeight = textHeight + 4;
				}
				replaceOverText();
			} else {
				writeText();
			}
			_autoReplaceOverText = autoReplaceOverText;
		}
		private function replaceOverText() : void
		{
			TextFieldEx.replaceOverText(this);
		}
		/** @private */
		public override function setTextFormat(format : TextFormat, beginIndex : int = -1, endIndex : int = -1) : void
		{
			if (format is TextStyle) {
				var style : TextStyle = format as TextStyle;
				if (style.color == null || style.color < 0) style.color = 0x000000;
				setFontRenderingStyle(style.embedFonts, style.sharpness, style.thickness);
				super.setTextFormat(style, beginIndex, endIndex);
			} else {
				super.setTextFormat(format, beginIndex, endIndex);
			}
		}
		/** @private */
		public override function set defaultTextFormat(format : TextFormat) : void
		{
			if (format is TextStyle) {
				var style : TextStyle = format as TextStyle;
				if (style.color == null || style.color < 0) style.color = 0x000000;
				setFontRenderingStyle(style.embedFonts, style.sharpness, style.thickness);
				super.defaultTextFormat = style;
			} else {
				super.defaultTextFormat = format;
			}
		}
		/** border 와 background 를 설정한다 */
		public function setBoxStyle(border : Boolean = false, borderColor : uint = 0x000000, background : Boolean = false, backgroundColor : uint = 0xffffff) : void
		{
			this.border = border;
			this.borderColor = borderColor;
			this.background = background;
			this.backgroundColor = backgroundColor;
		}
		/** font 의 렌더링에 영향을 미치는 부분을 설정한다 */
		public function setFontRenderingStyle(embedFonts : Boolean = false, sharpness : Number = 0, thickness : Number = 0) : void
		{
			if (embedFonts) {
				antiAliasType = AntiAliasType.ADVANCED;
			}
			this.embedFonts = embedFonts;
			this.sharpness = sharpness;
			this.thickness = thickness;
		}
		private function writeText() : void
		{
			if (!_htmlMode) {
				super.text = _text;
			} else {
				super.htmlText = _text;
			}
		}
		public function setFontRender(fontRender : FontRender = null) : void
		{
			if (_fontRender != null) {
				_fontRender.removeEventListener(FontRenderEvent.RENDER_CHANGE, renderChange);
			}
			_fontRender = fontRender;
			if (_fontRender != null) {
				setFontRenderingStyle(true, _fontRender.sharpness, _fontRender.thickness);
				_fontRender.addEventListener(FontRenderEvent.RENDER_CHANGE, renderChange, false, 0, true);
			}
		}
		private function renderChange(event : FontRenderEvent) : void
		{
			setFontRenderingStyle(true, _fontRender.sharpness, _fontRender.thickness);
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