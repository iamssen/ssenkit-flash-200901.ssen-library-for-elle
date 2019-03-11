package ssen.core.display 
{
	import ssen.core.display.ISSenInteractiveObject;

	import flash.display.DisplayObject;	
	/**
	 * @author SSen
	 */
	public interface ISSenDisplayObjectContainer extends ISSenInteractiveObject 
	{
		/**
		 * dummy 의 index, width, height, x, y 등을 승계받아서 addChild 시킨다.
		 * @param child 추가할 자식
		 * @param dummy 대체할 자식
		 * @param option 승계할 옵션들 , 기본 = x, y, index, width, height
		 */
		function addChildTo(child : DisplayObject, dummy : DisplayObject, ...option) : void;
		/** 복수의 자식을 addChild 시킨다 */
		function addChildren(...children : Array) : void;
		/** 복수의 자식을 removeChild 시킨다 */
		function removeChildren(...children : Array) : void;
	}
}
