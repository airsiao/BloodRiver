package com.ourgame.mahjong.bloodriver.lobby.state
{
	import com.ourgame.mahjong.bloodriver.lobby.controller.LobbyController;
	import com.ourgame.mahjong.bloodriver.lobby.controller.LobbySocketController;
	import com.ourgame.mahjong.bloodriver.lobby.view.LobbyView;
	import com.ourgame.mahjong.bloodriver.lobby.view.RankView;
	import com.ourgame.mahjong.bloodriver.lobby.view.RoomView;
	import com.wecoit.debug.Log;
	import com.wecoit.mvc.State;
	
	/**
	 * 大厅状态
	 * @author SiaoLeon
	 */
	public class LobbyState extends State
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public var view:LobbyView;
		
		public var room:RoomView;
		
		public var rank:RankView;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function LobbyState(key:Object=null)
		{
			super(key);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onInit():void
		{
			this.view = new LobbyView();
			this.room = new RoomView();
			this.rank = new RankView();
		}
		
		override public function onEnter():void
		{
			Log.debug("进入大厅");
			
			this.addView(this.view);
			this.addView(this.room);
			this.addView(this.rank);
			
			this.addController(new LobbySocketController());
			this.addController(new LobbyController());
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}