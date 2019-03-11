package ssen.core.display 
{
	import ssen.core.display.GridBitmapSprite;
	import ssen.core.display.SkinMode;
	
	import flash.utils.Dictionary;	
	/**
	 * SkinObject : 여러장의 GridBitmap 을 SkinMode 에 따라 보여준다
	 * @author SSen
	 */
	public class SkinGridBitmapSprite extends GridBitmapSprite implements ISkinObject
	{
		private var _skins : Dictionary;
		private var _flag : String;

		public function SkinGridBitmapSprite(skins : Dictionary)
		{
			super(skins[SkinMode.DEFAULT]);
			_skins = skins;
			_flag = SkinMode.DEFAULT;
		}
		/** @copy ssen.core.display.ISkinObject#skinning() */
		public function skinning(modeName : String = SkinMode.DEFAULT) : void
		{
			gridBitmap = _skins[modeName];
			_flag = modeName; 
		}
		/** @copy ssen.core.display.ISkinObject#flag */
		public function get flag() : String 
		{
			return _flag;
		}
		/** @copy ssen.core.display.ISkinObject#skinList */
		public function get skinList() : Array
		{
			var arr : Array = new Array();
			var name : String;
			for (name in _skins) {
				arr.push(name);
			}
			return arr;
		}
	}
}
