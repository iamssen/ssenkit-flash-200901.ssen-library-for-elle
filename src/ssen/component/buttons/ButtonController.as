package ssen.component.buttons 
{
	import ssen.core.display.DisplayObjectEx;
	import ssen.core.display.SkinMode;
	import ssen.core.events.OnOffEvent;
	import ssen.core.events.SSenEvent;

	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;	
	/**
	 * @author SSen
	 */
	public class ButtonController extends EventDispatcher
	{
		// target object
		private var _object : IButton;
		private var _enable : Boolean;
		private var _buttonType : String;
		private var _skinMode : String;
		private var _toggleOn : Boolean;
		private var _mousePress : Boolean;

		public function ButtonController(object : IButton, buttonType : String = "normal")
		{
			_object = object;
			_buttonType = buttonType;
		}
		/** @copy ssen.component.base.ISSenComponent#enable */
		public function get enable() : Boolean
		{
			return _enable;
		}
		public function set enable(enable : Boolean) : void
		{
			if (enable) {
				_object.tabEnabled = true;
				_object.buttonMode = true;
				_object.mouseEnabled = true;
				skinDefault();
				eventOn();
			} else {
				_object.tabEnabled = false;
				_object.buttonMode = false;
				_object.mouseEnabled = false;
				skinDisabled();
				eventOff();
			}
			_object.mouseChildren = false;
			_enable = enable;
		}
		/** @copy ssen.component.base.ISSenComponent#resourceKill() */
		public function resourceKill() : void
		{
			eventOff();
			_object = null;
		}
		/** @copy ssen.component.buttons.IButton#toggleOn */
		public function get toggleOn() : Boolean
		{
			return (_buttonType == ButtonType.TOGGLE) ? _toggleOn : false;
		}
		public function set toggleOn(toggleOn : Boolean) : void
		{
			_toggleOn = (_buttonType == ButtonType.TOGGLE) ? toggleOn : false;
			skinDefault();
		}
		/** @copy ssen.component.buttons.IButton#buttonType */
		public function get buttonType() : String
		{
			return _buttonType;
		}
		public function set buttonType(buttonType : String) : void
		{
			_buttonType = buttonType;
			_toggleOn = false;
			if (_skinMode == SkinMode.SELECTED) _skinMode = SkinMode.DEFAULT;
			if (_buttonType == ButtonType.TOGGLE) {
				_object.addEventListener(MouseEvent.CLICK, mouseClick, false, 0, true);
			} else {
				_object.removeEventListener(MouseEvent.CLICK, mouseClick);
			}
			skinning();
		}
		/** @copy ssen.component.buttons.IButton#isMousePress */
		public function get isMousePress() : Boolean
		{
			return _mousePress;
		}
		/* *********************************************************************
		 * Event 
		 ********************************************************************* */
		private function eventOn() : void
		{
			_object.addEventListener(MouseEvent.MOUSE_OVER, mouseOver, false, 0, true);
			_object.addEventListener(MouseEvent.MOUSE_OUT, mouseOut, false, 0, true);
			_object.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown, false, 0, true);
			if (_buttonType == ButtonType.TOGGLE) _object.addEventListener(MouseEvent.CLICK, mouseClick, false, 0, true);
			_object.addEventListener(FocusEvent.FOCUS_IN, focusIn, false, 0, true);
			_object.addEventListener(FocusEvent.FOCUS_OUT, focusOut, false, 0, true);
		}
		private function eventOff() : void
		{
			_object.removeEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			_object.removeEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			_object.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			if (_buttonType == ButtonType.TOGGLE) _object.removeEventListener(MouseEvent.CLICK, mouseClick);
			_object.removeEventListener(FocusEvent.FOCUS_IN, focusIn);
			_object.removeEventListener(FocusEvent.FOCUS_OUT, focusOut);
			if (_object.stage.hasEventListener(MouseEvent.MOUSE_UP)) _object.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		private function focusOut(event : FocusEvent) : void
		{
			if (_enable) {
				skinDefault();
				_object.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
				_object.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
			}
		}
		private function focusIn(event : FocusEvent) : void
		{
			if (_enable) {
				skinOver();
				_object.addEventListener(KeyboardEvent.KEY_DOWN, keyDown, false, 0, true);
				_object.addEventListener(KeyboardEvent.KEY_UP, keyUp, false, 0, true);
			}
		}
		private function keyUp(event : KeyboardEvent) : void
		{
			if (event.keyCode == 32 || event.keyCode == 13) {
				skinOver();
				_object.dispatchEvent(new MouseEvent(MouseEvent.CLICK, true, false, 0, 0, null, event.ctrlKey, event.altKey, event.shiftKey));
			}
		}
		private function keyDown(event : KeyboardEvent) : void
		{
			if (event.keyCode == 32 || event.keyCode == 13) {
				skinDown();
			}
		}
		// 토글 클릭
		private function mouseClick(event : MouseEvent) : void
		{
			_toggleOn = (_toggleOn) ? false : true;
			_object.dispatchEvent(new OnOffEvent(OnOffEvent.ONOFF, _toggleOn));
			if (_toggleOn) {
				skinDown();
			} else {
				skinOver();
			}
		}
		// 마우스 눌렀다 뗌
		private function mouseUp(event : MouseEvent) : void
		{
			_object.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
			_mousePress = false;
			if (DisplayObjectEx.isPointerInRect(DisplayObject(_object), _object.getRect(DisplayObject(_object)))) {
				skinOver();
			} else {
				skinDefault();
			}
		}
		// 마우스 누름
		private function mouseDown(event : MouseEvent) : void
		{
			_object.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp, false, 0, true);
			_mousePress = true;
			skinDown();
		}
		// 마우스 벗어남
		private function mouseOut(event : MouseEvent) : void
		{
			skinDefault();
		}
		// 마우스 오버
		private function mouseOver(event : MouseEvent) : void
		{
			if (_mousePress) {
				skinDown();
			} else {
				skinOver();
			}
		}
		/* *********************************************************************
		 * Skinning Methods
		 ********************************************************************* */
		// 스킨 #기본 상태
		private function skinDefault() : void
		{
			if (_toggleOn) {
				_skinMode = SkinMode.SELECTED;
			} else {
				_skinMode = SkinMode.DEFAULT;
			}
			skinning();
		}
		// 스킨 #비활성화 상태
		private function skinDisabled() : void
		{
			_skinMode = SkinMode.DISABLE;
			skinning();
		}
		// 스킨 #오버되어 있는 모습
		private function skinOver() : void
		{
			_skinMode = SkinMode.OVER;
			skinning();
		}
		// 스킨 #누르는 순간
		private function skinDown() : void
		{
			_skinMode = SkinMode.ACTION;
			skinning();
		}
		private function skinning() : void
		{
			dispatchEvent(new SSenEvent(SSenEvent.SKINNING));
		}
		/** 현재의 skin mode */
		public function get skinMode() : String
		{
			return _skinMode;
		}
	}
}
