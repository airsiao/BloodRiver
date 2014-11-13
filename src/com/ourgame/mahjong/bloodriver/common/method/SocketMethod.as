package com.ourgame.mahjong.bloodriver.common.method
{
	import flash.utils.getQualifiedClassName;
	
	/**
	 * Socket消息标头
	 * @author SiaoLeon
	 */
	public class SocketMethod
	{
		/**
		 * 连接
		 */
		public static function CONNECT(socket:Class):String
		{
			return getQualifiedClassName(socket) + "::" + "CONNECT";
		}
		
		/**
		 * 连接错误
		 */
		public static function CONNECT_ERROR(socket:Class):String
		{
			return getQualifiedClassName(socket) + "::" + "CONNECT_ERROR";
		}
		
		/**
		 * 连接成功
		 */
		public static function CONNECT_SUCCESS(socket:Class):String
		{
			return getQualifiedClassName(socket) + "::" + "CONNECT_SUCCESS";
		}
		
		/**
		 * 关闭
		 */
		public static function CLOSE(socket:Class):String
		{
			return getQualifiedClassName(socket) + "::" + "CLOSE";
		}
		
		/**
		 * 关闭后
		 */
		public static function CLOSED(socket:Class):String
		{
			return getQualifiedClassName(socket) + "::" + "CLOSED";
		}
		
		/**
		 * 被断开
		 */
		public static function DISCONECT(socket:Class):String
		{
			return getQualifiedClassName(socket) + "::" + "DISCONECT";
		}
		
		/**
		 * 发送数据
		 * params IBytesData Socket字节数据
		 */
		public static function SEND(socket:Class):String
		{
			return getQualifiedClassName(socket) + "::" + "SEND";
		}
		
		/**
		 * 发出数据
		 * params IBytesData Socket字节数据
		 */
		public static function FLUSH(socket:Class):String
		{
			return getQualifiedClassName(socket) + "::" + "FLUSH";
		}
		
		/**
		 * 模拟数据
		 * params IBytesData Socket字节数据
		 */
		public static function PUSH(socket:Class):String
		{
			return getQualifiedClassName(socket) + "::" + "PUSH";
		}
		
		/**
		 * 接收数据
		 * params IBytesData Socket字节数据
		 */
		public static function RECIVED(socket:Class):String
		{
			return getQualifiedClassName(socket) + "::" + "RECIVED";
		}
	
	}
}
