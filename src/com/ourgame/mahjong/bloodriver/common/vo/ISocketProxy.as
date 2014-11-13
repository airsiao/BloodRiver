package com.ourgame.mahjong.bloodriver.common.vo
{
	import com.wecoit.net.socket.IBytesData;
	
	import flash.events.IEventDispatcher;
	
	/**
	 * Socket代理器
	 * @author SiaoLeon
	 */
	public interface ISocketProxy extends IEventDispatcher
	{
		
		function connect(host:String, port:uint):void;
		
		function send(data:IBytesData):void;
		
		function push(data:IBytesData):void;
		
		function close():void;
	
	}
}
