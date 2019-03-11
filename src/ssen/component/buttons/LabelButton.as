package ssen.component.buttons 
{
	import ssen.core.convert.GraphicsConverter;
	import ssen.core.display.ISkinObject;
	import ssen.core.display.SSenSprite;
	import ssen.core.display.SkinLabel;
	import ssen.core.events.SSenEvent;
	import ssen.core.geom.Padding;
	import ssen.core.geom.Position9;
	import ssen.core.text.ITextObject;
	import ssen.core.text.TextStyle;

	import flash.display.DisplayObject;
	import flash.utils.Dictionary;

	import ssen.core.text.FontRender;	
	/**
	 * @author SSen
	 */
	public class LabelButton extends SSenSprite implements IButton, ITextObject
	{
		private var _controller : ButtonController;
		private var _width : Number;
		private var _height : Number;
		// position9 내부 컨텐츠의 정렬
		private var _contentPosition9 : String;
		// 자동 사이즈 관련
		private var _autoWidth : Boolean;
		private var _autoHeight : Boolean;
		// 모양새들
		private var _content : SkinLabel;
		private var _bg : ISkinObject;
		private var _textStyle : TextStyle;
		private var _padding : Padding;
		private var _fontColors : Dictionary;

		public function LabelButton(skin : ILabelButtonSkin, title : String, 
									textStyle : TextStyle, thumbnail : DisplayObject = null, 
									thumbnailResize : Boolean = true, buttonType : String = "normal")
		{
			// skin 추출
			_padding = skin.button_innerGrid;
			_fontColors = skin.button_fontColors;
			_textStyle = textStyle;
			// object setting
			_content = new SkinLabel(title, GraphicsConverter.textStyleToTextStyles(textStyle, _fontColors), thumbnail, thumbnailResize);
			_bg = skin.button_bg();
			_width = _content.width + _padding.left + _padding.right;
			_height = _content.height + _padding.top + _padding.bottom;
			_bg.width = _width;
			_bg.height = _height;
			// setting
			_autoWidth = false;
			_autoHeight = false;
			_contentPosition9 = Position9.MC;
			
			addChildren(_bg, _content);
			align();
			
			_controller = new ButtonController(this, buttonType);
			_controller.addEventListener(SSenEvent.SKINNING, skinning, false, 0, true);
			_controller.enable = true;
		}
		/* *********************************************************************
		 * implements IButton 
		 ********************************************************************* */
		public function resourceKill() : void
		{
			_controller.resourceKill();
			_controller.removeEventListener(SSenEvent.SKINNING, skinning);
			if (_content != null) {
				removeChild(_content);
				_content = null;
			}
			removeChild(DisplayObject(_bg));
			_bg = null;
		}
		public function get toggleOn() : Boolean
		{
			return _controller.toggleOn;
		}
		public function set toggleOn(toggleOn : Boolean) : void
		{
			_controller.toggleOn = toggleOn;
		}
		public function get buttonType() : String
		{
			return _controller.buttonType;
		}
		public function set buttonType(buttonType : String) : void
		{
			_controller.buttonType = buttonType;
		}
		public function get isMousePress() : Boolean
		{
			return _controller.isMousePress;
		}
		public function get enable() : Boolean
		{
			return _controller.enable;
		}
		public function set enable(enable : Boolean) : void
		{
			_controller.enable = enable;
		}
		/* *********************************************************************
		 * public interface override 
		 ********************************************************************* */
		/** @private */
		override public function get width() : Number
		{
			return _width;
		}
		override public function set width(value : Number) : void
		{
			_width = value;
			align();
		}
		/** @private */
		override public function get height() : Number
		{
			return _height;
		}
		override public function set height(value : Number) : void
		{
			_height = value;
			align();
		}
		/* *********************************************************************
		 * public skinning interface 
		 ********************************************************************* */
		/** Skin 을 교체한다 */
		public function set skin(skin : ILabelButtonSkin) : void
		{
			var bg : ISkinObject = skin.button_bg();
			addChildTo(DisplayObject(bg), DisplayObject(_bg));
			_bg = bg;
			_padding = skin.button_innerGrid;
			_fontColors = skin.button_fontColors;
			_content.textStyles = GraphicsConverter.textStyleToTextStyles(_textStyle, skin.button_fontColors);
			skinning();
		}
		public function get padding() : Padding
		{
			return _padding.clone();
		}
		public function set padding(padding : Padding) : void
		{
			_padding = padding;
			align();
		}
		public function get textStyle() : TextStyle
		{
			return _textStyle;
		}
		public function set textStyle(textStyle : TextStyle) : void
		{
			_textStyle = textStyle;
			_content.textStyles = GraphicsConverter.textStyleToTextStyles(_textStyle, _fontColors);
			skinning();
			align();
		}
		/** 가로 사이즈 자동 맞추기 */
		public function get autoWidth() : Boolean
		{
			return _autoWidth;
		}
		public function set autoWidth(bool : Boolean) : void
		{
			_autoWidth = bool;
			align();
		}
		/** 높이 자동 맞추기 */
		public function get autoHeight() : Boolean
		{
			return _autoHeight;
		}
		public function set autoHeight(bool : Boolean) : void
		{
			_autoHeight = bool;
			align();
		}
		/** content position #lance.core.geom.Position9 constants TL, ML, BL... */
		public function get contentPosition9() : String
		{
			return _contentPosition9;
		}
		public function set contentPosition9(contentPosition9 : String) : void
		{
			_contentPosition9 = contentPosition9;
			align();
		}
		/* *********************************************************************
		 * private skinning utils
		 ********************************************************************* */
		// skinning
		private function skinning(event : SSenEvent = null) : void
		{
			_bg.skinning(_controller.skinMode);
			if (_content != null) _content.skinning(_controller.skinMode);
		}
		// 정렬한다
		private function align() : void
		{
			if (_content != null) {
				if (_autoWidth) {
					_content.autoSizeWidth();
				}
				
				// grid bitmap size
				var minWidth : Number = _content.width + _padding.left + _padding.right;
				var minHeight : Number = _content.height + _padding.top + _padding.bottom;
				
				if (_autoWidth || _width < minWidth) {
					_bg.width = minWidth;
					_width = minWidth;
				} else {
					_bg.width = _width;
				}
				if (_autoHeight || _height < minHeight) {
					_bg.height = minHeight;
					_height = minHeight;
				} else {
					_bg.height = _height;
				}
				
				// align txt and thumb
				var w : Number = _content.width;
				var h : Number = _content.height;
				var x : int;
				var y : int;
				switch (_contentPosition9) {
					case Position9.TL :
					case Position9.TC :
					case Position9.TR :
						y = _padding.top;
						break;
					case Position9.ML : 
					case Position9.MC :
					case Position9.MR : 
						y = (_bg.height >> 1) - (h >> 1);
						break;
					case Position9.BL :
					case Position9.BC : 
					case Position9.BR : 
						y = _bg.height - h - _padding.bottom;
						break;
				}
				switch (_contentPosition9) {
					case Position9.TL :
					case Position9.ML :
					case Position9.BL :
						x = _padding.left;
						break;
					case Position9.TC :
					case Position9.MC :
					case Position9.BC :
						x = (_bg.width >> 1) - (w >> 1);
						break;
					case Position9.TR :
					case Position9.MR :
					case Position9.BR :
						x = _bg.width - w - _padding.right;
						break;
				}
				_content.x = x;
				_content.y = y;
			} else {
				_bg.width = _width;
				_bg.height = _height;
			}
		}
		/* *********************************************************************
		 * implement ITextObject
		 ********************************************************************* */
		public function appendText(newText : String) : void
		{
			_content.appendText(newText);
			align();
		}
		public function replaceText(beginIndex : int, endIndex : int, newText : String) : void
		{
			_content.replaceText(beginIndex, endIndex, newText);
			align();
		}
		public function get length() : int
		{
			return _content.length;
		}
		public function get text() : String
		{
			return _content.text;
		}
		public function set text(value : String) : void
		{
			_content.text = value;
			align();
		}
		public function setFontRenderingStyle(embedFonts : Boolean = false, sharpness : Number = 0, thickness : Number = 0) : void
		{
			_content.setFontRenderingStyle(embedFonts, sharpness, thickness);
		}
		public function setFontRender(fontRender : FontRender = null) : void
		{
			_content.setFontRender(fontRender);
		}
	}
}
