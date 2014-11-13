package com.ourgame.mahjong.bloodriver.table.view
{
	import com.ourgame.mahjong.bloodriver.table.data.GameData;
	import com.ourgame.mahjong.bloodriver.table.ui.CountDown;
	import com.ourgame.mahjong.bloodriver.table.ui.FlowerPig;
	import com.ourgame.mahjong.bloodriver.table.ui.SwapBoard;
	import com.ourgame.mahjong.bloodriver.table.ui.TableLayer;
	import com.ourgame.mahjong.bloodriver.table.ui.TingBoard;
	import com.ourgame.mahjong.bloodriver.table.vo.TingInfo;
	import com.wecoit.mvc.View;
	
	/**
	 * 游戏视图
	 * @author SiaoLeon
	 */
	public class GameView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public var countdown:CountDown;
		
		public var swapBoard:SwapBoard;
		
		public var flowerPig:FlowerPig;
		
		public var tingBoard:TingBoard;
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function GameView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.countdown = new CountDown();
			this.countdown.visible = false;
			TableLayer.instance.background.addChild(this.countdown);
			
			this.swapBoard = new SwapBoard();
			this.swapBoard.visible = false;
			TableLayer.instance.foreground.addChild(this.swapBoard);
			
			this.flowerPig = new FlowerPig();
			this.flowerPig.visible = false;
			TableLayer.instance.foreground.addChild(this.flowerPig);
			
			this.tingBoard = new TingBoard();
			this.tingBoard.visible = false;
			TableLayer.instance.foreground.addChild(this.tingBoard);
		}
		
		override public function onRemove():void
		{
			this.clearBind();
			
			TableLayer.instance.foreground.removeChild(this.tingBoard);
			this.tingBoard = null;
			
			TableLayer.instance.foreground.removeChild(this.flowerPig);
			this.flowerPig = null;
			
			TableLayer.instance.foreground.removeChild(this.swapBoard);
			this.swapBoard = null;
			
			TableLayer.instance.background.removeChild(this.countdown);
			this.countdown = null;
		}
		
		public function bindData():void
		{
			this.bind(GameData.currentGame, this.swapBoard, {remainCards: "count"});
		}
		
		public function showTing(info:TingInfo):void
		{
			this.tingBoard.show(info);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
