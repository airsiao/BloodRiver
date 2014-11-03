package com.ourgame.mahjong.bloodriver.model
{
	import com.ourgame.mahjong.bloodriver.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.state.TableState;
	import com.ourgame.mahjong.libaray.ITableProxy;
	import com.ourgame.mahjong.libaray.SocketProcessor;
	import com.ourgame.mahjong.libaray.data.CommonData;
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
	import com.wecoit.data.ArrayList;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.Application;
	import com.wecoit.mvc.Model;
	import com.wecoit.mvc.State;
	import com.wecoit.utils.bytes.Base64;
	
	import flash.net.SharedObject;
	
	/**
	 * 桌子代理数据模型
	 * @author SiaoLeon
	 */
	public class TableModel extends Model implements ITableProxy
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
		public function TableModel()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function ready():void
		{
			this.standby();
		}
		
		public function leave():void
		{
		}
		
		public function connect():void
		{
			var host:String = AssetsManager.instance.getConfig("debug").getString("ServerHost");
			var port:uint = AssetsManager.instance.getConfig("debug").getNumber("ServerPort");
			
			CommonData.tableProxy = this.context.getModel(TableModel) as TableModel;
			
			CommonData.socket = new SocketProcessor();
			CommonData.socket.addEventListener(SocketEvent.CONNECTED, onConnected, false, 0, true);
			CommonData.socket.addEventListener(SocketEvent.ERROR, onError, false, 0, true);
			CommonData.socket.addEventListener(SocketEvent.RECIVE, onRecive, false, 0, true);
			CommonData.socket.connect(host, port);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onConnected(event:SocketEvent):void
		{
			this.login();
		}
		
		private function onError(event:SocketEvent):void
		{
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
			body.ourgameId = CommonData.ourgameID;
			body.username = CommonData.username;
			body.rolename = CommonData.rolename;
			body.nickname = CommonData.nickname;
			body.ticket = Base64.decode(CommonData.ticket);
			body.sessionKey = so.data["session"];
			body.headImage = CommonData.user.headImage;
			body.gender = CommonData.user.sex;
			body.channelId = CommonData.channelID;
			body.version = 1;
			body.force = true;
			body.antiAddict = (Application.stage.loaderInfo.parameters["CMStatus"] != 0);
			
			Log.debug("发送登录请求", body);
			
			CommonData.socket.send(MJLobbyProtocol.CLIENT + MJLobbyProtocol.OGID_USER_LOGIN, body);
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
				
				CommonData.user.nickname = CommonData.nickname;
				CommonData.user.id = body.userId.low;
				CommonData.user.coins = body.money;
				CommonData.user.experience = body.experience;
				CommonData.user.level = body.level;
				CommonData.user.masterScore = body.materScore;
				
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
			
			CommonData.socket.send(MJRoomProtocol.CLIENT + MJRoomProtocol.OGID_ROOM_LIST, body);
		}
		
		private function on_roomList(data:MJDataPack):void
		{
			var body:SAckRoomList = new SAckRoomList();
			body.mergeFrom(data.body);
			
			Log.debug("请求房间列表结果", body);
			
			CommonData.roomList = new ArrayList();
			
			for each (var room:Room in body.rooms)
			{
				var info:RoomInfo = new RoomInfo(room.roomId);
				info.name = room.roomName;
				info.type = room.roomType;
				info.gameType = room.gameType;
				info.playerCount = room.userAmount;
				info.buyin = room.enterBuyIn;
				info.rate = room.unitValue;
				CommonData.roomList.add(info);
				
				if (CommonData.room != null && CommonData.room.id == info.id)
				{
					CommonData.room = info;
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
			
			CommonData.socket.send(MJRoomProtocol.CLIENT + MJRoomProtocol.OGID_ROOM_ENTER, body);
		}
		
		private function on_enterRoom(data:MJDataPack):void
		{
			var body:SAckEnterRoom = new SAckEnterRoom();
			body.mergeFrom(data.body);
			
			Log.debug("请求进入房间结果", body);
			
			if (body.result == 0)
			{
				CommonData.room = CommonData.getRoomByID(body.roomId);
				
				if (CommonData.room.type == RoomType.AUTO)
				{
					CommonData.user.seat = 0;
					CommonData.table = new TableInfo();
					CommonData.table.userList.add(CommonData.user);
					
					(this.context as State).manager.switchState(TableState);
					
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
			
			CommonData.socket.send(MJRoomProtocol.CLIENT + MJRoomProtocol.OGID_STAND_BY, body);
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
			body.roomId = CommonData.room.id;
			body.tableId = id;
			
			Log.debug("发送进入桌子请求", body);
			
			CommonData.socket.send(MJRoomProtocol.CLIENT + MJRoomProtocol.OGID_TABLE_ENTER, body);
		}
		
		private function ON_enterTable(data:MJDataPack):void
		{
			var body:SAckEnterTable = new SAckEnterTable();
			body.mergeFrom(data.body);
			
			Log.debug("请求进入桌子结果", body);
			
			if (body.result == 0)
			{
				if (CommonData.room.type == RoomType.AUTO)
				{
					CommonData.table.id = body.tableId;
				}
				else
				{
					CommonData.table = CommonData.room.getTableByID(body.tableId);
				}
				
				for each (var info:TablePlayer in body.player)
				{
					var user:UserInfo = (info.userId.low == CommonData.user.id) ? CommonData.user : new UserInfo(info.userId.low);
					
					if (info.userId.low == CommonData.user.id)
					{
						CommonData.table.currentSeat = info.seat;
					}
					
					user.seat = info.seat;
					user.nickname = info.nickname;
					user.chips = info.score;
					user.sex = info.gender;
					user.headImage = info.headImage;
					user.level = info.level;
					user.experience = info.experience;
					user.winRate = info.winRate;
					
					CommonData.table.userList.add(user);
				}
				
				(this.context as State).manager.switchState(TableState);
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
			
			CommonData.gameID = body.gameId;
			
			this.notify(TableMethod.GAME_INVITE, body.tableId);
		}
	
	}
}
