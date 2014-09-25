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
		 * 准备
		 */
		public static const READY:String = BASE + "READY";
	
	}
}
