package ssen.core.display 
{
	import ssen.core.array.ArrayEx;
	import ssen.core.display.SSenInteractiveObjectController;

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;	
	/**
	 * @author SSen
	 */
	public class SSenDisplayObjectContainerController extends SSenInteractiveObjectController 
	{
		public function SSenDisplayObjectContainerController(object : DisplayObjectContainer)
		{
			super(object);
		}
		private function get object() : DisplayObjectContainer
		{
			return _object as DisplayObjectContainer;
		}
		/** @copy ssen.core.display.ISSenSprite#addChildTo() */
		public function addChildTo(child : DisplayObject, dummy : DisplayObject, option : Array) : void
		{
			if (object.contains(dummy)) {
				if (option.length <= 0) option = ["x", "y", "index", "width", "height"];
				if (ArrayEx.findElement("index", option)) {
					object.addChildAt(child, object.getChildIndex(dummy));
					option = ArrayEx.delElement("index", option);
				} else {
					object.addChild(child);
				}
				var f : int;
				for (f = 0;f < option.length; f++) {
					child[option[f]] = dummy[option[f]];
				}
				object.removeChild(dummy);
			} else {
				throw new Error("SSenContainer#addChildTo : dummy 는 container 의 자식이 아닙니다.");
			}
		}
		/** @copy ssen.core.display.ISSenSprite#addChildren() */
		public function addChildren(children : Array) : void
		{
			var child : DisplayObject;
			for (var f : int = 0;f < children.length; f++) {
				child = children[f];
				object.addChild(child);
			}
		}
		/** @copy ssen.core.display.ISSenSprite#removeChildren() */
		public function removeChildren(...children : Array) : void
		{
			var child : DisplayObject;
			for (var f : int = 0;f < children.length; f++) {
				child = children[f];
				object.removeChild(child);
			}
		}
	}
}
