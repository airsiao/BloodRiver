package com.ourgame.mahjong.bloodriver.state
{
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.State;
	
	/**
	 * 发牌状态
	 * @author SiaoLeon
	 */
	public class DealCardsState extends State
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function DealCardsState(key:Object=null)
		{
			super(key);
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onEnter():void
		{
			Log.debug("进入", this.key);
		}
		
		override public function onExit():void
		{
			Log.debug("离开", this.key);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
