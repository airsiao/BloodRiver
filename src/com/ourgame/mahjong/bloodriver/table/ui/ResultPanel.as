package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.ourgame.mahjong.bloodriver.table.data.GameData;
	import com.ourgame.mahjong.bloodriver.table.enum.ResultStatus;
	import com.ourgame.mahjong.bloodriver.table.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.table.vo.ResultRecord;
	import com.wecoit.component.ButtonClip;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DragElement;
	
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
	public class ResultPanel extends DragElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		override public function get width():Number
		{
			return 457;
		}
		
		override public function get height():Number
		{
			return 505;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var win:int;
		
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
			
			this.win = fan[GameData.currentPlayer.user.seat];
			
			this.content = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.Result);
			this.content.gotoAndStop((this.win < 0) ? 3 : (this.win > 0) ? 1 : 2);
			this.addChild(this.content);
			
			(this.content["flag"] as MovieClip).visible = (GameData.currentPlayer.result.status != ResultStatus.NORMAL);
			(this.content["flag"] as MovieClip).gotoAndStop((GameData.currentPlayer.result.status == ResultStatus.UNTING) ? 1 : 2);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override protected function onAddedToStage():void
		{
			this.number = new WinFanNumber(Math.abs(this.win));
			this.number.x = 323 - this.number.width;
			this.number.y = 135;
			this.number.filters = this.win < 0 ? [new ColorMatrixFilter([0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0, 0, 0, 1, 0])] : [];
			this.addChild(this.number);
			
			this.symbol = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.WinFanSymbol);
			this.symbol.gotoAndStop((this.win < 0) ? 2 : 1);
			this.symbol.x = this.number.x - 25;
			this.symbol.y = 150;
			this.addChild(this.symbol);
			
			this.btnReturn = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonReturn));
			this.btnReturn.x = 80;
			this.btnReturn.y = 312;
			this.addChild(this.btnReturn);
			
			this.btnContinue = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonContinue));
			this.btnContinue.x = 230;
			this.btnContinue.y = 305;
			this.addChild(this.btnContinue);
			
			this.btnReturn.addEventListener(MouseEvent.CLICK, onReturn);
			this.btnContinue.addEventListener(MouseEvent.CLICK, onContinue);
			
			this.x = (this.stage.stageWidth - this.width) / 2 - 20;
			this.y = (this.stage.stageHeight - this.height) / 2;
		}
		
		override protected function onRemovedFromStage():void
		{
			this.btnReturn.removeEventListener(MouseEvent.CLICK, onReturn);
			this.btnContinue.removeEventListener(MouseEvent.CLICK, onContinue);
			
			this.removeChild(this.number);
			this.number = null;
			
			this.removeChild(this.symbol);
			this.symbol = null;
			
			this.removeChild(this.btnReturn);
			this.btnReturn = null;
			
			this.removeChild(this.btnContinue);
			this.btnContinue = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onReturn(event:MouseEvent):void
		{
			this.remove();
			this.dispatchEvent(new Event("return"));
		}
		
		private function onContinue(event:MouseEvent):void
		{
			this.remove();
			this.dispatchEvent(new Event("continue"));
		}
	
	}
}
