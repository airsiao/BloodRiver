package com.ourgame.mahjong.bloodriver.table.vo
{
	import com.ourgame.mahjong.bloodriver.table.enum.CardColor;
	
	/**
	 * 麻将牌
	 * @author SiaoLeon
	 */
	public class Card
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		private static const POINTS:Array = ["一", "二", "三", "四", "五", "六", "七", "八", "九"];
		
		private static const WINDS:Array = ["东", "南", "西", "北"];
		
		private static const JIANS:Array = ["红中", "发财", "白板"];
		
		private static const SEASONS:Array = ["春季", "夏季", "秋季", "冬季"];
		
		private static const FLOWERS:Array = ["梅花", "兰花", "翠竹", "菊花"];
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _id:uint;
		
		/**
		 * ID，唯一ID
		 */
		public function get id():uint
		{
			return this._id;
		}
		
		public function set id(value:uint):void
		{
			this._id = value;
		}
		
		/**
		 * 相同花色点数牌的索引
		 */
		public function get index():uint
		{
			return this.id & 3;
		}
		
		public function set index(value:uint):void
		{
			this._id |= value;
		}
		
		/**
		 * CardColor，花色
		 */
		public function get color():uint
		{
			return (this.id >> 6) & 0x0F;
		}
		
		public function set color(value:uint):void
		{
			this._id |= (value << 6);
		}
		
		/**
		 * 点数
		 */
		public function get point():uint
		{
			return (this.id >> 2) & 0xF;
		}
		
		public function set point(value:uint):void
		{
			this._id |= (value << 2);
		}
		
		/**
		 * 是否为混
		 */
		public function get isMagic():Boolean
		{
			return ((this.id >> 10) & 1) == 1;
		}
		
		public function set isMagic(value:Boolean):void
		{
			this._id |= value ? (1 << 10) : 0;
		}
		
		/**
		 * 是否是 万、饼、条
		 */
		public function isWanBingTiao():Boolean
		{
			return this.color < CardColor.WIND;
		}
		
		/**
		 * 是否是 风、箭
		 */
		public function isFengJian():Boolean
		{
			return (id & 4) == 4;
		}
		
		/**
		 * 是否是 花、季
		 */
		public function isFlowerSeason():Boolean
		{
			return (id & 8) == 8;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function Card(id:uint=0)
		{
			this._id = id;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function toString():String
		{
			switch (this.color)
			{
				case CardColor.WAN:
					return POINTS[this.point - 1] + "万" + this.id;
					break;
				
				case CardColor.TIAO:
					return POINTS[this.point - 1] + "条" + this.id;
					break;
				
				case CardColor.BING:
					return POINTS[this.point - 1] + "饼" + this.id;
					break;
				
				case CardColor.WIND:
					return WINDS[this.point - 1] + "风";
					break;
				
				case CardColor.JIAN:
					return JIANS[this.point - 1];
					break;
				
				case CardColor.SEASON:
					return SEASONS[this.point - 1];
					break;
				
				case CardColor.FLOWER:
					return FLOWERS[this.point - 1];
					break;
				
			}
			
			return "未知" + this.id;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
