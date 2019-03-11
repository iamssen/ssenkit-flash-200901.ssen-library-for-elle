package ssen.flash.scroll 
{
	import ssen.component.scroll.DirectionMode;
	import ssen.component.scroll.ScrollTrackBase;
	import ssen.core.display.ISkinObject;	
	/**
	 * @author SSen
	 */
	public class McScrollTrackH extends ScrollTrackBase
	{
		public function McScrollTrackH()
		{
			var trackSkin : ISkinObject = getChildByName("track") as ISkinObject;
			var thumbSkin : ISkinObject = getChildByName("thumb") as ISkinObject;
			
			setting(trackSkin, thumbSkin, DirectionMode.HORIZONTAL, trackSkin.width, trackSkin.height);
		}
	}
}
