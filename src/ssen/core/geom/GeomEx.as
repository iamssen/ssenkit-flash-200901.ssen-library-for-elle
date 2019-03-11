package ssen.core.geom 
{
	import flash.geom.Rectangle;	
	/**
	 * @author SSen
	 */
	public class GeomEx 
	{
		public static function rectangleToPadding(rect : Rectangle, width : Number, height : Number) : Padding
		{
			return new Padding(rect.top, width - rect.left - rect.width, height - rect.top - rect.height, rect.left);
		}
	}
}
