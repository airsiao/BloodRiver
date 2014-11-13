package com.ourgame.mahjong.bloodriver.common.vo
{
	import com.wecoit.data.ValueObject;
	
	/**
	 * 用户对象
	 * @author SiaoLeon
	 */
	public class UserInfo extends ValueObject
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
		 * 座位号
		 * @return
		 */
		public function get seat():int
		{
			return this.getProperty("seat", -1);
		}
		
		public function set seat(value:int):void
		{
			this.setProperty("seat", value);
		}
		
		/**
		 * 昵称
		 * @return
		 */
		public function get nickname():String
		{
			return this.getProperty("nickname", "");
		}
		
		public function set nickname(value:String):void
		{
			this.setProperty("nickname", value);
		}
		
		/**
		 * 筹码量
		 * @return
		 */
		public function get chips():int
		{
			return this.getProperty("chips", 0);
		}
		
		public function set chips(value:int):void
		{
			this.setProperty("chips", value);
		}
		
		/**
		 * 货币量
		 * @return
		 */
		public function get coins():uint
		{
			return this.getProperty("coins", 0);
		}
		
		public function set coins(value:uint):void
		{
			this.setProperty("coins", value);
		}
		
		/**
		 * 大师分
		 * @return
		 */
		public function get masterScore():uint
		{
			return this.getProperty("masterScore", 0);
		}
		
		public function set masterScore(value:uint):void
		{
			this.setProperty("masterScore", value);
		}
		
		/**
		 * 性别
		 * @return
		 */
		public function get sex():uint
		{
			return this.getProperty("sex", 0);
		}
		
		public function set sex(value:uint):void
		{
			this.setProperty("sex", value);
		}
		
		/**
		 * 头像
		 * @return
		 */
		public function get headImage():String
		{
			return this.getProperty("headImage", "");
		}
		
		public function set headImage(value:String):void
		{
			this.setProperty("headImage", value);
		}
		
		/**
		 * 形象
		 * @return
		 */
		public function get avatar():String
		{
			return this.getProperty("avatar", "");
		}
		
		public function set avatar(value:String):void
		{
			this.setProperty("avatar", value);
		}
		
		/**
		 * 等级
		 * @return
		 */
		public function get level():uint
		{
			return this.getProperty("level", 0);
		}
		
		public function set level(value:uint):void
		{
			this.setProperty("level", value);
		}
		
		/**
		 * 经验
		 * @return
		 */
		public function get experience():uint
		{
			return this.getProperty("experience", 0);
		}
		
		public function set experience(value:uint):void
		{
			this.setProperty("experience", value);
		}
		
		/**
		 * 胜率
		 * @return
		 */
		public function get winRate():Number
		{
			return this.getProperty("winRate", 0);
		}
		
		public function set winRate(value:Number):void
		{
			this.setProperty("winRate", value);
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function UserInfo(id:uint=0)
		{
			super();
			
			this.setProperty("id", id);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function toString():String
		{
			return "[User(id=" + this.id + ",name=" + this.nickname + ",seat=" + this.seat + ",coins=" + this.coins + ",chips=" + this.chips + ",masterScore=" + this.masterScore + ")]";
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
