package com.ourgame.mahjong.bloodriver.common.events
{
	import com.wecoit.net.socket.IBytesData;
	
	import flash.events.Event;
	
	/**
	 * Socket事件
	 * @author SiaoLeon
	 */
	public class SocketEvent extends Event
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		public static const CONNECTED:String = "connected";
		
		public static const ERROR:String = "error";
		
		public static const CLOSED:String = "closed";
		
		public static const DISCONNECT:String = "disconnect";
		
		public static const FLUSH:String = "flush";
		
		public static const RECIVE:String = "recive";
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _data:IBytesData;
		
		public function get data():IBytesData
		{
			return this._data;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function SocketEvent(type:String, data:IBytesData=null)
		{
			super(type, false, false);
			
			this._data = data;
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
