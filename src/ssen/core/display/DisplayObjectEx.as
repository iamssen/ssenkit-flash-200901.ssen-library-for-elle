package ssen.core.display 
{
	import flash.display.Sprite;	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;		
	/**
	 * @author SSen
	 */
	public class DisplayObjectEx 
	{
		/**
		 * mousePointer 가 Rectangle 안에 위치하는지를 확인
		 * @param where 영역체크의 기준이 될 DisplayObject
		 * @param rect 영역체크에 사용될 Rectangle
		 */
		public static function isPointerInRect(where : DisplayObject, rect : Rectangle) : Boolean
		{
			var sx : Number = where.mouseX;
			var sy : Number = where.mouseY;
			if (sx > rect.x && sx < rect.x + rect.width && sy > rect.y && sy < rect.y + rect.height) {
				return true;
			} 
			return false;
		}
		/** 위치값들로 계산했을때 스테이지 밖으로 벗어나는지를 확인 X */
		public static function isObjectBehindX(stageX : int, width : int, stageWidth : int) : Boolean
		{
			if (stageX < 0 || stageX + width > stageWidth) {
				return true;
			}
			return false;
		}
		/** 위치값들로 계산했을때 스테이지 밖으로 벗어나는지를 확인 Y */
		public static function isObjectBehindY(stageY : int, height : int, stageHeight : int) : Boolean
		{
			if (stageY < 0 || stageY + height > stageHeight) {
				return true;
			}
			return false;
		} 
		/** bitmap asset 을 가져온다 */
		public static function getBitmapDefinition(where : DisplayObject, name : String) : BitmapData
		{
			var cl : Class = getDefinition(where, name);
			var bmd : BitmapData;
			bmd = new cl(0, 0);
			return bmd;
		}
		/** asset 을 가져온다 */
		public static function getDefinition(where : DisplayObject, name : String) : Class
		{
			var cl : Class;
			if (where.root != null && where.root.loaderInfo.applicationDomain.hasDefinition(name)) {
				cl = where.root.loaderInfo.applicationDomain.getDefinition(name) as Class;
			} else {
				cl = getDefinitionByName(name) as Class;
			}
			return cl;
		}
		public static function createTransparentShapeBox(width : Number = 100, height : Number = 100) : Shape
		{
			var shape : Shape = new Shape();
			var g : Graphics = shape.graphics;
			g.beginFill(0x000000, 0);
			g.drawRect(0, 0, width, height);
			g.endFill();
			
			return shape;
		}
		public static function createColorShapeBox(color : uint = 0xffffff, width : Number = 100, height : Number = 100) : Shape
		{
			var shape : Shape = new Shape();
			var g : Graphics = shape.graphics;
			g.beginFill(color);
			g.drawRect(0, 0, width, height);
			g.endFill();
			
			return shape; 
		}
		public static function createTransparentSpriteBox(width : Number = 100, height : Number = 100) : Sprite
		{
			var sprite : Sprite = new Sprite();
			var g : Graphics = sprite.graphics;
			g.beginFill(0x000000, 0);
			g.drawRect(0, 0, width, height);
			g.endFill();
			
			return sprite;
		}
		public static function createColorSpriteBox(color : uint = 0xffffff, width : Number = 100, height : Number = 100) : Sprite
		{
			var sprite : Sprite = new Sprite();
			var g : Graphics = sprite.graphics;
			g.beginFill(color);
			g.drawRect(0, 0, width, height);
			g.endFill();
			
			return sprite; 
		}
	}
}
