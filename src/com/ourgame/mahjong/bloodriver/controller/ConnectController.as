package com.ourgame.mahjong.bloodriver.controller
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.state.TableState;
	import com.ourgame.mahjong.libaray.DataExchange;
	import com.ourgame.mahjong.libaray.SocketProcessor;
	import com.ourgame.mahjong.libaray.enum.PlayMode;
	import com.ourgame.mahjong.libaray.enum.RoomType;
	import com.ourgame.mahjong.libaray.events.SocketEvent;
	import com.ourgame.mahjong.libaray.vo.RoomInfo;
	import com.ourgame.mahjong.libaray.vo.TableInfo;
	import com.ourgame.mahjong.libaray.vo.UserInfo;
	import com.ourgame.mahjong.libaray.vo.socket.MJDataPack;
	import com.ourgame.mahjong.message.CReqEnterRoom;
	import com.ourgame.mahjong.message.CReqEnterTable;
	import com.ourgame.mahjong.message.CReqLogin;
	import com.ourgame.mahjong.message.CReqRoomList;
	import com.ourgame.mahjong.message.CReqStandBy;
	import com.ourgame.mahjong.message.NtfInviteGame;
	import com.ourgame.mahjong.message.NtfInviteTable;
	import com.ourgame.mahjong.message.Room;
	import com.ourgame.mahjong.message.SAckEnterRoom;
	import com.ourgame.mahjong.message.SAckEnterTable;
	import com.ourgame.mahjong.message.SAckLogin;
	import com.ourgame.mahjong.message.SAckRoomList;
	import com.ourgame.mahjong.message.SAckStandBy;
	import com.ourgame.mahjong.message.TablePlayer;
	import com.ourgame.mahjong.protocol.MJLobbyProtocol;
	import com.ourgame.mahjong.protocol.MJRoomProtocol;
	import com.ourgame.mahjong.protocol.MJTableProtocol;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.Application;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.State;
	import com.wecoit.utils.bytes.Base64;
	
	import flash.net.SharedObject;
	
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
		
		private var data:DataExchange;
		
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
			this.data = ((this.context as State).manager as BloodRiver).info.data;
			
			this.CONNECT();
		}
		
		override public function onRemove():void
		{
			this.socket = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function CONNECT():void
		{
			if (((this.context as State).manager as BloodRiver).info.data.table.mode == PlayMode.CONSOLE)
			{
				(this.context as State).manager.switchState(TableState);
				return;
			}
			
			this.socket = new SocketProcessor();
			this.socket.addEventListener(SocketEvent.CONNECTED, onConnected, false, 0, true);
			this.socket.addEventListener(SocketEvent.ERROR, onError, false, 0, true);
			this.socket.addEventListener(SocketEvent.RECIVE, onRecive, false, 0, true);
			
			var host:String = AssetsManager.instance.getConfig("debug").getString("ServerHost");
			var port:uint = AssetsManager.instance.getConfig("debug").getNumber("ServerPort");
			
			this.socket.connect(host, port);
			
			((this.context as State).manager as BloodRiver).info.data.socket = this.socket;
		}
		
		private function onConnected(event:SocketEvent):void
		{
			this.login();
		}
		
		private function onError(event:SocketEvent):void
		{
			(this.context as State).manager.switchState(TableState);
		}
		
		private function onRecive(event:SocketEvent):void
		{
			var data:MJDataPack = event.data as MJDataPack;
			
			switch (data.type)
			{
				case MJLobbyProtocol.SERVER + MJLobbyProtocol.OGID_USER_LOGIN:
					this.on_login(data);
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_ROOM_LIST:
					this.on_roomList(data);
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_ROOM_ENTER:
					this.on_enterRoom(data);
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_STAND_BY:
					this.on_standby(data);
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_TABLE_LIST:
					this.on_tableList(data);
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_TABLE_INVITE:
					this.on_tableInvite(data);
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_TABLE_ENTER:
					this.ON_enterTable(data);
					break;
				
				case MJTableProtocol.SERVER + MJTableProtocol.OGID_GAME_INVITE:
					this.on_gameInvite(data);
					break;
			}
		}
		
		private function login():void
		{
			var so:SharedObject = SharedObject.getLocal("OurgameMahjong");
			
			var body:CReqLogin = new CReqLogin();
			body.ourgameId = this.data.ourgameID;
			body.username = this.data.username;
			body.rolename = this.data.rolename;
			body.nickname = this.data.nickname;
			body.ticket = Base64.decode(this.data.ticket);
			body.sessionKey = so.data["session"];
			body.headImage = this.data.user.headImage;
			body.gender = this.data.user.sex;
			body.channelId = this.data.channelID;
			body.version = 1;
			body.force = true;
			body.antiAddict = (Application.stage.loaderInfo.parameters["CMStatus"] != 0);
			
			Log.debug("发送登录请求", body);
			
			this.socket.send(MJLobbyProtocol.CLIENT + MJLobbyProtocol.OGID_USER_LOGIN, body);
		}
		
		private function on_login(data:MJDataPack):void
		{
			var body:SAckLogin = new SAckLogin();
			body.mergeFrom(data.body);
			
			Log.debug("请求登录结果", body);
			
			if (body.result == 0)
			{
				var so:SharedObject = SharedObject.getLocal("OurgameMahjong");
				so.data["session"] = body.sessionKey;
				so.flush();
				
				this.data.user.nickname = this.data.nickname;
				this.data.user.id = body.userId.low;
				this.data.user.coins = body.money;
				this.data.user.experience = body.experience;
				this.data.user.level = body.level;
				this.data.user.masterScore = body.materScore;
				
				this.roomList();
			}
			else
			{
				Log.error("登录失败原因", body.failReason);
			}
		}
		
		private function roomList():void
		{
			var body:CReqRoomList = new CReqRoomList();
			
			Log.debug("发送获取房间列表请求", body);
			
			this.socket.send(MJRoomProtocol.CLIENT + MJRoomProtocol.OGID_ROOM_LIST, body);
		}
		
		private function on_roomList(data:MJDataPack):void
		{
			var body:SAckRoomList = new SAckRoomList();
			body.mergeFrom(data.body);
			
			Log.debug("请求房间列表结果", body);
			
			this.data.roomList.clear();
			
			for each (var room:Room in body.rooms)
			{
				var info:RoomInfo = new RoomInfo(room.roomId);
				info.name = room.roomName;
				info.type = room.roomType;
				info.gameType = room.gameType;
				info.playerCount = room.userAmount;
				info.buyin = room.enterBuyIn;
				info.rate = room.unitValue;
				this.data.roomList.add(info);
				
				if (this.data.room != null && this.data.room.id == info.id)
				{
					this.data.room = info;
				}
			}
			
			this.enterRoom();
		}
		
		private function enterRoom():void
		{
			var id:uint = AssetsManager.instance.getConfig("debug").getNumber("RoomID");
			
			var body:CReqEnterRoom = new CReqEnterRoom();
			body.roomId = id;
			
			Log.debug("发送进入房间请求", body);
			
			this.socket.send(MJRoomProtocol.CLIENT + MJRoomProtocol.OGID_ROOM_ENTER, body);
		}
		
		private function on_enterRoom(data:MJDataPack):void
		{
			var body:SAckEnterRoom = new SAckEnterRoom();
			body.mergeFrom(data.body);
			
			Log.debug("请求进入房间结果", body);
			
			if (body.result == 0)
			{
				this.data.room = this.data.getRoomByID(body.roomId);
				
				if (this.data.room.type == RoomType.AUTO)
				{
					this.standby();
				}
				else
				{
					this.tableList();
				}
			}
			else
			{
				Log.error("进入房间失败原因", body.failReason);
			}
		}
		
		private function standby():void
		{
			var body:CReqStandBy = new CReqStandBy();
			
			Log.debug("发送准备请求", body);
			
			this.socket.send(MJRoomProtocol.CLIENT + MJRoomProtocol.OGID_STAND_BY, body);
		}
		
		private function on_standby(data:MJDataPack):void
		{
			var body:SAckStandBy = new SAckStandBy();
			body.mergeFrom(data.body);
			
			Log.debug("请求准备结果", body);
			
			if (body.result != 0)
			{
				Log.error("请求准备失败原因", body.failReason);
			}
		}
		
		private function tableList():void
		{
		
		}
		
		private function on_tableList(data:MJDataPack):void
		{
			(this.context as State).manager.switchState(TableState);
		}
		
		private function on_tableInvite(data:MJDataPack):void
		{
			var body:NtfInviteTable = new NtfInviteTable();
			body.mergeFrom(data.body);
			
			Log.debug("收到桌子邀请消息", body);
			
			this.enterTable(body.tableId);
		}
		
		private function enterTable(id:uint):void
		{
			var body:CReqEnterTable = new CReqEnterTable();
			body.roomId = this.data.room.id;
			body.tableId = id;
			
			Log.debug("发送进入桌子请求", body);
			
			this.socket.send(MJRoomProtocol.CLIENT + MJRoomProtocol.OGID_TABLE_ENTER, body);
		}
		
		private function ON_enterTable(data:MJDataPack):void
		{
			var body:SAckEnterTable = new SAckEnterTable();
			body.mergeFrom(data.body);
			
			Log.debug("请求进入桌子结果", body);
			
			if (body.result == 0)
			{
				if (this.data.room.type == RoomType.AUTO)
				{
					this.data.table = new TableInfo(body.tableId);
				}
				else
				{
					this.data.table = this.data.room.getTableByID(body.tableId);
				}
				
				for each (var info:TablePlayer in body.player)
				{
					var user:UserInfo = (info.userId.low == this.data.user.id) ? this.data.user : new UserInfo(info.userId.low);
					
					if (info.userId.low == this.data.user.id)
					{
						this.data.table.currentSeat = info.seat;
					}
					
					user.seat = info.seat;
					user.nickname = info.nickname;
					user.chips = info.score;
					user.sex = info.gender;
					user.headImage = info.headImage;
					user.level = info.level;
					user.experience = info.experience;
					user.winRate = info.winRate;
					
					this.data.table.userList.add(user);
				}
			}
			else
			{
				Log.error("进入桌子失败原因", body.failReason);
			}
		}
		
		private function on_gameInvite(data:MJDataPack):void
		{
			var body:NtfInviteGame = new NtfInviteGame();
			body.mergeFrom(data.body);
			
			Log.debug("收到游戏邀请消息", body);
			
			this.data.gameID = body.gameId;
			
			(this.context as State).manager.switchState(TableState);
			
			this.notify(TableMethod.GAME_INVITE, body.tableId);
		}
	
	}
}
