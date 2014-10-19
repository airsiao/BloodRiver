package com.ourgame.mahjong.bloodriver.enum
{
	
	/**
	 * 动作
	 * @author SiaoLeon
	 */
	public class ActionType
	{
		/**
		 * 弃
		 */
		public static const GIVEUP:uint = 0;
		
		/**
		 * 打牌
		 */
		public static const DISCARD:uint = 1;
		
		/**
		 * 吃
		 */
		public static const CHI:uint = 2;
		
		/**
		 * 碰
		 */
		public static const PENG:uint = 4;
		
		/**
		 * 明杠
		 */
		public static const GANG:uint = 8;
		
		/**
		 * 补杠
		 */
		public static const GANG_BU:uint = 16;
		
		/**
		 * 暗杠
		 */
		public static const GANG_AN:uint = 32;
		
		/**
		 * 胡
		 */
		public static const WIN:uint = 64;
		
		/**
		 * 听
		 */
		public static const TING:uint = 128;
		
		/**
		 * 明牌
		 */
		public static const SHOW:uint = 256;
	
	}
}
