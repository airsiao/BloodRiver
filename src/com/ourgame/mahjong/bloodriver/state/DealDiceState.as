package com.ourgame.mahjong.bloodriver.state
{
	import com.ourgame.mahjong.bloodriver.view.DealDiceView;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.State;
	
	/**
	 * 发牌骰子状态
	 * @author SiaoLeon
	 */
	public class DealDiceState extends State
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public var view:DealDiceView;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function DealDiceState(key:Object=null)
		{
			super(key);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onInit():void
		{
			this.view = new DealDiceView();
		}
		
		override public function onEnter():void
		{
			Log.debug("进入", this.key);
			
			this.addView(this.view);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
