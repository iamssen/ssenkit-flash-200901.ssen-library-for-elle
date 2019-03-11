package ssen.debug 
{
	import ssen.core.number.MathEx;

	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;		
	/**
	 * Description
	 * @author SSen
	 */
	public class TestBoxes 
	{
		public static function createTransparentBox(width : Number = 100, height : Number = 100) : Sprite
		{
			var sprite : Sprite = new Sprite();
			var g : Graphics = sprite.graphics;
			g.beginFill(0x000000, 0);
			g.drawRect(0, 0, width, height);
			g.endFill();
			
			return sprite;
		}
		public static function createColorBox(color : uint = 0xffffff, width : Number = 100, height : Number = 100) : Sprite
		{
			var sprite : Sprite = new Sprite();
			var g : Graphics = sprite.graphics;
			g.beginFill(color);
			g.drawRect(0, 0, width, height);
			g.endFill();
			
			return sprite; 
		}
		public static function getLineBox() : DisplayObject
		{
			var s : Shape = new Shape();
			var g : Graphics = s.graphics;
			var w : int = MathEx.rand(600, 4500);
			var h : int = MathEx.rand(600, 4500);
			g.beginFill(MathEx.rand(0x000000, 0xffffff));
			g.drawRect(0, 0, w, h);
			g.endFill();
			g.beginFill(0xC5D5FC);
			g.drawRect(0, 0, w, 10);
			g.drawRect(0, 10, 10, h - 20);
			g.drawRect(w - 10, 10, 10, h - 20);
			g.drawRect(0, h - 10, w, 10);
			g.endFill();
			
			return s;
		}
	}
}
