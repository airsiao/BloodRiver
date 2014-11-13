package com.ourgame.mahjong.bloodriver.lobby.view
{
	import com.ourgame.mahjong.bloodriver.lobby.enum.UILobbyDefinition;
	import com.ourgame.mahjong.bloodriver.lobby.ui.LobbyLayer;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.mvc.View;
	
	import flash.display.Bitmap;
	
	/**
	 * 大厅视图
	 * @author SiaoLeon
	 */
	public class LobbyView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var background:Bitmap;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function LobbyView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.background = AssetsManager.instance.getDefinitionBitmap(UILobbyDefinition.LobbyBackground);
			LobbyLayer.instance.background.addChild(this.background);
		}
		
		override public function onRemove():void
		{
			LobbyLayer.instance.background.removeChild(this.background);
			this.background = null;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
