package com.ourgame.mahjong.bloodriver.lobby.view
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.vo.RoomInfo;
	import com.ourgame.mahjong.bloodriver.lobby.enum.UILobbyDefinition;
	import com.ourgame.mahjong.bloodriver.lobby.method.LobbyMethod;
	import com.ourgame.mahjong.bloodriver.lobby.ui.LobbyLayer;
	import com.ourgame.mahjong.bloodriver.lobby.ui.RoomItem;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.mvc.View;
	
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	
	/**
	 * 房间视图
	 * @author SiaoLeon
	 */
	public class RoomView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var items:Vector.<RoomItem>;
		
		private var background:Bitmap;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function RoomView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.items = new Vector.<RoomItem>();
			
			this.background = AssetsManager.instance.getDefinitionBitmap(UILobbyDefinition.RoomListBacground);
			this.background.x = 3;
			this.background.y = 118;
			LobbyLayer.instance.foreground.addChild(this.background);
			
			for (var i:int = 0; i < CommonData.roomList.length; i++)
			{
				var info:RoomInfo = CommonData.roomList.element(i);
				var item:RoomItem = new RoomItem();
				item.x = 15 + i % 3 * 215;
				item.y = 185 + Math.floor(i / 3) * 200;
				item.data = info;
				item.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
				LobbyLayer.instance.foreground.addChild(item);
				this.items.push(item);
			}
		}
		
		override public function onRemove():void
		{
			for each (var item:RoomItem in this.items)
			{
				item.remove();
			}
			
			LobbyLayer.instance.foreground.removeChild(this.background);
			this.background = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		protected function onClick(event:MouseEvent):void
		{
			var target:RoomInfo = (event.target as RoomItem).data;
			this.notify(LobbyMethod.ENTER_ROOM, target.id);
		}
	
	}
}
