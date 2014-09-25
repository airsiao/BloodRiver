package com.ourgame.mahjong.bloodriver.vo
{
	import com.ourgame.mahjong.bloodriver.enum.CardColor;
	import com.ourgame.mahjong.bloodriver.enum.CardGroupType;
	
	/**
	 * 麻将牌组列表
	 * @author SiaoLeon
	 */
	public class GroupList
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		/**
		 * 是否为碰，仅包含杠和刻
		 * @return
		 */
		public function get isPeng():Boolean
		{
			return this.list.length == this.getGroupsByType(CardGroupType.GANG_AN).length + this.getGroupsByType(CardGroupType.GANG_BU).length + this.getGroupsByType(CardGroupType.GANG_MING).length + this.getGroupsByType(CardGroupType.KE).length;
		}
		
		/**
		 * 类型
		 * @return
		 */
		public function get type():uint
		{
			var type:uint = CardGroupType.UNKNOW;
			
			for each (var group:CardGroup in this.list)
			{
				if (type == CardGroupType.UNKNOW)
				{
					type = group.type;
				}
				
				if (type != group.type)
				{
					return CardColor.UNKNOW;
				}
			}
			
			return type;
		}
		
		/**
		 * 花色，不同花色为未知
		 * @return
		 */
		public function get color():uint
		{
			var color:uint = CardColor.UNKNOW;
			
			for each (var group:CardGroup in this.list)
			{
				if (color == CardColor.UNKNOW)
				{
					color = group.color;
				}
				
				if (color != group.color)
				{
					return CardColor.UNKNOW;
				}
			}
			
			return color;
		}
		
		public var list:Vector.<CardGroup>;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function GroupList(groups:Vector.<CardGroup>=null)
		{
			this.list = (groups == null) ? new Vector.<CardGroup>() : groups;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function toString():String
		{
			return this.list.toString();
		}
		
		/**
		 * 添加一组牌
		 * @param group
		 */
		public function add(group:CardGroup):void
		{
			this.list.push(group);
		}
		
		/**
		 * 移除一组牌
		 * @param group
		 */
		public function remove(group:CardGroup):void
		{
			if (this.list.indexOf(group) < 0)
			{
				return;
			}
			
			this.list.splice(this.list.indexOf(group), 1);
		}
		
		/**
		 * 获取一种类型的牌组列表
		 * @param type
		 * @return
		 */
		public function getGroupsByType(type:uint):Vector.<CardGroup>
		{
			var result:Vector.<CardGroup> = new Vector.<CardGroup>();
			
			for each (var group:CardGroup in this.list)
			{
				if (group.type == type)
				{
					result.push(group);
				}
			}
			
			return result;
		}
		
		/**
		 * 获取一种花色的牌组列表
		 * @param color
		 * @return
		 */
		public function getGroupsByColor(color:uint):Vector.<CardGroup>
		{
			var result:Vector.<CardGroup> = new Vector.<CardGroup>();
			
			for each (var group:CardGroup in this.list)
			{
				if (group.color == color)
				{
					result.push(group);
				}
			}
			
			return result;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
