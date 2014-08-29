package com.ourgame.mahjong.bloodriver.vo
{
	import com.wecoit.data.ValueObject;
	
	/**
	 * 玩家对象
	 * @author SiaoLeon
	 */
	public class Player extends ValueObject
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		/**
		 * 手牌
		 * @return
		 */
		public function get handCards():HandCards
		{
			return this.getProperty("handCards", new HandCards());
		}
		
		public function set handCards(value:HandCards):void
		{
			this.setProperty("handCards", value);
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function Player()
		{
			super();
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}