package com.ourgame.mahjong.bloodriver.ui
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Strong;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DisplayElement;
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * 倒计时
	 * @author SiaoLeon
	 */
	public class CountDown extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public function set position(value:int):void
		{
			switch (value)
			{
				case Position.CURRENT:
					this.content.gotoAndStop(5);
					break;
				case Position.OPPOSITE:
					this.content.gotoAndStop(3);
					break;
				case Position.PREV:
					this.content.gotoAndStop(4);
					break;
				case Position.NEXT:
					this.content.gotoAndStop(2);
					break;
				default:
					this.content.gotoAndStop(1);
					break;
			}
		}
		
		private var _current:uint;
		
		public function get current():uint
		{
			return this._current;
		}
		
		public function set current(value:uint):void
		{
			this._current = value;
			
			TweenMax.killTweensOf(this.content["Count"]);
			(this.content["Count"] as MovieClip).scaleX = 1;
			(this.content["Count"] as MovieClip).scaleY = 1;
			
			(this.content["Count"]["CountTen"] as MovieClip).gotoAndStop(Math.floor(value / 10) + 1);
			(this.content["Count"]["CountUnit"] as MovieClip).gotoAndStop(value % 10 + 1);
		}
		
		public function set timeout(value:uint):void
		{
			if (value > 0)
			{
				this.timer.repeatCount = value;
				this.timer.reset();
				this.timer.start();
			}
			else
			{
				this.timer.stop();
			}
			
			this.current = value;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var content:MovieClip;
		
		private var timer:Timer;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function CountDown()
		{
			super();
			
			this.x = 438;
			this.y = 224;
			
			this.content = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.CountDown);
			this.content.gotoAndStop(1);
			this.addChild(this.content);
			
			this.current = 0;
			
			this.timer = new Timer(1000);
			this.timer.addEventListener(TimerEvent.TIMER, onTimer, false, 0, true);
			this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete, false, 0, true);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function zoomIn():void
		{
			TweenMax.to(this.content["Count"], 0.3, {scaleX: 1.2, scaleY: 1.2, ease: Strong.easeOut, onComplete: zoomOut});
		}
		
		private function zoomOut():void
		{
			TweenMax.to(this.content["Count"], 0.3, {scaleX: 1, scaleY: 1, ease: Strong.easeOut});
		}
		
		private function onTimer(event:TimerEvent=null):void
		{
			this.current--;
			
			if (this.timer.repeatCount - this.timer.currentCount <= 5)
			{
				this.zoomIn();
			}
		}
		
		private function onTimerComplete(event:TimerEvent=null):void
		{
			this.current = 0;
		}
	
	}
}
