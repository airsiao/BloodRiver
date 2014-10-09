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
		 * 进入游戏
		 */
		public static const GAME_ENTER:String = BASE + "GAME_ENTER";
		
		/**
		 * 开始游戏
		 */
		public static const GAME_START:String = BASE + "GAME_START";
		
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
		public static const SWAP_DICE:String = BASE + "SWAP_DICE";
		
		/**
		 * 选择换牌
		 */
		public static const SELECT_SWAP:String = BASE + "SELECT_SWAP";
		
		/**
		 * 确认换牌
		 * params Vector.<Card> 换出的三张牌列表
		 */
		public static const CONFIRM_SWAP:String = BASE + "CONFIRM_SWAP";
		
		/**
		 * 换牌
		 * params Vector.<Card> 换入的三张牌列表
		 */
		public static const SWAP_CARDS:String = BASE + "SWAP_CARDS";
		
		/**
		 * 抓牌
		 * params DrawAction 抓牌动作
		 */
		public static const DRAW:String = BASE + "DRAW";
		
		/**
		 * 打牌
		 */
		public static const DISCARD:String = BASE + "DISCARD";
		
		/**
		 * 结算
		 */
		public static const RESULT:String = BASE + "RESULT";
	
	}
}
