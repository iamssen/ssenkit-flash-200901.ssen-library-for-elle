package test.display 
{
	import flash.geom.Rectangle;	
	import flash.display.Bitmap;	
	
	import bitmapDatas.bmd_testScaleBitmap;	
	
	import flash.display.BitmapData;	
	
	import ssen.core.display.SSenSprite;
	/**
	 * @author SSen
	 */
	public class BitmapDataDisplayTest extends SSenSprite 
	{
		public function BitmapDataDisplayTest()
		{
			var bmd : BitmapData = new bmd_testScaleBitmap(0, 0);
			var b1 : Bitmap = new Bitmap(bmd);
			var b2 : Bitmap = new Bitmap(bmd);
			b1.x = 10;
			b1.y = 10;
			b2.x = 50;
			b2.y = 10;
			bmd.fillRect(new Rectangle(2, 2, 5, 5), 0xeeeeee);
			trace(bmd.width, bmd.height);
			bmd.clone();
			
			addChildren(b1, b2);
		}
	}
}
