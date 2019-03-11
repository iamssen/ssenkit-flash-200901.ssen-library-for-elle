package test.component.buttons 
{
	import ssen.component.buttons.ButtonType;	
	import ssen.core.text.TextStyle;	

	import bitmapDatas.LabelButtonBitmap;	

	import ssen.component.buttons.LabelButtonSkin;	
	import ssen.component.buttons.LabelButton;	
	import ssen.debug.TestButtonGroup;	
	import ssen.component.buttons.SimpleSkinButton;	
	import ssen.debug.TestBoxes;	
	import ssen.core.display.SkinMode;	

	import flash.utils.Dictionary;	

	import ssen.core.display.SkinSprite;	
	import ssen.core.display.SSenSprite;
	/**
	 * @author SSen
	 */
	public class ButtonTest extends SSenSprite 
	{
		private var ssb : SimpleSkinButton;
		private var lb : LabelButton;

		public function ButtonTest()
		{
			var sdic : Dictionary = new Dictionary(true);
			sdic[SkinMode.DEFAULT] = TestBoxes.createColorBox(0xeeeeee, 100, 20);
			sdic[SkinMode.OVER] = TestBoxes.createColorBox(0xaaaaaa, 100, 20);
			sdic[SkinMode.ACTION] = TestBoxes.createColorBox(0x888888, 100, 20);
			sdic[SkinMode.DISABLE] = TestBoxes.createColorBox(0xffffff, 100, 20);
			sdic[SkinMode.SELECTED] = TestBoxes.createColorBox(0x000000, 100, 20);
			var ssp : SkinSprite = new SkinSprite(sdic);
			ssb = new SimpleSkinButton(ssp);
			ssb.x = 10;
			ssb.y = 10;
			
			var lbs : LabelButtonSkin = new LabelButtonSkin(new LabelButtonBitmap(0, 0));
			var ts : TextStyle = new TextStyle();
			lb = new LabelButton(lbs, "test label button", ts);
			lb.position = ssb.nextPosition();
			
			var test : TestButtonGroup = new TestButtonGroup("toggle change", toggleChange, "buttonType change", buttonTypeChange);
			test.position = ssb.nextPositionBr();
			
			addChildren(ssb, lb, test);
		}
		private function buttonTypeChange() : void
		{
			ssb.buttonType = (ssb.buttonType == ButtonType.NORMAL) ? ButtonType.TOGGLE : ButtonType.NORMAL;
			lb.buttonType = (lb.buttonType == ButtonType.NORMAL) ? ButtonType.TOGGLE : ButtonType.NORMAL;
		}
		private function toggleChange() : void
		{
			ssb.toggleOn = (ssb.toggleOn) ? false : true;
			lb.toggleOn = (lb.toggleOn) ? false : true;
		}
	}
}
