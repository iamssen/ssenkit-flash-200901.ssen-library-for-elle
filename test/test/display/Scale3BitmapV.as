package test.display 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	/**
	 * @author SSen
	 */
	public class Scale3BitmapV extends Bitmap 
	{
		/*
0 0 (a=1, b=0, c=0, d=1, tx=0, ty=0) (x=0, y=0, w=6, h=5)
0 1 (a=1, b=0, c=0, d=4.264473684210526, tx=0, ty=-16.32236842105263) (x=0, y=5, w=6, h=162.05)
0 2 (a=1, b=0, c=0, d=1, tx=0, ty=124.05000000000001) (x=0, y=167.05, w=6, h=7)
1 0 (a=2.5675675675675675, b=0, c=0, d=1, tx=-9.405405405405405, ty=0) (x=6, y=0, w=95, h=5)
1 1 (a=2.5675675675675675, b=0, c=0, d=4.264473684210526, tx=-9.405405405405405, ty=-16.32236842105263) (x=6, y=5, w=95, h=162.05)
1 2 (a=2.5675675675675675, b=0, c=0, d=1, tx=-9.405405405405405, ty=124.05000000000001) (x=6, y=167.05, w=95, h=7)
2 0 (a=1, b=0, c=0, d=1, tx=58, ty=0) (x=101, y=0, w=7, h=5)
2 1 (a=1, b=0, c=0, d=4.264473684210526, tx=58, ty=-16.32236842105263) (x=101, y=5, w=7, h=162.05)
2 2 (a=1, b=0, c=0, d=1, tx=58, ty=124.05000000000001) (x=101, y=167.05, w=7, h=7)
		 */
		
		public function Scale3BitmapV(bitmapData : BitmapData = null, pixelSnapping : String = "auto", smoothing : Boolean = false)
		{
			super(bitmapData, pixelSnapping, smoothing);
		}
	}
}
