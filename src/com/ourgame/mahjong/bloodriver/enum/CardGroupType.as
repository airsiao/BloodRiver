package com.ourgame.mahjong.bloodriver.enum
{
	
	/**
	 * 麻将牌组类型
	 * @author SiaoLeon
	 */
	public class CardGroupType
	{
		/**
		 * 未知
		 */
		public static const UNKNOW:uint = 0;
		
		/**
		 * 对子 (11,22,33)
		 */
		public static const DUI:uint = 1;
		
		/**
		 * 顺 (123,456,789)
		 */
		public static const SHUN:uint = 2;
		
		/**
		 * 刻 (111,222,333)
		 */
		public static const KE:uint = 3;
		
		/**
		 * 明杠 (1111,2222,3333)
		 */
		public static const GANG_MING:uint = 4;
		
		/**
		 * 补杠 (111+1)
		 */
		public static const GANG_BU:uint = 5;
		
		/**
		 * 暗杠 (????)
		 */
		public static const GANG_AN:uint = 6;
		
		/**
		 * 成牌
		 */
		public static const HAND:uint = 7;
	
	}
}
