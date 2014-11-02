package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.CardGroupType;
	import com.ourgame.mahjong.bloodriver.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.ourgame.mahjong.bloodriver.vo.CardGroup;
	import com.wecoit.display.DisplayElement;
	
	/**
	 * 牌组
	 * @author SiaoLeon
	 */
	public class TilesGroup extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TilesGroup(position:uint, group:CardGroup)
		{
			super();
			
			this.mouseChildren = false;
			
			for (var i:int = 0; i < group.cards.length; i++)
			{
				var card:Card = group.cards[i];
				var tile:Tile = new Tile(card, position, (group.type == CardGroupType.GANG_AN && i < group.cards.length - 1) ? CardStatus.HIDE : CardStatus.SHOW);
				var index:uint = i;
				
				switch (position)
				{
					case Position.CURRENT:
						tile.x = (i < 3) ? 56 * i : 56;
						tile.y = (i < 3) ? 0 : -22;
						break;
					case Position.OPPOSITE:
						tile.x = (i < 3) ? 30 * i : 30;
						tile.y = (i < 3) ? 0 : -11;
						break;
					case Position.PREV:
						tile.x = 0;
						tile.y = (i < 3) ? 22 * i : 14;
						break;
					case Position.NEXT:
						tile.x = 0;
						tile.y = (i < 3) ? 22 * (2 - i) : 14;
						index = (i < 3) ? 0 : i;
						break;
				}
				
				this.addChildAt(tile, (index < 3) ? index : 2);
			}
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
