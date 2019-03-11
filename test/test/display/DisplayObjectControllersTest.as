package test.display 
{
	import ssen.core.text.TextStyle;	
	import ssen.core.text.SSenTextField;	
	
	import flash.display.DisplayObject;	
	import flash.filters.BlurFilter;	
	import flash.events.MouseEvent;	

	import ssen.debug.TestButtonGroup;	

	import bitmapDatas.bmd_skinBitmap1;	
	import bitmapDatas.bmd_testScaleBitmap;

	import ssen.core.display.SSenBitmap;
	import ssen.core.display.SSenSprite;		
	/**
	 * @author SSen
	 */
	public class DisplayObjectControllersTest extends SSenSprite 
	{
		private var bm : SSenBitmap;
		private var text : SSenTextField;

		public function DisplayObjectControllersTest()
		{
			bm = new SSenBitmap(new bmd_testScaleBitmap(0, 0));
			bm.x = 10;
			bm.y = 10;
			
			var bm2 : SSenBitmap = new SSenBitmap(new bmd_skinBitmap1(0, 0));
			bm2.position = bm.nextPosition();
			
			var test : TestButtonGroup = new TestButtonGroup("hover bm", hoverBm, "trace canvas", traceCanvas);
			test.position = bm.nextPositionBr(40);
			
			text = new SSenTextField();
			text.defaultTextFormat = new TextStyle();
			text.border = true;
			text.width = 150;
			text.height = 30;
			text.text = "가나다라마바사아자차카타파하";
			text.position = bm2.nextPosition();
			
			addChildren(bm, bm2, text, test);
		}
		private function hoverBm() : void
		{
			var pre : DisplayObject = text.parent;
			text.hover = true;
			trace("hoverBm :", pre, " >>>", text.parent);
			filters = [new BlurFilter()];
			canvas.mouseChildren = false;
			stage.addEventListener(MouseEvent.MOUSE_DOWN, hoverBmCancel);
		}
		private function hoverBmCancel(event : MouseEvent) : void
		{
			var pre : DisplayObject = text.parent;
			text.hover = false;
			trace("hoverBmCancel :", pre, " >>>", text.parent);
			filters = [];
			canvas.mouseChildren = true;
			stage.removeEventListener(MouseEvent.MOUSE_DOWN, hoverBmCancel);
		}
		private function traceCanvas() : void
		{
			trace(bm.canvas);
		}
	}
}
