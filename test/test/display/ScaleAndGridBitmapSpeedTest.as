package test.display 
{
	import bitmapDatas.bmd_testScaleBitmap;
	
	import ssen.core.display.GridBitmap;
	import ssen.core.display.SSenSprite;
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;		
	/**
	 * @author SSen
	 */
	public class ScaleAndGridBitmapSpeedTest extends SSenSprite 
	{
		public function ScaleAndGridBitmapSpeedTest()
		{
			var origin : BitmapData = new bmd_testScaleBitmap(0, 0);
			var rect : Rectangle = new Rectangle(10, 10, 10, 10);
			var t1 : Number = getTimer();
			var temp : GridBitmap;
			for (var f : int = 0;f < 10000; f++) {
				temp = new GridBitmap(origin.clone(), rect.clone());
				//temp.scale9Grid = rect.clone();
			}
			var t2 : Number = getTimer();
			
			trace(t2 - t1, t1, t2);
		}
	}
}
