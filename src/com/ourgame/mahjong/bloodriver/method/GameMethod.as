package com.ourgame.mahjong.bloodriver.method
{
	import flash.utils.getQualifiedClassName;
	
	/**
	 * 游戏消息标头
	 * @author SiaoLeon
	 */
	public class GameMethod
	{
		/**
		 * 消息基础值
		 */
		private static const BASE:String = getQualifiedClassName(GameMethod) + "::";
		
		/**
		 * 游戏开始
		 */
		public static const GAME_START:String = BASE + "GAME_START";
		
		/**
		 * 游戏结束
		 */
		public static const GAME_END:String = BASE + "GAME_END";
		
		/**
		 * 洗牌
		 */
		public static const SHUFFLE:String = BASE + "SHUFFLE";
		
		/**
		 * 发牌骰子
		 */
		public static const DEAL_DICE:String = BASE + "DEAL_DICE";
		
		/**
		 * 发牌
		 */
		public static const DEAL_CARDS:String = BASE + "DEAL_CARDS";
		
		/**
		 * 换牌骰子
		 */
		public static const CHANGE_DICE:String = BASE + "CHANGE_DICE";
		
		/**
		 * 换牌
		 */
		public static const CHANGE_CARDS:String = BASE + "CHANGE_CARDS";
		
		/**
		 * 行牌
		 */
		public static const PLAY:String = BASE + "PLAY";
		
		/**
		 * 结算
		 */
		public static const RESULT:String = BASE + "RESULT";
	
	}
}
