package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.state.TableState;
	import com.ourgame.mahjong.libaray.SocketProcessor;
	import com.ourgame.mahjong.libaray.events.SocketEvent;
	import com.ourgame.mahjong.libaray.vo.socket.MJDataPack;
	import com.ourgame.mahjong.protocol.MJLobbyProtocol;
	import com.ourgame.mahjong.protocol.MJRoomProtocol;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.State;
	
	/**
	 * 连接控制器
	 * @author SiaoLeon
	 */
	public class ConnectController extends Controller
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var socket:SocketProcessor;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function ConnectController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.CONNECT();
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function CONNECT():void
		{
			this.socket = new SocketProcessor();
			this.socket.addEventListener(SocketEvent.CONNECTED, onConnected);
			this.socket.addEventListener(SocketEvent.RECIVE, onRecive);
			
			var host:String = AssetsManager.instance.getConfig("debug").getString("ServerHost");
			var port:uint = AssetsManager.instance.getConfig("debug").getNumber("ServerPort");
			
			this.socket.connect(host, port);
			
			((this.context as State).manager as BloodRiver).info.data.socket = this.socket;
		}
		
		private function onConnected(event:SocketEvent):void
		{
			this.login();
		}
		
		private function onRecive(event:SocketEvent):void
		{
			var data:MJDataPack = event.data as MJDataPack;
			
			switch (data.type)
			{
				case MJLobbyProtocol.SERVER + MJLobbyProtocol.OGID_USER_LOGIN:
					this.roomList();
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_ROOM_LIST:
					this.enterRoom();
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_ROOM_ENTER:
					this.tableList();
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_TABLE_LIST:
					this.enterTable();
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_TABLE_ENTER:
					(this.context as State).manager.switchState(TableState);
					break;
			}
		}
		
		private function login():void
		{
		
		}
		
		private function roomList():void
		{
		
		}
		
		private function enterRoom():void
		{
			var id:String = AssetsManager.instance.getConfig("debug").getString("RoomID");
		}
		
		private function tableList():void
		{
		
		}
		
		private function enterTable():void
		{
			var id:String = AssetsManager.instance.getConfig("debug").getString("TableID");
		}
	
	}
}
