package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.ourgame.mahjong.bloodriver.ui.MahjongManager;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.ourgame.mahjong.bloodriver.vo.Mahjong;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.mvc.View;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	/**
	 * 桌子视图
	 * @author SiaoLeon
	 */
	public class TableView extends View
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var background:Bitmap;
		
		private var frame:MovieClip;
		
		private var logo:Bitmap;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TableView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			this.module.stage.addEventListener(MouseEvent.CLICK, onClick);
			
			this.background = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.TableBackground);
			LayerManager.instance.background.addChild(this.background);
			
			this.frame = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.TableFrame);
			this.frame.x = 216;
			this.frame.y = 102;
			LayerManager.instance.background.addChild(this.frame);
			
			this.logo = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.TableLogo);
			this.logo.x = 371;
			this.logo.y = 228;
			LayerManager.instance.background.addChild(this.logo);
			
			LayerManager.instance.background.addChild(MahjongManager.instance.winOpposite);
			LayerManager.instance.background.addChild(MahjongManager.instance.winPrev);
			
			LayerManager.instance.background.addChild(MahjongManager.instance.poolCurrent);
			LayerManager.instance.background.addChild(MahjongManager.instance.poolNext);
			
			LayerManager.instance.background.addChild(MahjongManager.instance.wall);
			
			LayerManager.instance.background.addChild(MahjongManager.instance.winCurrent);
			LayerManager.instance.background.addChild(MahjongManager.instance.winNext);
			
			LayerManager.instance.background.addChild(MahjongManager.instance.poolOpposite);
			LayerManager.instance.background.addChild(MahjongManager.instance.poolPrev);
		}
		
		override public function onRemove():void
		{
			LayerManager.instance.background.removeChild(MahjongManager.instance.poolPrev);
			LayerManager.instance.background.removeChild(MahjongManager.instance.poolOpposite);
			
			LayerManager.instance.background.removeChild(MahjongManager.instance.winNext);
			LayerManager.instance.background.removeChild(MahjongManager.instance.winCurrent);
			
			LayerManager.instance.background.removeChild(MahjongManager.instance.wall);
			
			LayerManager.instance.background.removeChild(MahjongManager.instance.poolNext);
			LayerManager.instance.background.removeChild(MahjongManager.instance.poolCurrent);
			
			LayerManager.instance.background.removeChild(MahjongManager.instance.winPrev);
			LayerManager.instance.background.removeChild(MahjongManager.instance.winOpposite);
			
			LayerManager.instance.background.removeChild(this.logo);
			this.logo = null;
			
			LayerManager.instance.background.removeChild(this.frame);
			this.frame = null;
			
			LayerManager.instance.background.removeChild(this.background);
			this.background = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onClick(event:MouseEvent):void
		{
			this.notify(TableMethod.READY);
		
			//			MahjongManager.instance.wall.init(Position.OPPOSITE, 4, 108, 0);
			//			
			//			var mj:Mahjong = new Mahjong();
			//			var list:CardList = new CardList();
			//			
			//			for (var i:int = 0; i < 4; i++)
			//			{
			//				list.add(mj.deal());
			//			}
			//			
			//			var groups:GroupList = new GroupList();
			//			groups.add(new CardGroup(MahjongFactory.instance.create(CardColor.WAN, 1, 0), MahjongFactory.instance.create(CardColor.WAN, 1, 1), MahjongFactory.instance.create(CardColor.WAN, 1, 2)));
			//			groups.add(new CardGroup(MahjongFactory.instance.create(CardColor.WAN, 1, 0), MahjongFactory.instance.create(CardColor.WAN, 1, 1), MahjongFactory.instance.create(CardColor.WAN, 1, 2)));
			//			groups.add(new CardGroup(MahjongFactory.instance.create(CardColor.WAN, 1, 0), MahjongFactory.instance.create(CardColor.WAN, 1, 1), MahjongFactory.instance.create(CardColor.WAN, 1, 2)));
			//			
			//			MahjongManager.instance.handCurrent.initGroups(groups.list);
			//			MahjongManager.instance.handCurrent.initCards(list.list);
			//			LayerManager.instance.background.addChild(MahjongManager.instance.handCurrent);
			//			
			//			MahjongManager.instance.handCurrent.enable = true;
			//			
			//			setTimeout(aaa, 3000);
			//			
			//			this.test();
		}
		
		private function aaa():void
		{
			MahjongManager.instance.handCurrent.enable = false;
		}
		
		private var mahjong:Mahjong = new Mahjong();
		
		private function test():void
		{
			if (this.mahjong.cards.length <= 0)
			{
				return;
			}
			
			setTimeout(this.test, 1500);
			
			MahjongManager.instance.wall.draw(false);
			
			var rnd:int = Math.floor(Math.random() * 4);
			var card:Card = this.mahjong.deal();
			
			switch (rnd)
			{
				case Position.CURRENT:
					MahjongManager.instance.poolCurrent.add(card);
					MahjongManager.instance.winCurrent.add(card);
					break;
				case Position.OPPOSITE:
					MahjongManager.instance.poolOpposite.add(card);
					MahjongManager.instance.winOpposite.add(card);
					break;
				case Position.NEXT:
					MahjongManager.instance.poolNext.add(card);
					MahjongManager.instance.winNext.add(card);
					break;
				case Position.PREV:
					MahjongManager.instance.poolPrev.add(card);
					MahjongManager.instance.winPrev.add(card);
					break;
			}
		}
	
	}
}
