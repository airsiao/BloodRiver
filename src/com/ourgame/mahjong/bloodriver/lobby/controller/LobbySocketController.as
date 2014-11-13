package com.ourgame.mahjong.bloodriver.lobby.controller
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.enum.RoomType;
	import com.ourgame.mahjong.bloodriver.common.method.SocketMethod;
	import com.ourgame.mahjong.bloodriver.common.vo.ChatInfo;
	import com.ourgame.mahjong.bloodriver.common.vo.TableInfo;
	import com.ourgame.mahjong.bloodriver.common.vo.socket.MJDataPack;
	import com.ourgame.mahjong.bloodriver.lobby.method.LobbyMethod;
	import com.ourgame.mahjong.bloodriver.lobby.method.RoomMethod;
	import com.ourgame.mahjong.bloodriver.lobby.model.BaseSocketModel;
	import com.ourgame.mahjong.message.CReqEnterRoom;
	import com.ourgame.mahjong.message.CReqGlobalChat;
	import com.ourgame.mahjong.message.CReqRankList;
	import com.ourgame.mahjong.message.CReqRoomPlayerAmount;
	import com.ourgame.mahjong.message.CReqUserAmount;
	import com.ourgame.mahjong.message.CReqUserData;
	import com.ourgame.mahjong.message.SAckEnterRoom;
	import com.ourgame.mahjong.protocol.MJLobbyProtocol;
	import com.ourgame.mahjong.protocol.MJRoomProtocol;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.core.INotice;
	
	/**
	 * 大厅Socket控制器
	 * @author SiaoLeon
	 */
	public class LobbySocketController extends Controller
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
		public function LobbySocketController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.register(SocketMethod.RECIVED(BaseSocketModel), RECIVED);
			
			this.register(LobbyMethod.UPDATE_RANK, UPDATE_RANK);
			this.register(LobbyMethod.UPDATE_USER, UPDATE_USER);
			this.register(LobbyMethod.UPDATE_USER_COUNT, UPDATE_USER_COUNT);
			this.register(LobbyMethod.SPEAKER, SPEAKER);
			
			this.register(RoomMethod.ENTER_ROOM, ENTER_ROOM);
			this.register(RoomMethod.UPDATE_PLAYER_COUNT, UPDATE_PLAYER_COUNT);
			
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
				case MJLobbyProtocol.SERVER + MJLobbyProtocol.OGID_RANK_DATA:
					this.ON_RANK(data);
					break;
				
				case MJLobbyProtocol.SERVER + MJLobbyProtocol.OGID_USER_DATA:
					this.ON_USER(data);
					break;
				
				case MJLobbyProtocol.SERVER + MJLobbyProtocol.OGID_USER_COUNT:
					this.ON_USER_COUNT(data);
					break;
				
				case MJLobbyProtocol.SERVER + MJLobbyProtocol.OGID_GLOBAL_NOTICE:
					this.ON_NOTICE(data);
					break;
				
				case MJLobbyProtocol.SERVER + MJLobbyProtocol.OGID_GLOBAL_CHAT:
					this.ON_SPEAKER(data);
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_ROOM_ENTER:
					this.ON_ROOM_ENTER(data);
					break;
				
				case MJRoomProtocol.SERVER + MJRoomProtocol.OGID_PLAYER_COUNT:
					this.ON_PLAYER_COUNT(data);
					break;
			}
		}
		
		// -------------------------------------------------------------------------------------------------------- 发送
		
		private function UPDATE_RANK(notice:INotice):void
		{
			var body:CReqRankList = new CReqRankList();
			body.type = 0;
			body.page = 0;
			body.size = 20;
			
			Log.debug("发送更新排行榜请求", body);
			
			this.socket.send(MJLobbyProtocol.CLIENT + MJLobbyProtocol.OGID_RANK_DATA, body);
		}
		
		private function UPDATE_USER(notice:INotice):void
		{
			var body:CReqUserData = new CReqUserData();
			
			Log.debug("发送更新用户信息请求", body);
			
			this.socket.send(MJLobbyProtocol.CLIENT + MJLobbyProtocol.OGID_RANK_DATA, body);
		}
		
		private function UPDATE_USER_COUNT(notice:INotice):void
		{
			var body:CReqUserAmount = new CReqUserAmount();
			
			Log.debug("发送更新用户人数请求", body);
			
			this.socket.send(MJLobbyProtocol.CLIENT + MJLobbyProtocol.OGID_USER_COUNT, body);
		}
		
		private function SPEAKER(notice:INotice):void
		{
			var message:ChatInfo = notice.params;
			
			var body:CReqGlobalChat = new CReqGlobalChat();
			body.msgType = message.type;
			body.content = message.content;
			body.receivers = null;
			
			Log.debug("发送喇叭广播", message);
			
			this.socket.send(MJLobbyProtocol.CLIENT + MJLobbyProtocol.OGID_GLOBAL_CHAT, body);
		}
		
		private function ENTER_ROOM(notice:INotice):void
		{
			var body:CReqEnterRoom = new CReqEnterRoom();
			body.roomId = notice.params;
			
			Log.debug("发送进入房间请求", body);
			
			this.socket.send(MJRoomProtocol.CLIENT + MJRoomProtocol.OGID_ROOM_ENTER, body);
		}
		
		private function UPDATE_PLAYER_COUNT(notice:INotice):void
		{
			var body:CReqRoomPlayerAmount = new CReqRoomPlayerAmount();
			body.roomIds = notice.params;
			
			Log.debug("发送更新房间用户数请求", body);
			
			this.socket.send(MJRoomProtocol.CLIENT + MJRoomProtocol.OGID_PLAYER_COUNT, body);
		}
		
		// -------------------------------------------------------------------------------------------------------- 接收
		
		private function ON_RANK(data:MJDataPack):void
		{
		}
		
		private function ON_USER(data:MJDataPack):void
		{
		}
		
		private function ON_USER_COUNT(data:MJDataPack):void
		{
		}
		
		private function ON_NOTICE(data:MJDataPack):void
		{
		}
		
		private function ON_SPEAKER(data:MJDataPack):void
		{
		}
		
		private function ON_ROOM_ENTER(data:MJDataPack):void
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
				}
				
				this.notify(RoomMethod.ENTER_ROOM_SUCCESS);
			}
			else
			{
				Log.error("进入房间失败原因", body.failReason);
				
				this.notify(RoomMethod.ENTER_ROOM_ERROR, body.result);
			}
		}
		
		private function ON_PLAYER_COUNT(data:MJDataPack):void
		{
		}
	
	}
}
