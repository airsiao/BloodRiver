package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.ui.CountDown;
	import com.ourgame.mahjong.bloodriver.ui.FlowerPig;
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.ourgame.mahjong.bloodriver.ui.MenuBar;
	import com.ourgame.mahjong.bloodriver.ui.SwapBoard;
	import com.ourgame.mahjong.bloodriver.ui.TableBar;
	import com.ourgame.mahjong.bloodriver.ui.TableInfoBar;
	import com.ourgame.mahjong.bloodriver.ui.TingBoard;
	import com.ourgame.mahjong.bloodriver.vo.Game;
	import com.ourgame.mahjong.bloodriver.vo.TingInfo;
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
		
		public var countdown:CountDown;
		
		public var infoBar:TableInfoBar;
		
		public var swapBoard:SwapBoard;
		
		public var flowerPig:FlowerPig;
		
		public var tingBoard:TingBoard;
		
		public var tableBar:TableBar;
		
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
			LayerManager.instance.background.addChild(this.background);
			
			this.frame = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.TableFrame);
			this.frame.x = 216;
			this.frame.y = 102;
			LayerManager.instance.background.addChild(this.frame);
			
			this.logo = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.TableLogo);
			this.logo.x = 371;
			this.logo.y = 228;
			LayerManager.instance.background.addChild(this.logo);
			
			this.countdown = new CountDown();
			this.countdown.visible = false;
			LayerManager.instance.background.addChild(this.countdown);
			
			this.infoBar = new TableInfoBar();
			LayerManager.instance.foreground.addChild(this.infoBar);
			
			this.swapBoard = new SwapBoard();
			this.swapBoard.visible = false;
			LayerManager.instance.foreground.addChild(this.swapBoard);
			
			this.flowerPig = new FlowerPig();
			this.flowerPig.visible = false;
			LayerManager.instance.foreground.addChild(this.flowerPig);
			
			this.tingBoard = new TingBoard();
			this.tingBoard.visible = false;
			LayerManager.instance.foreground.addChild(this.tingBoard);
			
			this.tableBar = new TableBar();
			LayerManager.instance.foreground.addChild(this.tableBar);
			
			this.menuBar = new MenuBar();
			LayerManager.instance.foreground.addChild(this.menuBar);
			
			this.menuBar.addEventListener("back", onBack, false, 0, true);
			
			this.bind((this.module as BloodRiver).info.data.room, this.infoBar, {name: "roomName"});
			this.bind((this.module as BloodRiver).info.data.table, this.infoBar, {name: "tableName"});
			
			this.bind((this.module as BloodRiver).info.data.user, this.tableBar, {nickname: "nickname", chips: "chips"});
		}
		
		override public function onRemove():void
		{
			this.menuBar.removeEventListener("back", onBack);
			
			LayerManager.instance.foreground.removeChild(this.menuBar);
			this.menuBar = null;
			
			LayerManager.instance.foreground.removeChild(this.tableBar);
			this.tableBar = null;
			
			LayerManager.instance.foreground.removeChild(this.tingBoard);
			this.tingBoard = null;
			
			LayerManager.instance.foreground.removeChild(this.flowerPig);
			this.flowerPig = null;
			
			LayerManager.instance.foreground.removeChild(this.swapBoard);
			this.swapBoard = null;
			
			LayerManager.instance.foreground.removeChild(this.infoBar);
			this.infoBar = null;
			
			LayerManager.instance.background.removeChild(this.countdown);
			this.countdown = null;
			
			LayerManager.instance.background.removeChild(this.logo);
			this.logo = null;
			
			LayerManager.instance.background.removeChild(this.frame);
			this.frame = null;
			
			LayerManager.instance.background.removeChild(this.background);
			this.background = null;
			
			this.unBind((this.module as BloodRiver).info.data.room, this.infoBar);
			this.unBind((this.module as BloodRiver).info.data.table, this.infoBar);
			
			this.unBind(GameData.currentGame, this.swapBoard);
		}
		
		public function bindGame(game:Game):void
		{
			this.bind(game, this.swapBoard, {remainCards: "count"});
		}
		
		public function updateFlowerPig(value:Boolean):void
		{
			this.flowerPig.visible = value;
		}
		
		public function showTing(info:TingInfo):void
		{
			this.tingBoard.show(info);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onBack(event:Event):void
		{
			this.notify(TableMethod.BACK);
		}
	
	}
}
