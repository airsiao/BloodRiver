package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.ourgame.mahjong.bloodriver.table.enum.Position;
	import com.ourgame.mahjong.bloodriver.table.enum.UIRoleDefinition;
	import com.ourgame.mahjong.bloodriver.table.enum.UITableDefinition;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.LayoutElement;
	import com.wecoit.mvc.core.INotice;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * 角色
	 * @author SiaoLeon
	 */
	public class Role extends LayoutElement
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		public function set nickname(value:String):void
		{
			this.txtName.text = value;
		}
		
		public function set chip(value:Number):void
		{
			this.txtChip.text = value.toString();
		}
		
		private var _avatar:String;
		
		public function get avatar():String
		{
			return this._avatar;
		}
		
		public function set avatar(value:String):void
		{
			if (this.avatar == value)
			{
				return;
			}
			
			this._avatar = value;
			
			if (this.display != null)
			{
				this.removeChild(this.display);
				this.display = null;
			}
			
			var instance:String = UIRoleDefinition.Pirate;
			
			if (position == Position.CURRENT)
			{
				instance += "Current";
			}
			
			this.display = AssetsManager.instance.getDefinitionMovieClip(instance);
			
			switch (this.position)
			{
				case Position.CURRENT:
					this.display.rotation = 0;
					this.display.x = this.width / 2 + 15;
					this.display.y = this.height - 20;
					break;
				case Position.OPPOSITE:
					this.display.rotation = 45;
					this.display.x = 60;
					this.display.y = this.height / 2 + 10;
					break;
				case Position.NEXT:
					this.display.rotation = 90;
					this.display.x = this.width / 2 - 10;
					this.display.y = this.height / 2 + 30;
					break;
				case Position.PREV:
					this.display.rotation = 270;
					this.display.x = this.width / 2 + 10;
					this.display.y = this.height / 2 + 10;
					break;
			}
			
			this.addChildAt(this.display, 0);
			
			this.normal();
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var notice:INotice;
		
		private var display:MovieClip;
		
		private var dealer:MovieClip;
		
		private var position:uint;
		
		private var chipBar:Bitmap;
		
		private var txtName:TextField;
		
		private var txtChip:TextField;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function Role(position:uint)
		{
			super();
			
			this.position = position;
			
			this.chipBar = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.ChipBar);
			this.addChild(this.chipBar);
			
			this.txtName = new TextField();
			this.txtName.defaultTextFormat = new TextFormat("simsun", 12, 0XFFFFFF);
			this.txtName.autoSize = TextFieldAutoSize.LEFT;
			this.txtName.selectable = false;
			this.addChild(this.txtName);
			
			this.txtChip = new TextField();
			this.txtChip.defaultTextFormat = new TextFormat("simsun", 12, 0XFFEB00);
			this.txtChip.selectable = false;
			this.txtChip.autoSize = TextFieldAutoSize.LEFT;
			this.addChild(this.txtChip);
			
			this.dealer = AssetsManager.instance.getDefinitionMovieClip(UIRoleDefinition.Dealer);
			this.dealer.visible = false;
			this.dealer.stop();
			this.addChild(this.dealer);
			
			switch (position)
			{
				case Position.CURRENT:
					this.width = 130;
					this.height = 180;
					this.x = 0;
					this.y = 410;
					this.txtName.x = 10;
					this.txtName.y = 0;
					this.chipBar.visible = false;
					this.txtName.visible = false;
					this.txtChip.visible = false;
					this.dealer.x = 110;
					this.dealer.y = 168;
					break;
				case Position.NEXT:
					this.width = 130;
					this.height = 180;
					this.x = 830;
					this.y = 180;
					this.txtName.x = 10;
					this.txtName.y = 0;
					this.dealer.x = 10;
					this.dealer.y = 180;
					break;
				case Position.OPPOSITE:
					this.width = 220;
					this.height = 120;
					this.x = 680;
					this.y = 0;
					this.txtName.x = 110;
					this.txtName.y = 6;
					this.dealer.x = 10;
					this.dealer.y = 130;
					break;
				case Position.PREV:
					this.width = 130;
					this.height = 180;
					this.x = 0;
					this.y = 180;
					this.txtName.x = 30;
					this.txtName.y = 0;
					this.dealer.x = 120;
					this.dealer.y = 160;
					break;
			}
			
			this.txtChip.x = this.txtName.x + 20;
			this.txtChip.y = this.txtName.y + 22;
			
			this.chipBar.x = this.txtName.x;
			this.chipBar.y = this.txtName.y + 20;
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function normal():void
		{
			this.display.gotoAndStop(2);
			(this.display["content"] as MovieClip).play();
		}
		
		public function sitdown():void
		{
			this.display.gotoAndStop(1);
			(this.display["content"] as MovieClip).addEventListener(Event.ENTER_FRAME, onEnterFrame);
			(this.display["content"] as MovieClip).play();
		}
		
		public function play():void
		{
			this.display.gotoAndStop(3);
			(this.display["content"] as MovieClip).play();
		}
		
		public function hosting(value:Boolean):void
		{
			this.display.gotoAndStop((value) ? 4 : 5);
			(this.display["content"] as MovieClip).play();
		}
		
		public function light():void
		{
			this.display.gotoAndStop(6);
			(this.display["content"] as MovieClip).addEventListener(Event.ENTER_FRAME, onEnterFrame);
			(this.display["content"] as MovieClip).play();
		}
		
		public function kill():void
		{
			this.display.gotoAndStop(7);
			(this.display["content"] as MovieClip).addEventListener(Event.ENTER_FRAME, onEnterFrame);
			(this.display["content"] as MovieClip).play();
		}
		
		public function showDealer(notice:INotice):void
		{
			this.notice = notice;
			
			this.dealer.addEventListener(Event.ENTER_FRAME, onDealerEnterFrame);
			this.dealer.visible = true;
			this.dealer.gotoAndPlay(1);
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onDealerEnterFrame(event:Event):void
		{
			if (this.dealer.currentFrame == this.dealer.totalFrames)
			{
				this.dealer.removeEventListener(Event.ENTER_FRAME, onDealerEnterFrame);
				this.dealer.gotoAndStop(this.dealer.totalFrames);
				this.notice.complete();
			}
		}
		
		private function onEnterFrame(event:Event):void
		{
			var frame:uint = (this.position == Position.NEXT) ? 1 : (this.position == Position.PREV) ? 2 : 3;
			
			if ((this.display["content"]["part"] as MovieClip) != null && (this.display["content"]["part"] as MovieClip).currentFrame != frame)
			{
				(this.display["content"]["part"] as MovieClip).gotoAndStop(frame);
			}
			
			if ((this.display["content"] as MovieClip).currentFrame == (this.display["content"] as MovieClip).totalFrames)
			{
				(this.display["content"] as MovieClip).removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				this.normal();
			}
		}
	
	}
}
