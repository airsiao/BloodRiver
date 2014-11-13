package com.ourgame.mahjong.bloodriver.common.vo
{
	import com.wecoit.data.ArrayList;
	import com.wecoit.data.ValueObject;
	
	/**
	 * 桌子
	 * @author SiaoLeon
	 */
	public class TableInfo extends ValueObject
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
		public function get id():uint
		{
			return this.getProperty("id", 0);
		}
		
		public function set id(value:uint):void
		{
			this.setProperty("id", value);
		}
		
		/**
		 * 名称
		 * @return
		 */
		public function get name():String
		{
			return this.getProperty("name", "");
		}
		
		public function set name(value:String):void
		{
			this.setProperty("name", value);
		}
		
		/**
		 * 玩家人数
		 * @return
		 */
		public function get playerCount():uint
		{
			return this.getProperty("playerCount", 0);
		}
		
		public function set playerCount(value:uint):void
		{
			this.setProperty("playerCount", value);
		}
		
		/**
		 * 最大玩家人数
		 * @return
		 */
		public function get maxPlayerCount():uint
		{
			return this.getProperty("maxPlayerCount", 0);
		}
		
		public function set maxPlayerCount(value:uint):void
		{
			this.setProperty("maxPlayerCount", value);
		}
		
		/**
		 * 带入值
		 * @return
		 */
		public function get buyinCoins():uint
		{
			return this.getProperty("buyinCoins", 0);
		}
		
		public function set buyinCoins(value:uint):void
		{
			this.setProperty("buyinCoins", value);
		}
		
		/**
		 * 带入筹码量
		 * @return
		 */
		public function get buyinChips():uint
		{
			return this.getProperty("buyinChips", 0);
		}
		
		public function set buyinChips(value:uint):void
		{
			this.setProperty("buyinChips", value);
		}
		
		/**
		 * 货币筹码兑换比例
		 * @return
		 */
		public function get rate():uint
		{
			return this.getProperty("rate", 0);
		}
		
		public function set rate(value:uint):void
		{
			this.setProperty("rate", value);
		}
		
		/**
		 * 最低带入值（小于该值不带入将被踢出）
		 * @return
		 */
		public function get buyoutChips():uint
		{
			return this.getProperty("buyoutChips", 0);
		}
		
		public function set buyoutChips(value:uint):void
		{
			this.setProperty("buyoutChips", value);
		}
		
		/**
		 * 排序
		 * @return
		 */
		public function get order():int
		{
			return this.getProperty("order", 0);
		}
		
		public function set order(value:int):void
		{
			this.setProperty("order", value);
		}
		
		/**
		 * 用户列表
		 * @return
		 */
		public function get userList():ArrayList
		{
			return this.getProperty("userList", new ArrayList());
		}
		
		public function set userList(value:ArrayList):void
		{
			this.setProperty("userList", value);
		}
		
		/**
		 * 当前座位号
		 * @return
		 */
		public function get currentSeat():uint
		{
			return this.getProperty("currentSeat", 0);
		}
		
		public function set currentSeat(value:uint):void
		{
			this.setProperty("currentSeat", value);
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TableInfo(id:uint=0)
		{
			super();
			
			this.setProperty("id", id);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function toString():String
		{
			return "[Table(id:" + this.id + ",name:" + this.name + ",players:" + this.playerCount + "/" + this.maxPlayerCount + ",rate:" + this.rate + ")]";
		}
		
		/**
		 * 根据ID获取用户
		 * @param id
		 * @return
		 */
		public function getUserByID(id:uint):UserInfo
		{
			for (var i:int = 0; i < this.userList.length; i++)
			{
				var user:UserInfo = this.userList.element(i);
				
				if (user.id == id)
				{
					return user;
				}
			}
			
			return null;
		}
		
		/**
		 * 根据座位号获取用户
		 * @param seat
		 * @return
		 */
		public function getUserBySeat(seat:uint):UserInfo
		{
			for (var i:int = 0; i < this.userList.length; i++)
			{
				var user:UserInfo = this.userList.element(i);
				
				if (user.seat == seat)
				{
					return user;
				}
			}
			
			return null;
		}
		
		/**
		 * 获取指定座位的位置
		 * @param seat 座位号
		 * @return
		 */
		public function getSeatPosition(seat:uint):uint
		{
			return (seat + 4 - this.currentSeat) % 4 + 1;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
