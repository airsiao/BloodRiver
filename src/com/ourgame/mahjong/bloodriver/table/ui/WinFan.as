package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.greensock.TweenMax;
	import com.ourgame.mahjong.bloodriver.table.enum.Position;
	import com.ourgame.mahjong.bloodriver.table.enum.UITableDefinition;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DisplayElement;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.filters.ColorMatrixFilter;
	
	/**
	 * 胡牌番数
	 * @author SiaoLeon
	 */
	public class WinFan extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var symbol:MovieClip;
		
		private var number:WinFanNumber;
		
		private var unit:Bitmap;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function WinFan(position:uint, value:int)
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
			
			this.symbol = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.WinFanSymbol);
			this.symbol.gotoAndStop(value < 0 ? 2 : 1);
			this.symbol.x = 0;
			this.symbol.y = 7;
			this.addChild(this.symbol);
			
			this.number = new WinFanNumber(Math.abs(value));
			this.number.x = this.symbol.x + this.symbol.width;
			this.number.y = 0;
			this.number.scaleX = this.number.scaleY = 0.7;
			this.number.filters = value < 0 ? [new ColorMatrixFilter([0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0, 0, 0, 1, 0])] : [];
			this.addChild(this.number);
			
			this.unit = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.WinFanUnit);
			this.unit.x = this.number.x + this.number.width;
			this.unit.y = 4;
			this.unit.filters = value < 0 ? [new ColorMatrixFilter([0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0, 0, 0, 1, 0])] : [];
			this.addChild(this.unit);
			
			this.alpha = 0;
			this.show();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function show():void
		{
			TweenMax.to(this, 0.3, {alpha: 1, y: this.y - 30, onComplete: move});
		}
		
		private function move():void
		{
			TweenMax.to(this, 0.4, {alpha: 1, y: this.y - 8, onComplete: hide});
		}
		
		private function hide():void
		{
			TweenMax.to(this, 0.3, {alpha: 0, y: this.y - 18, onComplete: remove});
		}
	
	}
}
