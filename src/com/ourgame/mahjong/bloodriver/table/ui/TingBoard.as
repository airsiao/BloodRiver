package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.ourgame.mahjong.bloodriver.table.data.GameData;
	import com.ourgame.mahjong.bloodriver.table.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.table.utils.compareCardByID;
	import com.ourgame.mahjong.bloodriver.table.vo.Card;
	import com.ourgame.mahjong.bloodriver.table.vo.TingInfo;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DisplayElement;
	
	import flash.display.Bitmap;
	
	/**
	 * 听牌面板
	 * @author SiaoLeon
	 */
	public class TingBoard extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var background:Bitmap;
		
		private var cards:Vector.<TileTing>;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TingBoard()
		{
			super();
			
			this.x = 147;
			this.y = 375;
			
			this.cards = new Vector.<TileTing>();
			
			this.background = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.TingBackground);
			this.addChild(this.background);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function show(info:TingInfo):void
		{
			while (this.cards.length > 0)
			{
				var ting:TileTing = this.cards.pop();
				
				if (this.contains(ting))
				{
					this.removeChild(ting);
				}
			}
			
			this.visible = (info != null);
			
			if (!this.visible)
			{
				return;
			}
			
			var index:uint = 0;
			var offset:Number = (this.background.width - 70 * info.tings.size) / 2;
			
			var keys:Array = info.tings.keys;
			keys.sort(compareCardByID);
			
			for each (var card:Card in keys)
			{
				var fan:uint = info.tings.getValue(card);
				var tile:TileTing = new TileTing(card, fan, GameData.currentGame.mahjong.getCards(card.color, card.point).length);
				tile.x = offset + index * 70;
				tile.y = 16;
				this.cards.push(tile);
				this.addChild(tile);
				index++;
			}
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
