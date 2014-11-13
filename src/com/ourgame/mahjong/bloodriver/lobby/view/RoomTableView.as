package com.ourgame.mahjong.bloodriver.lobby.view
{
	import com.ourgame.mahjong.bloodriver.lobby.model.GameLoadModel;
	import com.ourgame.mahjong.bloodriver.lobby.ui.LobbyLayer;
	import com.wecoit.mvc.View;
	
	/**
	 * 房间桌子视图
	 * @author SiaoLeon
	 */
	public class RoomTableView extends View
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
		public function RoomTableView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			LobbyLayer.instance.game.addChild((this.context.getModel(GameLoadModel) as GameLoadModel).currentMain);
		}
		
		override public function onRemove():void
		{
			LobbyLayer.instance.game.clear();
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}