package com.ourgame.mahjong.bloodriver.lobby.controller
{
	import com.ourgame.mahjong.bloodriver.common.method.SocketMethod;
	import com.ourgame.mahjong.bloodriver.lobby.method.LobbyMethod;
	import com.ourgame.mahjong.bloodriver.lobby.method.RoomMethod;
	import com.ourgame.mahjong.bloodriver.lobby.model.BaseSocketModel;
	import com.ourgame.mahjong.bloodriver.lobby.model.UserModel;
	import com.wecoit.mvc.Controller;
	import com.wecoit.mvc.core.INotice;
	
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
			this.register(LobbyMethod.LOAD_USERINFO, LOAD_USERINFO);
			this.register(LobbyMethod.LOAD_USERINFO_ERROR, LOAD_USERINFO_ERROR);
			this.register(LobbyMethod.LOAD_USERINFO_COMPLETE, LOAD_USERINFO_COMPLETE);
			
			this.register(SocketMethod.CONNECT_ERROR(BaseSocketModel), CONNECT_ERROR);
			this.register(SocketMethod.CONNECT_SUCCESS(BaseSocketModel), CONNECT_SUCCESS);
			
			this.register(LobbyMethod.LOGIN_ERROR, LOGIN_ERROR);
			this.register(LobbyMethod.LOGIN_SUCCESS, LOGIN_SUCCESS);
			
			this.register(LobbyMethod.LOGOUT_ERROR, LOGOUT_ERROR);
			this.register(LobbyMethod.LOGOUT_SUCCESS, LOGOUT_SUCCESS);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function LOAD_USERINFO(notice:INotice):void
		{
			(this.context.getModel(UserModel) as UserModel).load();
		}
		
		private function LOAD_USERINFO_ERROR(notice:INotice):void
		{
			// TODO Auto Generated method stub
		
		}
		
		private function LOAD_USERINFO_COMPLETE(notice:INotice):void
		{
			this.notify(SocketMethod.CONNECT(BaseSocketModel));
		}
		
		private function CONNECT_ERROR(notice:INotice):void
		{
			// TODO Auto Generated method stub
		
		}
		
		private function CONNECT_SUCCESS(notice:INotice):void
		{
			this.notify(LobbyMethod.LOGIN);
		}
		
		private function LOGIN_ERROR(notice:INotice):void
		{
			// TODO Auto Generated method stub
		
		}
		
		private function LOGIN_SUCCESS(notice:INotice):void
		{
			this.notify(RoomMethod.ROOM_LIST);
		}
		
		private function LOGOUT_ERROR(notice:INotice):void
		{
			// TODO Auto Generated method stub
		
		}
		
		private function LOGOUT_SUCCESS(notice:INotice):void
		{
			// TODO Auto Generated method stub
		
		}
	
	}
}
