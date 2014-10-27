package com.ourgame.mahjong.bloodriver.vo
{
	import com.netease.protobuf.UInt64;
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
		 * ID
		 * @return
		 */
		public function get id():UInt64
		{
			return this.getProperty("id", new UInt64());
		}
		
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
		 * 开牌骰子
		 * @return
		 */
		public function get dealDice():Array
		{
			return this.getProperty("dealDice", new Array());
		}
		
		public function set dealDice(value:Array):void
		{
			this.setProperty("dealDice", value);
		}
		
		/**
		 * 换牌骰子
		 * @return
		 */
		public function get swapDice():Array
		{
			return this.getProperty("swapDice", new Array());
		}
		
		public function set swapDice(value:Array):void
		{
			this.setProperty("swapDice", value);
		}
		
		/**
		 * 换牌时间
		 * @return
		 */
		public function get swapTime():uint
		{
			return this.getProperty("swapTime", 0);
		}
		
		public function set swapTime(value:uint):void
		{
			this.setProperty("swapTime", value);
		}
		
		/**
		 * 换出的牌
		 * @return
		 */
		public function get swapOut():Vector.<Card>
		{
			return this.getProperty("swapOut", new Vector.<Card>());
		}
		
		public function set swapOut(value:Vector.<Card>):void
		{
			this.setProperty("swapOut", value);
		}
		
		/**
		 * 换入的牌
		 * @return
		 */
		public function get swapIn():Vector.<Card>
		{
			return this.getProperty("swapIn", new Vector.<Card>());
		}
		
		public function set swapIn(value:Vector.<Card>):void
		{
			this.setProperty("swapIn", value);
		}
		
		/**
		 * 基础分
		 * @return
		 */
		public function get score():uint
		{
			return this.getProperty("score", 0);
		}
		
		public function set score(value:uint):void
		{
			this.setProperty("score", value);
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
		 * 牌墙剩余张数
		 * @return
		 */
		public function get remainCards():uint
		{
			return this.getProperty("remainCards", 0);
		}
		
		public function set remainCards(value:uint):void
		{
			this.setProperty("remainCards", value);
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function Game(id:UInt64)
		{
			super();
			
			this.setProperty("id", id);
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
