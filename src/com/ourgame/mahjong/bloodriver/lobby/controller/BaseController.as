package com.ourgame.mahjong.bloodriver.lobby.controller
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.enum.RoomType;
	import com.ourgame.mahjong.bloodriver.common.vo.RoomInfo;
	import com.ourgame.mahjong.bloodriver.lobby.method.LobbyMethod;
	import com.ourgame.mahjong.bloodriver.lobby.method.RoomMethod;
	import com.ourgame.mahjong.bloodriver.lobby.model.GameLoadModel;
	import com.ourgame.mahjong.bloodriver.lobby.state.ConnectState;
	import com.ourgame.mahjong.bloodriver.lobby.state.LobbyState;
	import com.ourgame.mahjong.bloodriver.lobby.state.RoomTableState;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.State;
	import com.wecoit.mvc.core.INotice;
	
	/**
	 * 基础控制器
	 * @author SiaoLeon
	 */
	public class BaseController extends Controller
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
		public function BaseController()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.register(LobbyMethod.CONNECT, CONNECT);
			this.register(LobbyMethod.DISCONNECT, DISCONNECT);
			
			this.register(RoomMethod.ROOM_LIST_ERROR, ROOM_LIST_ERROR);
			this.register(RoomMethod.ROOM_LIST_SUCCESS, ROOM_LIST_SUCCESS);
			
			this.register(LobbyMethod.ENTER_ROOM, ENTER_ROOM);
			
			this.register(RoomMethod.ENTER_ROOM_ERROR, ENTER_ROOM_ERROR);
			this.register(RoomMethod.ENTER_ROOM_SUCCESS, ENTER_ROOM_SUCCESS);
			
			this.register(RoomMethod.LEAVE_ROOM_ERROR, LEAVE_ROOM_ERROR);
			this.register(RoomMethod.LEAVE_ROOM_SUCCESS, LEAVE_ROOM_SUCCESS);
			
			this.register(LobbyMethod.LOAD_GAME_ERROR, LOAD_GAME_ERROR);
			this.register(LobbyMethod.LOAD_GAME_COMPLETE, LOAD_GAME_COMPLETE);
			
			this.CONNECT();
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function CONNECT(notice:INotice=null):void
		{
			(this.context as State).manager.switchState(ConnectState);
			
			this.notify(LobbyMethod.LOAD_USERINFO);
		}
		
		private function DISCONNECT(notice:INotice):void
		{
		}
		
		private function ROOM_LIST_ERROR(notice:INotice):void
		{
			// TODO Auto Generated method stub
		
		}
		
		private function ROOM_LIST_SUCCESS(notice:INotice):void
		{
			(this.context as State).manager.switchState(LobbyState);
			
			if (CommonData.room != null)
			{
				this.notify(LobbyMethod.ENTER_ROOM, CommonData.room.id);
			}
		}
		
		private function ENTER_ROOM(notice:INotice):void
		{
			CommonData.room = CommonData.getRoomByID(notice.params);
			
			if (CommonData.room.type == RoomType.AUTO)
			{
				(this.context.getModel(GameLoadModel) as GameLoadModel).load(CommonData.room.gameType);
			}
			else
			{
			}
		}
		
		private function ENTER_ROOM_ERROR(notice:INotice):void
		{
			// TODO Auto Generated method stub
		
		}
		
		private function ENTER_ROOM_SUCCESS(notice:INotice):void
		{
			if (CommonData.room.type == RoomType.AUTO)
			{
				(this.context as State).manager.switchState(RoomTableState);
			}
			else
			{
				
			}
		}
		
		private function LEAVE_ROOM_ERROR(notice:INotice):void
		{
		
		}
		
		private function LEAVE_ROOM_SUCCESS(notice:INotice):void
		{
			var room:RoomInfo = notice.params;
			
			if (room.type == RoomType.AUTO)
			{
				(this.context as State).manager.switchState(LobbyState);
				(this.context.getModel(GameLoadModel) as GameLoadModel).unload();
			}
			else
			{
			}
		}
		
		private function LOAD_GAME_ERROR(notice:INotice):void
		{
			if (CommonData.room.type == RoomType.AUTO)
			{
				CommonData.room = null;
			}
		}
		
		private function LOAD_GAME_COMPLETE(notice:INotice):void
		{
			if (CommonData.room.type == RoomType.AUTO)
			{
				this.notify(RoomMethod.ENTER_ROOM, CommonData.room.id);
			}
			else
			{
			}
		}
	
	}
}
