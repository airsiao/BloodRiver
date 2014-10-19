package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.data.GameData;
	import com.ourgame.mahjong.bloodriver.state.GameState;
	import com.ourgame.mahjong.bloodriver.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.utils.setTimeout;
	
	/**
	 * 换牌视图
	 * @author SiaoLeon
	 */
	public class SwapCardsView extends View
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
		public function SwapCardsView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function outCards(notice:INotice):void
		{
			var hand:TilesHand = (this.context as GameState).tiles.handCurrent;
			
			for each (var card:Card in GameData.currentGame.swapOut)
			{
				hand.removeCard(card);
			}
			
			notice.complete();
		}
		
		public function inCards(notice:INotice):void
		{
			var hand:TilesHand = (this.context as GameState).tiles.handCurrent;
			
			for each (var card:Card in GameData.currentGame.swapIn)
			{
				hand.addCard(card);
			}
			
			hand.resetTiles();
			
			setTimeout(this.sort, 3000, notice);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function sort(notice:INotice):void
		{
			(this.context as GameState).tiles.handCurrent.sort();
			
			notice.complete();
		}
	
	}
}
