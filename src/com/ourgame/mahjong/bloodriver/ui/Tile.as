package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.CardColor;
	import com.ourgame.mahjong.bloodriver.enum.CardStatus;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.vo.Card;
	import com.ourgame.mahjong.bloodriver.vo.TingInfo;
	import com.wecoit.core.AssetsManager;
	
	import flash.display.Bitmap;
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
		
		override public function get width():Number
		{
			return this.display.width;
		}
		
		override public function get height():Number
		{
			return this.display.height;
		}
		
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
		
		public function set select(value:Boolean):void
		{
			this.buttonMode = value;
			
			this.display.y = (value || this.confirm) ? -7 : 0;
			this.light.y = (value || this.confirm) ? 4 - 7 : 4;
			this.ting.y = (value || this.confirm) ? 6 - 7 : 6;
		}
		
		private var _confirm:Boolean;
		
		public function get confirm():Boolean
		{
			return this._confirm;
		}
		
		public function set confirm(value:Boolean):void
		{
			this._confirm = value;
			
			this.alpha = (value) ? 0.8 : 1;
		}
		
		private var _tingInfo:TingInfo;
		
		public function get tingInfo():TingInfo
		{
			return this._tingInfo;
		}
		
		public function set tingInfo(value:TingInfo):void
		{
			this._tingInfo = value;
			
			this.ting.visible = (value != null);
			this.light.visible = (value != null);
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var display:MovieClip;
		
		private var light:MovieClip;
		
		private var ting:Bitmap;
		
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
			
			this.light = AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.TileTingMask);
			this.light.x = 2;
			this.light.y = 4;
			this.light.visible = false;
			this.addChild(this.light);
			
			this.ting = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.Ting);
			this.ting.x = 32;
			this.ting.y = 6;
			this.ting.visible = false;
			this.addChild(this.ting);
			
			this.hotArea = new Sprite();
			this.hotArea.graphics.beginFill(0XFFFFFF, 0);
			this.hotArea.graphics.drawRect(0, 0, 1, 1);
			this.hotArea.graphics.endFill();
			this.addChild(this.hotArea);
			
			this.draw();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function toString():String
		{
			return (this.card == null) ? "未知" : this.card.toString();
		}
		
		public function draw():void
		{
			if (this.display != null && this.contains(this.display))
			{
				this.removeChild(this.display);
				this.display = null;
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
					instance += "Prev";
					break;
				case Position.NEXT:
					instance += "Next";
					break;
			}
			
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
			
			this.display = AssetsManager.instance.getDefinitionMovieClip(instance + this.status);
			this.display.gotoAndStop(frame);
			this.addChildAt(this.display, 0);
			
			this.hotArea.width = this.display.width;
			this.hotArea.height = this.display.height;
		}
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
