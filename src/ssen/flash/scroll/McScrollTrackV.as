package ssen.flash.scroll 
{
	import ssen.component.scroll.DirectionMode;
	import ssen.component.scroll.ScrollTrackBase;
	import ssen.core.display.ISkinObject;	
	/**
	 * @author SSen
	 */
	public class McScrollTrackV extends ScrollTrackBase
	{
		public function McScrollTrackV()
		{
			var trackSkin : ISkinObject = getChildByName("track") as ISkinObject;
			var thumbSkin : ISkinObject = getChildByName("thumb") as ISkinObject;
			
			setting(trackSkin, thumbSkin, DirectionMode.VERTICAL, trackSkin.width, trackSkin.height);
		}
	}
}
