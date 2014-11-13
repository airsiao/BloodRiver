package com.ourgame.mahjong.bloodriver.table.method
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
		 * 返回
		 */
		public static const RETURN:String = BASE + "RETURN";
		
		/**
		 * 准备
		 */
		public static const STAND_BY:String = BASE + "STAND_BY";
		
		/**
		 * 进入游戏
		 */
		public static const GAME_ENTER:String = BASE + "GAME_ENTER";
	
	}
}
