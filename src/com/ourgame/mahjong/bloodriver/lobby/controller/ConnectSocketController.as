package com.ourgame.mahjong.bloodriver.lobby.controller
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.method.SocketMethod;
	import com.ourgame.mahjong.bloodriver.common.vo.RoomInfo;
	import com.ourgame.mahjong.bloodriver.common.vo.TableInfo;
	import com.ourgame.mahjong.bloodriver.common.vo.socket.MJDataPack;
	import com.ourgame.mahjong.bloodriver.lobby.method.LobbyMethod;
	import com.ourgame.mahjong.bloodriver.lobby.method.RoomMethod;
	import com.ourgame.mahjong.bloodriver.lobby.model.BaseSocketModel;
	import com.ourgame.mahjong.message.CReqLogin;
	import com.ourgame.mahjong.message.CReqLogout;
	import com.ourgame.mahjong.message.CReqRoomList;
	import com.ourgame.mahjong.message.GameInfo;
	import com.ourgame.mahjong.message.Room;
	import com.ourgame.mahjong.message.SAckLogin;
	import com.ourgame.mahjong.message.SAckLogout;
	import com.ourgame.mahjong.message.SAckRoomList;
	import com.ourgame.mahjong.protocol.MJLobbyProtocol;
	import com.ourgame.mahjong.protocol.MJRoomProtocol;
	import com.wecoit.data.ArrayList;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.Application;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.core.INotice;
	import com.wecoit.utils.bytes.Base64;
	
	import flash.net.SharedObject;
	
	/**
	 * 连接Socket控制器
	 * @author SiaoLeon
	 */
	public class ConnectSocketController extends Controller
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var socket:BaseSocketModel;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function ConnectSocketController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.register(SocketMethod.RECIVED(BaseSocketModel), RECIVED);
			
			this.register(LobbyMethod.LOGIN, LOGIN);
			this.register(LobbyMethod.LOGOUT, LOGOUT);
			
			this.register(RoomMethod.ROOM_LIST, ROOM_LIST);
			
			this.socket = this.context.getModel(BaseSocketModel) as BaseSocketModel;
		}
		
		override public function onRemove():void
		{
			this.socket = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function RECIVED(notice:INotice):void
		{
			var data:MJDataPack = notice.params;
			
			switch (data.type)
			{
				case MJLobbyProtocol.SERVER + MJLobbyProtocol.OGID_USER_LOGIN:
					this.ON_LOGIN(data);
					break;
				
				case MJLobbyProtocol.SERVER + MJLobbyProtocol.OGID_USER_LOGOUT:
					this.ON_LOGOUT(data);
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_ROOM_LIST:
					this.ON_ROOM_LIST(data);
					break;
			}
		}
		
		// -------------------------------------------------------------------------------------------------------- 发送
		
		private function LOGIN(notice:INotice):void
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
			
			this.socket.send(MJLobbyProtocol.CLIENT + MJLobbyProtocol.OGID_USER_LOGIN, body);
		}
		
		private function LOGOUT(notice:INotice):void
		{
			var so:SharedObject = SharedObject.getLocal("OurgameMahjong");
			
			var body:CReqLogout = new CReqLogout();
			body.sessionKey = so.data["session"];
			
			Log.debug("发送登出请求", body);
			
			this.socket.send(MJLobbyProtocol.CLIENT + MJLobbyProtocol.OGID_USER_LOGOUT, body);
		}
		
		private function ROOM_LIST(notice:INotice):void
		{
			var body:CReqRoomList = new CReqRoomList();
			
			Log.debug("发送获取房间列表请求", body);
			
			this.socket.send(MJRoomProtocol.CLIENT + MJRoomProtocol.OGID_ROOM_LIST, body);
		}
		
		// -------------------------------------------------------------------------------------------------------- 接收
		
		private function ON_LOGIN(data:MJDataPack):void
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
				
				if (body.games.length > 0)
				{
					var game:GameInfo = body.games[0];
					CommonData.room = new RoomInfo(game.roomId);
					CommonData.table = new TableInfo(game.tableId);
					CommonData.gameID = game.gameId;
				}
				
				this.notify(LobbyMethod.LOGIN_SUCCESS);
			}
			else
			{
				Log.error("登录失败原因", body.failReason);
				this.notify(LobbyMethod.LOGIN_ERROR, body.result);
			}
		}
		
		private function ON_LOGOUT(data:MJDataPack):void
		{
			var body:SAckLogout = new SAckLogout();
			body.mergeFrom(data.body);
			
			Log.debug("请求登出结果", body);
			
			if (body.result == 0)
			{
				this.notify(LobbyMethod.LOGOUT_SUCCESS);
			}
			else
			{
				this.notify(LobbyMethod.LOGOUT_ERROR, body.result);
			}
		}
		
		private function ON_ROOM_LIST(data:MJDataPack):void
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
			
			this.notify(RoomMethod.ROOM_LIST_SUCCESS);
		}
	
	}
}
