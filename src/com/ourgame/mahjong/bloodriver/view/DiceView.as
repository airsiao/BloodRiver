package com.ourgame.mahjong.bloodriver.view
{
	import com.greensock.TweenMax;
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.enum.UIEffectDefinition;
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * 发牌骰子视图
	 * @author SiaoLeon
	 */
	public class DiceView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var notice:INotice;
		
		private var dealMotion:MovieClip;
		
		private var swapMotion:MovieClip;
		
		private var dice:MovieClip;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function DiceView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.dealMotion = AssetsManager.instance.getDefinitionMovieClip(UIEffectDefinition.DealDiceMotion);
			this.dealMotion.gotoAndStop(1);
			this.dealMotion.visible = false;
			this.dealMotion.x = 276;
			this.dealMotion.y = 115;
			LayerManager.instance.foreground.addChild(this.dealMotion);
			
			this.swapMotion = AssetsManager.instance.getDefinitionMovieClip(UIEffectDefinition.SwapDiceMotion);
			this.swapMotion.gotoAndStop(1);
			this.swapMotion.visible = false;
			this.swapMotion.x = 276;
			this.swapMotion.y = 115;
			LayerManager.instance.foreground.addChild(this.swapMotion);
			
			this.dice = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.Dice);
			this.dice.visible = false;
			LayerManager.instance.foreground.addChild(this.dice);
		}
		
		override public function onRemove():void
		{
			this.dealMotion.removeEventListener(Event.ENTER_FRAME, onDealMotion);
			this.swapMotion.removeEventListener(Event.ENTER_FRAME, onSwapMotion);
			
			TweenMax.killTweensOf(this.dice);
			
			LayerManager.instance.foreground.removeChild(this.dealMotion);
			this.dealMotion = null;
			
			LayerManager.instance.foreground.removeChild(this.swapMotion);
			this.swapMotion = null;
		}
		
		public function deal(notice:INotice):void
		{
			this.notice = notice;
			
			var dealer:uint = (this.module as BloodRiver).info.data.table.getSeatPosition(GameData.currentGame.dealer);
			var dice:uint = 0;
			
			for each (var point:uint in GameData.currentGame.dealDice)
			{
				dice += point;
			}
			
			(this.context as GameState).tiles.wall.init(dealer, dice);
			
			this.dealMotion.addEventListener(Event.ENTER_FRAME, onDealMotion);
			this.dealMotion.visible = true;
			this.dealMotion.gotoAndPlay(1);
		}
		
		public function swap(notice:INotice):void
		{
			this.notice = notice;
			
			this.dice.visible = false;
			
			this.swapMotion.addEventListener(Event.ENTER_FRAME, onSwapMotion);
			this.swapMotion.visible = true;
			this.swapMotion.gotoAndPlay(1);
		}
		
		public function hide():void
		{
			TweenMax.to(this.dice, 0.2, {alpha: 0, onComplete: onHideComplete});
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onDealMotion(event:Event):void
		{
			if (this.dealMotion.currentFrame == this.dealMotion.totalFrames)
			{
				this.dealMotion.removeEventListener(Event.ENTER_FRAME, onDealMotion);
				this.dealMotion.stop();
				this.dealMotion.visible = false;
				
				this.dice.gotoAndStop(GameData.currentGame.dealDice[0]);
				this.dice.x = 493;
				this.dice.y = 257;
				this.dice.rotation = -35;
				this.dice.visible = true;
				TweenMax.to(this.dice, 0.1, {x: 494.5, y: 252, rotation: -24.8, onComplete: onShowDiceComplete});
			}
		}
		
		private function onShowDiceComplete():void
		{
			this.dice.x = 494;
			this.dice.y = 253;
			this.dice.rotation = -26.3;
			
			this.notice.complete();
		}
		
		private function onSwapMotion(event:Event):void
		{
			if (this.swapMotion.currentFrame == this.swapMotion.totalFrames)
			{
				this.swapMotion.removeEventListener(Event.ENTER_FRAME, onSwapMotion);
				this.swapMotion.stop();
				this.swapMotion.visible = false;
				
				this.dice.gotoAndStop(GameData.currentGame.swapDice[0]);
				this.dice.x = 368;
				this.dice.y = 235;
				this.dice.rotation = -16.3;
				this.dice.visible = true;
				
				this.notice.complete();
			}
		}
		
		private function onHideComplete():void
		{
			this.dice.visible = false;
			this.dice.alpha = 1;
		}
	
	}
}
