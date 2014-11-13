package com.ourgame.mahjong.bloodriver.table.view
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.table.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.table.events.MenuEvent;
	import com.ourgame.mahjong.bloodriver.table.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.table.ui.MenuBar;
	import com.ourgame.mahjong.bloodriver.table.ui.NavigationBar;
	import com.ourgame.mahjong.bloodriver.table.ui.TableInfoBar;
	import com.ourgame.mahjong.bloodriver.table.ui.TableLayer;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.mvc.View;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * 桌子视图
	 * @author SiaoLeon
	 */
	public class TableView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public var background:Bitmap;
		
		public var frame:MovieClip;
		
		public var logo:Bitmap;
		
		public var infoBar:TableInfoBar;
		
		public var navigation:NavigationBar;
		
		public var menuBar:MenuBar;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TableView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.background = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.TableBackground);
			TableLayer.instance.background.addChild(this.background);
			
			this.frame = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.TableFrame);
			this.frame.x = 216;
			this.frame.y = 102;
			TableLayer.instance.background.addChild(this.frame);
			
			this.logo = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.TableLogo);
			this.logo.x = 371;
			this.logo.y = 228;
			TableLayer.instance.background.addChild(this.logo);
			
			this.infoBar = new TableInfoBar();
			TableLayer.instance.foreground.addChild(this.infoBar);
			
			this.navigation = new NavigationBar();
			TableLayer.instance.foreground.addChild(this.navigation);
			
			this.menuBar = new MenuBar();
			TableLayer.instance.foreground.addChild(this.menuBar);
			
			this.menuBar.addEventListener(MenuEvent.RETURN, onRetrun, false, 0, true);
			
			this.bind(CommonData.room, this.infoBar, {name: "roomName"});
			this.bind(CommonData.table, this.infoBar, {name: "tableName"});
			this.bind(CommonData.user, this.navigation, {nickname: "nickname", chips: "chips"});
		}
		
		override public function onRemove():void
		{
			this.clearBind();
			
			this.menuBar.removeEventListener(MenuEvent.RETURN, onRetrun);
			
			TableLayer.instance.foreground.removeChild(this.menuBar);
			this.menuBar = null;
			
			TableLayer.instance.foreground.removeChild(this.navigation);
			this.navigation = null;
			
			TableLayer.instance.foreground.removeChild(this.infoBar);
			this.infoBar = null;
			
			TableLayer.instance.background.removeChild(this.logo);
			this.logo = null;
			
			TableLayer.instance.background.removeChild(this.frame);
			this.frame = null;
			
			TableLayer.instance.background.removeChild(this.background);
			this.background = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onRetrun(event:Event):void
		{
			this.notify(TableMethod.RETURN);
		}
	
	}
}
