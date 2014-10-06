package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.CardColor;
	import com.ourgame.mahjong.bloodriver.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.wecoit.core.AssetsManager;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * 一张麻将牌
	 * @author SiaoLeon
	 */
	public class Tile extends Sprite
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _card:Card;
		
		public function get card():Card
		{
			return this._card;
		}
		
		public function set card(value:Card):void
		{
			this._card = value;
			
			this.draw();
		}
		
		private var _position:uint;
		
		public function get position():uint
		{
			return this._position;
		}
		
		public function set position(value:uint):void
		{
			this._position = value;
			
			this.draw();
		}
		
		private var _status:String;
		
		public function get status():String
		{
			return this._status;
		}
		
		public function set status(value:String):void
		{
			this._status = value;
			
			this.draw();
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var display:MovieClip;
		
		private var hotArea:Sprite;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function Tile(card:Card=null, position:uint=Position.CURRENT, status:String=CardStatus.STAND)
		{
			super();
			
			this.mouseChildren = false;
			
			this._card = card;
			this._position = position;
			this._status = status;
			
			this.hotArea = new Sprite();
			this.hotArea.graphics.beginFill(0XFFFFFF, 0);
			this.hotArea.graphics.drawRect(0, 0, 1, 1);
			this.hotArea.graphics.endFill();
			this.addChild(this.hotArea);
			
			this.draw();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function draw():void
		{
			if (this.display != null && this.contains(this.display))
			{
				this.removeChild(this.display);
				this.display = null;
			}
			
			if (this.position == Position.NEXT || this.position == Position.PREV)
			{
				if (this.status == CardStatus.POOL)
				{
					this._status = CardStatus.SHOW;
				}
				
				if (this.status == CardStatus.HIDE || this.status == CardStatus.WALL)
				{
					this._status = CardStatus.HIDE;
				}
			}
			
			var instance:String = UITableDefinition.Card;
			
			switch (this.position)
			{
				case Position.CURRENT:
					instance += "Current";
					break;
				case Position.OPPOSITE:
					instance += "Opposite";
					break;
				case Position.PREV:
					instance += (this.status == CardStatus.HIDE) ? "Horizontal" : "Prev";
					break;
				case Position.NEXT:
					instance += (this.status == CardStatus.HIDE) ? "Horizontal" : "Next";
					break;
			}
			
			this.display = AssetsManager.instance.getDefinitionMovieClip(instance + this.status);
			
			var frame:uint = 1;
			
			if (this.status != CardStatus.HIDE && this.status != CardStatus.WALL && this.card != null)
			{
				switch (this.card.color)
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
				
				frame += this.card.point;
			}
			
			if (this.display == null)
			{
				return;
			}
			
			this.display.gotoAndStop(frame);
			this.addChild(this.display);
			
			this.hotArea.width = this.display.width;
			this.hotArea.height = this.display.height;
		}
		
		public function set select(value:Boolean):void
		{
			this.buttonMode = value;
			this.display.y = value ? -20 : 0;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
