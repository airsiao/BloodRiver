package com.ourgame.mahjong.bloodriver.view
{
	import com.greensock.TweenMax;
	import com.ourgame.mahjong.bloodriver.enum.UIEffectDefinition;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	/**
	 * 洗牌视图
	 * @author SiaoLeon
	 */
	public class ShuffleView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var notice:INotice;
		
		private var frame:MovieClip;
		
		private var wallBackground:MovieClip;
		
		private var wallOpen:MovieClip;
		
		private var timeout:uint;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function ShuffleView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
		
		}
		
		override public function onRemove():void
		{
			clearTimeout(this.timeout);
			
			TweenMax.killTweensOf(this.frame);
			TweenMax.killTweensOf(this.wallOpen);
			TweenMax.killTweensOf(this.wallBackground);
		}
		
		public function play(notice:INotice):void
		{
			this.notice = notice;
			
			this.frame = AssetsManager.instance.getDefinitionMovieClip(UIEffectDefinition.WallFrame);
			this.frame.x = 216;
			this.frame.y = 102;
			this.frame.alpha = 0;
			LayerManager.instance.background.addChild(this.frame);
			
			TweenMax.to(this.frame, 0.3, {alpha: 1, onComplete: onFrameComplete});
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onFrameComplete():void
		{
			this.timeout = setTimeout(showWall, 300);
		}
		
		private function showWall():void
		{
			this.wallOpen = AssetsManager.instance.getDefinitionMovieClip(UIEffectDefinition.WallOpen);
			this.wallOpen.x = 216;
			this.wallOpen.y = 102;
			this.wallOpen.addEventListener(Event.ENTER_FRAME, onWallOpen);
			LayerManager.instance.background.addChild(this.wallOpen);
		}
		
		private function onWallOpen(event:Event):void
		{
			if (this.wallOpen.currentFrame == 5)
			{
				this.wallBackground = AssetsManager.instance.getDefinitionMovieClip(UIEffectDefinition.WallBackground);
				this.wallBackground.x = 216;
				this.wallBackground.y = 102;
				LayerManager.instance.background.addChildAt(this.wallBackground, LayerManager.instance.background.getChildIndex(this.wallOpen));
			}
			
			if (this.wallOpen.currentFrame == 17)
			{
				(this.context as GameState).tiles.showWall();
			}
			
			if (this.wallOpen.currentFrame == this.wallOpen.totalFrames)
			{
				this.wallOpen.stop();
				this.wallOpen.removeEventListener(Event.ENTER_FRAME, onWallOpen);
				TweenMax.to(this.wallOpen, 1, {alpha: 0, onComplete: onWallComplete});
				TweenMax.to(this.wallBackground, 1, {alpha: 0});
				TweenMax.to(this.frame, 1, {alpha: 0});
			}
		}
		
		private function onWallComplete():void
		{
			LayerManager.instance.background.removeChild(this.wallBackground);
			LayerManager.instance.background.removeChild(this.wallOpen);
			LayerManager.instance.background.removeChild(this.frame);
			
			this.notice.complete();
		}
	
	}
}
