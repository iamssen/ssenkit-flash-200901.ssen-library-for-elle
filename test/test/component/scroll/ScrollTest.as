package test.component.scroll 
{
	import ssen.component.scroll.TrackMode;	
	import ssen.component.scroll.ScrollPane;	
	import ssen.component.scroll.DirectionMode;	
	import ssen.component.scroll.ScrollContainer;
	import ssen.component.scroll.SimpleSkinScrollTrack;
	import ssen.core.display.SSenSprite;
	import ssen.core.display.SkinMode;
	import ssen.core.display.SkinSprite;
	import ssen.debug.TestBoxes;

	import flash.utils.Dictionary;		
	/**
	 * @author SSen
	 */
	public class ScrollTest extends SSenSprite 
	{
		public function ScrollTest()
		{
			var container : ScrollContainer = new ScrollContainer(TestBoxes.getLineBox(), 300, 250);
			container.x = 10;
			container.y = 10;
			
			var thumbV : SkinSprite = getThumb();
			var trackV : SkinSprite = getTrack();
			var scrollTrackV : SimpleSkinScrollTrack = new SimpleSkinScrollTrack(trackV, thumbV, 20, 250, DirectionMode.VERTICAL);
			//scrollTrackV.position = container.nextPosition(0);
			
			var thumbH : SkinSprite = getThumb();
			var trackH : SkinSprite = getTrack();
			var scrollTrackH : SimpleSkinScrollTrack = new SimpleSkinScrollTrack(trackH, thumbH, 300, 20, DirectionMode.HORIZONTAL);
			//scrollTrackH.position = container.nextPositionBr(0);
			
			var pane : ScrollPane = new ScrollPane(TestBoxes.getLineBox(), scrollTrackH, scrollTrackV, 400, 250, null, 0.5, 0.5, false, TrackMode.PAGE, 0xeeeeee);
			pane.x = 10;
			pane.y = 10;
			addChildren(pane);
		}
		private function getThumb() : SkinSprite
		{
			var thumbVDic : Dictionary = new Dictionary(true);
			thumbVDic[SkinMode.DEFAULT] = TestBoxes.createColorBox(0xeeeeee, 100, 20);
			thumbVDic[SkinMode.OVER] = TestBoxes.createColorBox(0xaaaaaa, 100, 20);
			thumbVDic[SkinMode.ACTION] = TestBoxes.createColorBox(0x888888, 100, 20);
			thumbVDic[SkinMode.DISABLE] = TestBoxes.createColorBox(0xffffff, 100, 20);
			return new SkinSprite(thumbVDic);
		}
		private function getTrack() : SkinSprite
		{
			var trackVDic : Dictionary = new Dictionary(true);
			trackVDic[SkinMode.DEFAULT] = TestBoxes.createColorBox(0x81A9E8, 100, 20);
			trackVDic[SkinMode.ACTION] = TestBoxes.createColorBox(0x2359D6, 100, 20);
			trackVDic[SkinMode.DISABLE] = TestBoxes.createColorBox(0x000000, 100, 20);
			return new SkinSprite(trackVDic);
		}
	}
}
