package com.ourgame.mahjong.bloodriver.table.view
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.table.data.GameData;
	import com.ourgame.mahjong.bloodriver.table.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.table.enum.Position;
	import com.ourgame.mahjong.bloodriver.table.state.GameState;
	import com.ourgame.mahjong.bloodriver.table.ui.TableLayer;
	import com.ourgame.mahjong.bloodriver.table.ui.TilesHand;
	import com.ourgame.mahjong.bloodriver.table.ui.WinFan;
	import com.ourgame.mahjong.bloodriver.table.vo.GamePlayer;
	import com.ourgame.mahjong.bloodriver.table.vo.ResultInfo;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.utils.setTimeout;
	
	/**
	 * 查牌视图
	 * @author SiaoLeon
	 */
	public class ShowCardView extends View
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
		public function ShowCardView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function play(notice:INotice):void
		{
			var results:Vector.<ResultInfo> = notice.params;
			
			for (var i:int = 0; i < results.length; i++)
			{
				var result:ResultInfo = results[i];
				var player:GamePlayer = GameData.currentGame.playerList.element(i);
				var position:uint = CommonData.table.getSeatPosition(i);
				var hand:TilesHand = null;
				
				switch (position)
				{
					case Position.CURRENT:
						hand = (this.context as GameState).tiles.handCurrent;
						break;
					case Position.NEXT:
						hand = (this.context as GameState).tiles.handNext;
						break;
					case Position.OPPOSITE:
						hand = (this.context as GameState).tiles.handOpposite;
						break;
					case Position.PREV:
						hand = (this.context as GameState).tiles.handPrev;
						break;
				}
				
				hand.init(player.handCards);
				hand.status = CardStatus.SHOW;
				
				if (result.fan != 0)
				{
					TableLayer.instance.tile.addChild(new WinFan(position, result.fan));
				}
			}
			
			setTimeout(notice.complete, 3000);
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}