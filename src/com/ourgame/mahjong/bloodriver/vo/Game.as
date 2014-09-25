package com.ourgame.mahjong.bloodriver.vo
{
	import com.wecoit.data.ArrayList;
	import com.wecoit.data.ValueObject;
	
	/**
	 * 游戏对象
	 * @author SiaoLeon
	 */
	public class Game extends ValueObject
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		/**
		 * 庄位
		 * @return
		 */
		public function get dealer():uint
		{
			return this.getProperty("dealer", 0);
		}
		
		public function set dealer(value:uint):void
		{
			this.setProperty("dealer", value);
		}
		
		/**
		 * 玩家列表
		 * @return
		 */
		public function get playerList():ArrayList
		{
			return this.getProperty("playerList", new ArrayList());
		}
		
		public function set playerList(value:ArrayList):void
		{
			this.setProperty("playerList", value);
		}
		
		/**
		 * 牌池
		 * @return
		 */
		public function get poolCards():Vector.<Card>
		{
			return this.getProperty("poolCards", new Vector.<Card>());
		}
		
		public function set poolCards(value:Vector.<Card>):void
		{
			this.setProperty("poolCards", value);
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function Game()
		{
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
