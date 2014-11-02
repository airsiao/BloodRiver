package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.vo.ResultRecord;
	import com.wecoit.component.ButtonClip;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DisplayElement;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.ColorMatrixFilter;
	
	[Event(name="return", type="flash.events.Event")]
	
	[Event(name="continue", type="flash.events.Event")]
	
	/**
	 * 结算面板
	 * @author SiaoLeon
	 */
	public class ResultPanel extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var content:MovieClip;
		
		private var number:WinFanNumber;
		
		private var symbol:MovieClip;
		
		private var btnReturn:ButtonClip;
		
		private var btnContinue:ButtonClip;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function ResultPanel(fan:Vector.<int>, records:Vector.<ResultRecord>)
		{
			super();
			
			var current:int = fan[GameData.currentPlayer.user.seat];
			
			this.content = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.Result);
			this.content.gotoAndStop((current < 0) ? 2 : 1);
			this.addChild(this.content);
			
			this.number = new WinFanNumber(Math.abs(current));
			this.number.x = 323 - this.number.width;
			this.number.y = 105;
			this.number.filters = current < 0 ? [new ColorMatrixFilter([0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0, 0, 0, 1, 0])] : [];
			this.addChild(this.number);
			
			this.symbol = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.WinFanSymbol);
			this.symbol.gotoAndStop((current < 0) ? 2 : 1);
			this.symbol.x = this.number.x - 25;
			this.symbol.y = 120;
			this.addChild(this.symbol);
			
			this.btnReturn = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonReturn));
			this.btnReturn.x = 80;
			this.btnReturn.y = 282;
			this.addChild(this.btnReturn);
			
			this.btnContinue = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonContinue));
			this.btnContinue.x = 230;
			this.btnContinue.y = 275;
			this.addChild(this.btnContinue);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override protected function onAddedToStage():void
		{
			this.btnReturn.addEventListener(MouseEvent.CLICK, onReturn);
			this.btnContinue.addEventListener(MouseEvent.CLICK, onContinue);
			
			this.x = (this.stage.stageWidth - this.width) / 2;
			this.y = (this.stage.stageHeight - this.height) / 2;
		}
		
		override protected function onRemovedFromStage():void
		{
			this.btnReturn.removeEventListener(MouseEvent.CLICK, onReturn);
			this.btnContinue.removeEventListener(MouseEvent.CLICK, onContinue);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onReturn(event:MouseEvent):void
		{
			this.dispatchEvent(new Event("return"));
			this.remove();
		}
		
		private function onContinue(event:MouseEvent):void
		{
			this.dispatchEvent(new Event("continue"));
			this.remove();
		}
	
	}
}
