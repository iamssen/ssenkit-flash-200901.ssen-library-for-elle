package ssen.component.buttons 
{
	import ssen.core.display.ISkinObject;
	import ssen.core.geom.Padding;
	
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;		
	/**
	 * LabelButton 의 Skin Interface
	 * @author SSen
	 */
	public interface ILabelButtonSkin 
	{
		function button_bg() : ISkinObject;
		function get button_9grid() : Rectangle;
		function get button_innerGrid() : Padding;
		function get button_fontColors() : Dictionary;
	}
}
