package ssen.component.scroll 
{
	import ssen.component.base.IInput;
	import ssen.component.base.ISSenComponent;
	import ssen.core.display.ISSenSprite;
	import ssen.core.display.ISprite;		
	/**
	 * @author SSen
	 */
	public interface ISlider extends ISprite, ISSenComponent, IInput, ISSenSprite
	{
		/** 최소값을 셋팅 */
		function get minValue() : Number
		function set minValue(minValue : Number) : void
		/** 최대값을 셋팅 */
		function get maxValue() : Number
		function set maxValue(maxValue : Number) : void
		/** 현재 위치의 0~1 값 */
		function get sec() : Number
		function set sec(sec : Number) : void
		/**
		 * wheel 이벤트에 대한 수신
		 * @param delta event.delta Mouse 이벤트 객체의 delta 값
		 */
		function wheel(delta : int) : void
		/**
		 * content 의 x (혹은 y) 위치를 직접적으로 컨트롤 합니다
		 */
		function move(pixel : int) : void
	}
}
