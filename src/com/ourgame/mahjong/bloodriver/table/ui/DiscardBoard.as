package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.ourgame.mahjong.bloodriver.table.enum.Position;
	import com.ourgame.mahjong.bloodriver.table.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DisplayElement;
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * 打牌面板
	 * @author SiaoLeon
	 */
	public class DiscardBoard extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var background:MovieClip;
		
		private var tile:Tile;
		
		private var timer:Timer;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function DiscardBoard(position:uint, card:Card)
		{
			super();
			
			switch (position)
			{
				case Position.CURRENT:
					this.x = 440;
					this.y = 355;
					break;
				case Position.OPPOSITE:
					this.x = 440;
					this.y = 60;
					break;
				case Position.NEXT:
					this.x = 755;
					this.y = 200;
					break;
				case Position.PREV:
					this.x = 120;
					this.y = 200;
					break;
			}
			
			this.background = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.DiscardBoard);
			this.addChild(this.background);
			
			this.tile = new Tile(card);
			this.tile.x = 12;
			this.tile.y = 10;
			this.addChild(this.tile);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		override protected function onAddedToStage():void
		{
			this.timer = new Timer(2000, 1);
			this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
			this.timer.start();
		}
		
		override protected function onRemovedFromStage():void
		{
			this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
			this.timer = null;
		}
		
		private function onTimer(event:TimerEvent):void
		{
			this.remove();
		}
	
	}
}
