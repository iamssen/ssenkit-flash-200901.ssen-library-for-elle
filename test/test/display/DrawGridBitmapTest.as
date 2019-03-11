package test.display 
{
	import bitmapDatas.bmd_skinBitmap1;
	import bitmapDatas.bmd_skinBitmap2;
	import bitmapDatas.bmd_skinBitmap3;
	import bitmapDatas.bmd_skinBitmap4;
	import bitmapDatas.bmd_skinBitmap5;
	import bitmapDatas.bmd_testScaleBitmap;

	import ssen.core.array.RandomProperty;
	import ssen.core.display.GridBitmap;
	import ssen.core.display.GridType;
	import ssen.core.display.SSenSprite;
	import ssen.core.display.SkinGridBitmap;
	import ssen.core.display.SkinGridBitmapSprite;
	import ssen.core.graphics.BitmapEx;
	import ssen.core.number.MathEx;
	import ssen.debug.TestButtonGroup;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;	
	/**
	 * @author SSen
	 */
	public class DrawGridBitmapTest extends SSenSprite 
	{
		private var _sgbRP : RandomProperty;
		private var _sgb : SkinGridBitmap;
		private var _sgbs : SkinGridBitmapSprite;
		private var _sgbsRP : RandomProperty;

		public function DrawGridBitmapTest()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		private function addedToStage(event : Event) : void
		{
			// bg color
			var g : Graphics = graphics;
			g.beginFill(0xeeeeee);
			g.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			g.endFill();
			
			// bitmap ex draw functions
			var grid : Rectangle = new Rectangle(10, 10, 10, 10);
			var source : BitmapData = new bmd_testScaleBitmap(0, 0);
			
			var grid9 : BitmapData = BitmapEx.drawGrid9Bitmap(source, grid, 60, 80);
			var bitmap9 : Bitmap = new Bitmap(grid9);
			bitmap9.x = 10;
			bitmap9.y = 10;
			
			var grid3v : BitmapData = BitmapEx.drawGrid3BitmapVertical(source, grid, 90);
			var bitmap3v : Bitmap = new Bitmap(grid3v);
			bitmap3v.x = bitmap9.x + bitmap9.width + 10;
			bitmap3v.y = 10;
			
			var grid3h : BitmapData = BitmapEx.drawGrid3BitmapHorizontal(source, grid, 120);
			var bitmap3h : Bitmap = new Bitmap(grid3h);
			bitmap3h.x = bitmap3v.x + bitmap3v.width + 10;
			bitmap3h.y = 10;
			
			// skin grid bitmap
			var sgbDic : Dictionary = new Dictionary(true);
			sgbDic["default"] = new bmd_skinBitmap1(0, 0);
			sgbDic["over"] = new bmd_skinBitmap2(0, 0);
			sgbDic["down"] = new bmd_skinBitmap3(0, 0);
			sgbDic["disable"] = new bmd_skinBitmap4(0, 0);
			sgbDic["selected"] = new bmd_skinBitmap5(0, 0);
			_sgb = new SkinGridBitmap(sgbDic, new Rectangle(6, 6, 37, 37), GridType.SCALE_9_GRID, 100, 100);
			_sgbRP = new RandomProperty(_sgb.skinList);
			_sgb.x = 10;
			_sgb.y = 110;
			
			var test : TestButtonGroup = new TestButtonGroup("sgb random skinning", sgbClick, "sgb random size", sgbSize);
			test.width = stage.stageWidth - 20;
			test.x = 10;
			test.y = 220;
			
			var sgbsDic : Dictionary = new Dictionary();
			sgbsDic["default"] = new GridBitmap(new bmd_skinBitmap1(0, 0), new Rectangle(6, 6, 37, 37), GridType.SCALE_9_GRID, 100, 100);
			sgbsDic["over"] = new GridBitmap(new bmd_skinBitmap2(0, 0), new Rectangle(6, 6, 37, 37), GridType.SCALE_9_GRID, 100, 100);
			sgbsDic["down"] = new GridBitmap(new bmd_skinBitmap3(0, 0), new Rectangle(6, 6, 37, 37), GridType.SCALE_9_GRID, 100, 100);
			sgbsDic["disable"] = new GridBitmap(new bmd_skinBitmap4(0, 0), new Rectangle(6, 6, 37, 37), GridType.SCALE_9_GRID, 100, 100);
			sgbsDic["selected"] = new GridBitmap(new bmd_skinBitmap5(0, 0), new Rectangle(6, 6, 37, 37), GridType.SCALE_9_GRID, 100, 100);
			_sgbs = new SkinGridBitmapSprite(sgbsDic);
			_sgbsRP = new RandomProperty(_sgbs.skinList);
			_sgbs.x = 170;
			_sgbs.y = 110;
			
			test.addTest("sgbs random skinning", sgbsClick, "sgbs random size", sgbsSize);
			
			addChildren(bitmap9, bitmap3v, bitmap3h, _sgb, test, _sgbs);
		}
		private function sgbsClick() : void
		{
			var mode : String = String(_sgbsRP.random());
			_sgbs.skinning(mode); 
		}
		private function sgbsSize() : void
		{
			var w : int = MathEx.rand(50, 150);
			var h : int = MathEx.rand(50, 100);
			_sgbs.width = w;
			_sgbs.height = h;
		}
		private function sgbClick() : void
		{
			var mode : String = String(_sgbRP.random());
			_sgb.skinning(mode);
		}
		private function sgbSize() : void
		{
			var w : int = MathEx.rand(50, 150);
			var h : int = MathEx.rand(50, 100);
			_sgb.width = w;
			_sgb.height = h;
		}
	}
}
