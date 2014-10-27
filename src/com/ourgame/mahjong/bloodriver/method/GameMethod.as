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
		 * params Game 游戏对象
		 */
		public static const GAME_START:String = BASE + "GAME_START";
		
		/**
		 * 发牌骰子
		 * params Array 骰子数组
		 */
		public static const DEAL_DICE:String = BASE + "DEAL_DICE";
		
		/**
		 * 发牌
		 * params uint 等待时间
		 * params Array[Vector.<Card> 按座位号牌列表的二维数组
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
		 * 换出牌
		 * params Vector.<Card> 换出的三张牌列表
		 */
		public static const SWAP_CARDS_OUT:String = BASE + "SWAP_CARDS_OUT";
		
		/**
		 * 换入牌
		 * params Vector.<Card> 换入的三张牌列表
		 */
		public static const SWAP_CARDS_IN:String = BASE + "SWAP_CARDS_IN";
		
		/**
		 * 抓牌
		 * params Action 动作
		 */
		public static const DRAW:String = BASE + "DRAW";
		
		/**
		 * 打牌
		 * params Action 动作
		 */
		public static const DISCARD:String = BASE + "DISCARD";
		
		/**
		 * 花猪
		 * params Boolean 是否为花猪
		 */
		public static const FLOWER_PIG:String = BASE + "FLOWER_PIG";
		
		/**
		 * 请求动作
		 * params Action 动作
		 */
		public static const REQUEST:String = BASE + "REQUEST";
		
		/**
		 * 动作
		 * params Action 动作
		 */
		public static const ACTION:String = BASE + "ACTION";
		
		/**
		 * 胡牌
		 * params Action 动作
		 */
		public static const WIN:String = BASE + "WIN";
		
		/**
		 * 结算
		 * params Vector.<ResultInfo> 按座位号结算列表
		 * params Vector.<ResultRecord> 结算记录列表
		 */
		public static const RESULT:String = BASE + "RESULT";
	
	}
}
