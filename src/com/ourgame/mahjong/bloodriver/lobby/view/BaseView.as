package com.ourgame.mahjong.bloodriver.lobby.view
{
	import com.ourgame.mahjong.bloodriver.lobby.ui.LobbyLayer;
	import com.wecoit.mvc.View;
	
	/**
	 * 基础视图
	 * @author SiaoLeon
	 */
	public class BaseView extends View
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
		public function BaseView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.module.addChild(LobbyLayer.instance.background);
			this.module.addChild(LobbyLayer.instance.foreground);
			this.module.addChild(LobbyLayer.instance.game);
			this.module.addChild(LobbyLayer.instance.pop);
			this.module.addChild(LobbyLayer.instance.tip);
		}
		
		override public function onRemove():void
		{
			this.module.removeChild(LobbyLayer.instance.background);
			this.module.removeChild(LobbyLayer.instance.foreground);
			this.module.removeChild(LobbyLayer.instance.game);
			this.module.removeChild(LobbyLayer.instance.pop);
			this.module.removeChild(LobbyLayer.instance.tip);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
