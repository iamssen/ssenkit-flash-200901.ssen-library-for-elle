package test.component.base 
{
	import ssen.core.display.SSenSprite;
	/**
	 * @author SSen
	 */
	public class TestComponentRoot extends SSenSprite 
	{
		public function TestComponentRoot()
		{
			var t1 : TestComponent1 = new TestComponent1();
			var t2 : TestComponent2 = new TestComponent2();
			t1.x = 10;
			t1.y = 10;
			t2.x = 120;
			t2.y = 10;
			
			addChildren(t1, t2);
		}
	}
}
