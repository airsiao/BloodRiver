package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DisplayElement;
	
	import flash.display.MovieClip;
	
	/**
	 * 换牌面板
	 * @author SiaoLeon
	 */
	public class SwapBoard extends DisplayElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public function set count(value:uint):void
		{
			(this.content["CountTen"] as MovieClip).gotoAndStop(Math.floor(value / 10) + 1);
			(this.content["CountUnit"] as MovieClip).gotoAndStop(value % 10 + 1);
		}
		
		public function set swap(value:Vector.<Card>):void
		{
			for each (var t:Tile in this.tiles)
			{
				if (this.contains(t))
				{
					this.removeChild(t);
				}
				
				this.tiles.splice(this.tiles.indexOf(t), 1);
			}
			
			for (var i:int = 0; i < value.length; i++)
			{
				var tile:Tile = new Tile(value[i]);
				tile.width = 22.2;
				tile.height = 34.6;
				tile.x = 16 + i * 25;
				tile.y = 31;
				this.addChild(tile);
			}
		}
		
		public function set dice(value:uint):void
		{
			(this.content["Direction"] as MovieClip).gotoAndStop(Math.floor((value - 1) / 2) + 1);
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var content:MovieClip;
		
		private var tiles:Vector.<Tile>;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function SwapBoard()
		{
			super();
			
			this.x = 3;
			this.y = 20;
			
			this.content = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.SwapBoard);
			this.addChild(this.content);
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
