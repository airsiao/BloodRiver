package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.enum.UIEffectDefinition;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DisplayElement;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	[Event(name="complete", type="flash.events.Event")]
	
	/**
	 * 动作动画特效
	 * @author SiaoLeon
	 */
	public class ActionEffect extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		public static const PENG:String = "peng";
		
		public static const GANG:String = "gang";
		
		public static const HU:String = "hu";
		
		public static const ZIMO:String = "zimo";
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var motion:MovieClip;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function ActionEffect(position:uint, action:String)
		{
			super();
			
			switch (position)
			{
				case Position.CURRENT:
					this.x = 490;
					this.y = 415;
					break;
				case Position.OPPOSITE:
					this.x = 490;
					this.y = 125;
					break;
				case Position.NEXT:
					this.x = 740;
					this.y = 265;
					break;
				case Position.PREV:
					this.x = 245;
					this.y = 265;
					break;
			}
			
			switch (action)
			{
				case ActionEffect.PENG:
					this.motion = AssetsManager.instance.getDefinitionMovieClip(UIEffectDefinition.Peng);
					break;
				case ActionEffect.GANG:
					this.motion = AssetsManager.instance.getDefinitionMovieClip(UIEffectDefinition.Gang);
					break;
				case ActionEffect.HU:
					this.motion = AssetsManager.instance.getDefinitionMovieClip(UIEffectDefinition.Hu);
					break;
				case ActionEffect.ZIMO:
					this.motion = AssetsManager.instance.getDefinitionMovieClip(UIEffectDefinition.Zimo);
					break;
			}
			
			this.motion.gotoAndStop(1);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override protected function onAddedToStage():void
		{
			this.motion.gotoAndPlay(1);
			this.addChild(this.motion);
			this.motion.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		override protected function onRemovedFromStage():void
		{
			this.clear();
			
			this.motion.stop();
			this.motion.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onEnterFrame(event:Event):void
		{
			if (this.motion.currentFrame == this.motion.totalFrames)
			{
				this.dispatchEvent(new Event(Event.COMPLETE));
				this.remove();
			}
		}
	
	}
}
