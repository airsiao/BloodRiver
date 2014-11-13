package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.ourgame.mahjong.bloodriver.table.enum.CardColor;
	import com.ourgame.mahjong.bloodriver.table.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.table.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DisplayElement;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.filters.ColorMatrixFilter;
	
	/**
	 * 听牌
	 * @author SiaoLeon
	 */
	public class TileTing extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var fanBackgrond:Bitmap;
		
		private var fanTen:MovieClip;
		
		private var fanUnit:MovieClip;
		
		private var fanText:Bitmap;
		
		private var count:MovieClip;
		
		private var tile:MovieClip;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TileTing(card:Card, fan:uint, remain:uint)
		{
			super();
			
			var frame:uint = 1;
			
			switch (card.color)
			{
				case CardColor.WAN:
					frame = 0;
					break;
				case CardColor.BING:
					frame = 9;
					break;
				case CardColor.TIAO:
					frame = 18;
					break;
			}
			
			frame += card.point;
			
			this.tile = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.Card + "Current" + CardStatus.STAND);
			this.tile.scaleX = this.tile.scaleY = 0.8;
			this.tile.gotoAndStop(frame);
			this.addChild(this.tile);
			
			this.fanBackgrond = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.TingFanBackground);
			this.fanBackgrond.y = -10;
			this.fanBackgrond.x = 32;
			this.addChild(this.fanBackgrond);
			
			this.fanTen = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.TingNumber);
			this.fanTen.scaleX = this.fanTen.scaleY = 0.7;
			this.fanTen.filters = [new ColorMatrixFilter([-0.526790737597869, 0.803128635904193, 0.723662101693675, 0, 0, 0.468086094569517, 0.586667599067207, -0.0547536936367243, 0, 0, -0.129706382438964, 1.72231491775594, -0.592608535316981, 0, 0, 0, 0, 0, 1, 0])];
			this.fanTen.rotationX = 7.6;
			this.fanTen.x = 30;
			this.fanTen.y = -2;
			this.fanTen.gotoAndStop(Math.floor(fan / 10) + 1);
			this.fanTen.visible = (fan > 9);
			this.addChild(this.fanTen);
			
			this.fanUnit = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.TingNumber);
			this.fanUnit.scaleX = this.fanUnit.scaleY = 0.7;
			this.fanUnit.filters = [new ColorMatrixFilter([-0.526790737597869, 0.803128635904193, 0.723662101693675, 0, 0, 0.468086094569517, 0.586667599067207, -0.0547536936367243, 0, 0, -0.129706382438964, 1.72231491775594, -0.592608535316981, 0, 0, 0, 0, 0, 1, 0])];
			this.fanUnit.x = (fan > 9) ? 42 : 36;
			this.fanUnit.y = -2;
			this.fanUnit.gotoAndStop(fan % 10 + 1);
			this.addChild(this.fanUnit);
			
			this.fanText = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.TingFan);
			this.fanText.x = (fan > 9) ? 54 : 48;
			this.fanText.y = 4;
			this.addChild(this.fanText);
			
			this.count = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.TingNumber);
			this.count.x = 36;
			this.count.y = 42;
			this.count.gotoAndStop(remain + 1);
			this.addChild(this.count);
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
