package ssen.component.buttons 
{
	import ssen.core.display.ISkinObject;
	import ssen.core.display.SSenSprite;
	import ssen.core.events.SSenEvent;

	import flash.display.DisplayObject;		
	/**
	 * SkinSprite 를 넣어서 간단하게 만드는 Button
	 * @author SSen
	 */
	public class SimpleSkinButton extends SSenSprite implements IButton
	{
		private var _buttonSkin : ISkinObject;
		private var _width : Number;
		private var _height : Number;
		private var _controller : ButtonController;

		public function SimpleSkinButton(buttonSkin : ISkinObject, buttonType : String = "normal")
		{
			_width = buttonSkin.width;
			_height = buttonSkin.height;
			_buttonSkin = buttonSkin;
			addChild(DisplayObject(buttonSkin));

			_controller = new ButtonController(this, buttonType);
			_controller.addEventListener(SSenEvent.SKINNING, skinning, false, 0, true);
			_controller.enable = true;
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
			_buttonSkin.width = value;
		}
		/** @private */
		override public function get height() : Number
		{
			return _height;
		}
		override public function set height(value : Number) : void
		{
			_height = value;
			_buttonSkin.height = value;
		}
		/* *********************************************************************
		 * implement IButton
		 ********************************************************************* */
		public function resourceKill() : void
		{
			_controller.resourceKill();
			_controller.removeEventListener(SSenEvent.SKINNING, skinning);
			_buttonSkin = null;
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
		 * skinning
		 ********************************************************************* */
		private function skinning(event : SSenEvent) : void
		{
			_buttonSkin.skinning(_controller.skinMode);
		}
	}
}
