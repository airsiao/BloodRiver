package com.ourgame.mahjong.bloodriver.table.model
{
	import com.netease.protobuf.Message;
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.events.SocketEvent;
	import com.ourgame.mahjong.bloodriver.common.method.SocketMethod;
	import com.ourgame.mahjong.bloodriver.common.vo.socket.MJDataPack;
	import com.wecoit.mvc.Model;
	
	import flash.utils.ByteArray;
	
	/**
	 * 桌子Socket数据模型
	 * @author SiaoLeon
	 */
	public class TableSocketModel extends Model
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TableSocketModel()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			CommonData.socketProxy.addEventListener(SocketEvent.CONNECTED, onConnected);
			CommonData.socketProxy.addEventListener(SocketEvent.ERROR, onError);
			CommonData.socketProxy.addEventListener(SocketEvent.CLOSED, onClosed);
			CommonData.socketProxy.addEventListener(SocketEvent.DISCONNECT, onDisconnect);
			CommonData.socketProxy.addEventListener(SocketEvent.FLUSH, onFlush);
			CommonData.socketProxy.addEventListener(SocketEvent.RECIVE, onRecive);
		}
		
		override public function onRemove():void
		{
			CommonData.socketProxy.removeEventListener(SocketEvent.CONNECTED, onConnected);
			CommonData.socketProxy.removeEventListener(SocketEvent.ERROR, onError);
			CommonData.socketProxy.removeEventListener(SocketEvent.CLOSED, onClosed);
			CommonData.socketProxy.removeEventListener(SocketEvent.DISCONNECT, onDisconnect);
			CommonData.socketProxy.removeEventListener(SocketEvent.FLUSH, onFlush);
			CommonData.socketProxy.removeEventListener(SocketEvent.RECIVE, onRecive);
		}
		
		public function onConnected(event:SocketEvent):void
		{
			this.notify(SocketMethod.CONNECT_SUCCESS(TableSocketModel));
		}
		
		public function onError(event:SocketEvent):void
		{
			this.notify(SocketMethod.CONNECT_ERROR(TableSocketModel));
		}
		
		public function onClosed(event:SocketEvent):void
		{
			this.notify(SocketMethod.CLOSED(TableSocketModel));
		}
		
		public function onDisconnect(event:SocketEvent):void
		{
			this.notify(SocketMethod.DISCONECT(TableSocketModel));
		}
		
		public function onFlush(event:SocketEvent):void
		{
			this.notify(SocketMethod.FLUSH(TableSocketModel), event.data);
		}
		
		public function onRecive(event:SocketEvent):void
		{
			this.notify(SocketMethod.RECIVED(TableSocketModel), event.data);
		}
		
		/**
		 * 建立Socket连接
		 */
		public function connect(host:String, port:uint):void
		{
			CommonData.socketProxy.connect(host, port);
		}
		
		/**
		 * 发送Socket数据
		 * @param type
		 * @param msg
		 */
		public function send(type:int, msg:Message=null):void
		{
			var body:ByteArray = new ByteArray();
			
			if (msg != null)
			{
				msg.writeTo(body);
			}
			
			CommonData.socketProxy.send(new MJDataPack(type, body));
		}
		
		/**
		 * 模拟Socket数据
		 * @param type
		 * @param msg
		 */
		public function push(type:int, msg:Message=null):void
		{
			var body:ByteArray = new ByteArray();
			
			if (msg != null)
			{
				msg.writeTo(body);
			}
			
			CommonData.socketProxy.push(new MJDataPack(type, body));
		}
		
		/**
		 * 关闭Socket连接
		 */
		public function close():void
		{
			CommonData.socketProxy.close();
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
