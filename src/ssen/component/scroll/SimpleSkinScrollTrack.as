package ssen.component.scroll 
{
	import ssen.core.display.ISkinObject;
	import ssen.core.display.SSenSprite;	
	/**
	 * @author SSen
	 */
	public class SimpleSkinScrollTrack extends ScrollTrackBase
	{
		public function SimpleSkinScrollTrack(trackSkin : ISkinObject, thumbSkin : ISkinObject, width : Number, height : Number,
												direction : String = "vertical",
												container : IScrollContainer = null,
												sec : Number = 0,
												isTrackHide : Boolean = false,
												trackMode : String = "point",
												minValue : Number = 0,
												maxValue : Number = 0)
		{
			addChildren(trackSkin, thumbSkin);
			setting(trackSkin, thumbSkin, direction, width, height);
			if (container != null) init(container, sec, isTrackHide, trackMode, minValue, maxValue);
		}
	}
}
