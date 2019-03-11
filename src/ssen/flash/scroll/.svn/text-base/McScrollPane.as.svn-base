package ssen.flash.scroll 
{
	import ssen.core.geom.GeomEx;	
	import ssen.core.geom.Padding;	
	import ssen.component.scroll.DirectionMode;
	import ssen.component.scroll.IScroller;
	import ssen.component.scroll.ScrollContainer;
	import ssen.component.scroll.ScrollPaneBase;

	import flash.display.DisplayObject;	
	/**
	 * @author SSen
	 */
	public class McScrollPane extends ScrollPaneBase 
	{
		public function McScrollPane()
		{
			// background setting
			var background : DisplayObject = getChildByName("background");
			setChildIndex(background, 0);
			_background = background;
			// container setting
			_container = new ScrollContainer(null, background.width, background.height);
			addChildAt(_container, 1);
			// padding setting
			var padding : DisplayObject = getChildByName("padding");
			if (padding == null) {
				_padding = new Padding(1, 1, 1, 1);
			} else {
				padding.scaleX = 1;
				padding.scaleY = 1;
				_padding = GeomEx.rectangleToPadding(padding.scale9Grid, padding.width, padding.height);
				removeChild(padding);
			}
			
			var scrollerH : IScroller = getChildByName("scrollerH") as IScroller;
			var scrollerV : IScroller = getChildByName("scrollerV") as IScroller;
			if (scrollerH != null && scrollerV != null) {
				_width = background.width;
				_height = background.height;
				_directionMode = DirectionMode.VERTICAL_AND_HORIZONTAL;
				_scrollerH = scrollerH;
				_scrollerV = scrollerV;
				_scrollerH.init(_container);
				_scrollerV.init(_container);
			} else if (scrollerV != null) {
				_width = background.width;
				_height = background.height;
				_directionMode = DirectionMode.VERTICAL;
				_scrollerV = scrollerV;
				_scrollerV.init(_container);
			} else if (scrollerH != null) {
				_width = background.width;
				_height = background.height;
				_directionMode = DirectionMode.HORIZONTAL;
				_scrollerH = scrollerH;
				_scrollerH.init(_container);
			} else {
				throw new Error("ssen.component.scroll.ScrollPane :: scrollerH 와 scrollerV 둘 중 하나는 존재해야 합니다.");
			}
			
			align();
		}
	}
}
