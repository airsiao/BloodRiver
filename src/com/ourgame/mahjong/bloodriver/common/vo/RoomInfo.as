package com.ourgame.mahjong.bloodriver.common.vo
{
	import com.ourgame.mahjong.bloodriver.common.enum.GameType;
	import com.ourgame.mahjong.bloodriver.common.enum.RoomType;
	import com.wecoit.data.ArrayList;
	import com.wecoit.data.ValueObject;
	
	/**
	 * 房间
	 * @author SiaoLeon
	 */
	public class RoomInfo extends ValueObject
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		/**
		 * ID
		 * @return
		 */
		public function get id():uint
		{
			return this.getProperty("id", 0);
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
		 * RoomType，房间类型
		 * @return
		 */
		public function get type():uint
		{
			return this.getProperty("type", RoomType.AUTO);
		}
		
		public function set type(value:uint):void
		{
			this.setProperty("type", value);
		}
		
		/**
		 * GameType，游戏类型
		 * @return
		 */
		public function get gameType():uint
		{
			return this.getProperty("gameType", GameType.BloodRiver);
		}
		
		public function set gameType(value:uint):void
		{
			this.setProperty("gameType", value);
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
		 * 带入值
		 * @return
		 */
		public function get buyin():uint
		{
			return this.getProperty("buyin", 0);
		}
		
		public function set buyin(value:uint):void
		{
			this.setProperty("buyin", value);
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
		 * 桌子列表
		 * @return
		 */
		public function get tableList():ArrayList
		{
			return this.getProperty("tableList", new ArrayList());
		}
		
		public function set tableList(value:ArrayList):void
		{
			this.setProperty("tableList", value);
		}
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function RoomInfo(id:uint)
		{
			super();
			
			this.setProperty("id", id);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function toString():String
		{
			return "[Room(id:" + this.id + ",type:" + this.type + ",name:" + this.name + ",players:" + this.playerCount + ")]";
		}
		
		/**
		 * 根据ID获取桌子
		 * @param id
		 * @return
		 */
		public function getTableByID(id:uint):TableInfo
		{
			for (var i:int = 0; i < this.tableList.length; i++)
			{
				var table:TableInfo = this.tableList.element(i);
				
				if (table.id == id)
				{
					return table;
				}
			}
			
			return null;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
