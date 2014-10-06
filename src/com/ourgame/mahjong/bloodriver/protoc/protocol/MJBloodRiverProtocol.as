package com.ourgame.mahjong.bloodriver.protoc.protocol
{
	
	/**
	 * 麻将血流成河消息协议
	 * @author SiaoLeon
	 */
	public class MJBloodRiverProtocol
	{
		/**
		 * 用户基础值
		 */
		private static const OGID_BASE_MESSAGE:int = 1200;
		
		/**
		 * 客户端
		 */
		public static const CLIENT:int = 0;
		
		/**
		 * 服务器
		 */
		public static const SERVER:int = 1;
		
		/**
		 * 心跳
		 */
		public static const OGID_HEARTBEAT:int = 1;
		
		// --------------------------------------------------------------------------------------------------------
		
		/**
		 * 进入游戏
		 */
		public static const OGID_GAME_ENTER:int = OGID_BASE_MESSAGE + 1;
		
		/**
		 * 游戏开始
		 */
		public static const OGID_GAME_START:int = OGID_BASE_MESSAGE + 3;
		
		/**
		 * 重新开始游戏
		 */
		public static const OGID_GAME_RESUME:int = OGID_BASE_MESSAGE + 5;
		
		/**
		 * 掷骰子
		 */
		public static const OGID_DICE:int = OGID_BASE_MESSAGE + 7;
		
		/**
		 * 开门发牌
		 */
		public static const OGID_DEAL:int = OGID_BASE_MESSAGE + 9;
		
		/**
		 * 换三张牌
		 */
		public static const OGID_SWAP:int = OGID_BASE_MESSAGE + 11;
		
		/**
		 * 有人打牌
		 */
		public static const OGID_DISCARD:int = OGID_BASE_MESSAGE + 13;
		
		/**
		 * 抓牌
		 */
		public static const OGID_DRAW:int = OGID_BASE_MESSAGE + 15;
		
		/**
		 * 动作请求
		 */
		public static const OGID_ACTION:int = OGID_BASE_MESSAGE + 17;
		
		/**
		 * 有玩家胡牌
		 */
		public static const OGID_PLAYER_WIN:int = OGID_BASE_MESSAGE + 13;
		
		/**
		 * 断线重连
		 */
		public static const OGID_GAME_STATUS:int = OGID_BASE_MESSAGE + 13;
		
		/**
		 * 托管
		 */
		public static const OGID_GAME_HOSTING:int = OGID_BASE_MESSAGE + 13;
		
		/**
		 * 游戏结果
		 */
		public static const OGID_GAME_RESULT:int = OGID_BASE_MESSAGE + 13;
	
	}
}
