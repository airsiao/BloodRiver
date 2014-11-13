package com.ourgame.mahjong.bloodriver.table.method
{
	import flash.utils.getQualifiedClassName;
	
	/**
	 * 操作消息标头
	 * @author SiaoLeon
	 */
	public class OperateMethod
	{
		/**
		 * 消息基础值
		 */
		private static const BASE:String = getQualifiedClassName(OperateMethod) + "::";
		
		/**
		 * 换牌
		 * params Vector.<Card> 换出的三张牌列表
		 */
		public static const SWAP:String = BASE + "SWAP";
		
		/**
		 * 打牌
		 * params Card 换出的牌
		 */
		public static const DISCARD:String = BASE + "DISCARD";
		
		/**
		 * 动作
		 * params Action 动作
		 */
		public static const ACTION:String = BASE + "ACTION";
		
		/**
		 * 显示听牌
		 * params TingInfo 听牌信息
		 */
		public static const SHOWTING:String = BASE + "SHOWTING";
	
	}
}
