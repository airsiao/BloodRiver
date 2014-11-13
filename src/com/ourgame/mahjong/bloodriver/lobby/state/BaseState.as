package com.ourgame.mahjong.bloodriver.lobby.state
{
	import com.ourgame.mahjong.bloodriver.lobby.controller.BaseController;
	import com.ourgame.mahjong.bloodriver.lobby.controller.BaseSocketController;
	import com.ourgame.mahjong.bloodriver.lobby.model.BaseSocketModel;
	import com.ourgame.mahjong.bloodriver.lobby.model.GameLoadModel;
	import com.ourgame.mahjong.bloodriver.lobby.model.UserModel;
	import com.ourgame.mahjong.bloodriver.lobby.view.BaseView;
	import com.wecoit.mvc.State;
	
	/**
	 * 基础状态
	 * @author SiaoLeon
	 */
	public class BaseState extends State
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public var layers:BaseView;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function BaseState(key:Object=null)
		{
			super(key);
			
			this.add(new ConnectState());
			this.add(new LobbyState());
			this.add(new RoomState());
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onInit():void
		{
			this.layers = new BaseView();
		}
		
		override public function onEnter():void
		{
			this.addModel(UserModel);
			this.addModel(GameLoadModel);
			this.addModel(BaseSocketModel);
			
			this.addView(this.layers);
			
			this.addController(new BaseSocketController());
			this.addController(new BaseController());
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
