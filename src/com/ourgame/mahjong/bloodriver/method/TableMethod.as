package com.ourgame.mahjong.bloodriver.method
{
	import flash.utils.getQualifiedClassName;
	
	/**
	 * 桌子消息标头
	 * @author SiaoLeon
	 */
	public class TableMethod
	{
		/**
		 * 消息基础值
		 */
		private static const BASE:String = getQualifiedClassName(TableMethod) + "::";
		
		/**
		 * 连接
		 */
		public static const CONNECT:String = BASE + "CONNECT";
		
		/**
		 * 准备
		 */
		public static const READY:String = BASE + "READY";
		
		/**
		 * 邀请进入游戏
		 * params uint 游戏ID
		 */
		public static const GAME_INVITE:String = BASE + "GAME_INVITE";
		
		/**
		 * 返回
		 */
		public static const BACK:String = BASE + "BACK";
	
	}
}
