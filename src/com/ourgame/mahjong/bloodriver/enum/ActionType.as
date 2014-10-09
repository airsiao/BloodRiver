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
		 * 吃
		 */
		public static const CHI:uint = 1;
		
		/**
		 * 碰
		 */
		public static const PENG:uint = 2;
		
		/**
		 * 明杠
		 */
		public static const GANG:uint = 4;
		
		/**
		 * 补杠
		 */
		public static const GANG_BU:uint = 8;
		
		/**
		 * 暗杠
		 */
		public static const GANG_AN:uint = 16;
		
		/**
		 * 胡
		 */
		public static const WIN:uint = 32;
		
		/**
		 * 听
		 */
		public static const TING:uint = 64;
		
		/**
		 * 明牌
		 */
		public static const SHOW:uint = 128;
		
		/**
		 * 补花
		 */
		public static const BUHUA:uint = 256;
	
	}
}
