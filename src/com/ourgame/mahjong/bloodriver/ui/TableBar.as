package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.wecoit.component.ButtonClip;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.DisplayElement;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	[Event(name="recharge", type="flash.events.Event")]
	
	/**
	 * 桌子条
	 * @author SiaoLeon
	 */
	public class TableBar extends DisplayElement
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
		
		public function set chips(value:Number):void
		{
			this.txtChip.text = value.toString();
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var background:Bitmap;
		
		private var chatBar:Bitmap;
		
		private var txtInput:TextField;
		
		private var btnSend:ButtonClip;
		
		private var btnEmote:ButtonClip;
		
		private var btnVoice:ButtonClip;
		
		private var btnSpeaker:ButtonClip;
		
		private var btnHosting:ButtonClip;
		
		private var chipBar:Bitmap;
		
		private var btnRecharge:ButtonClip;
		
		private var txtName:TextField;
		
		private var txtChip:TextField;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function TableBar()
		{
			super();
			
			this.y = 571;
			
			this.background = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.TableBar);
			this.addChild(this.background);
			
			this.chatBar = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.ChatBar);
			this.chatBar.x = 3;
			this.chatBar.y = 5;
			this.addChild(this.chatBar);
			
			this.txtInput = new TextField();
			this.txtInput.type = TextFieldType.INPUT;
			this.txtInput.defaultTextFormat = new TextFormat("simsun", 12, 0XFFFFFF);
			this.txtInput.x = 6;
			this.txtInput.y = 9;
			this.txtInput.width = 190;
			this.txtInput.height = 16;
			this.addChild(this.txtInput);
			
			this.btnSend = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonChatSend));
			this.btnSend.x = 201;
			this.btnSend.y = 6;
			this.addChild(this.btnSend);
			
			this.btnEmote = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonEmote));
			this.btnEmote.x = 234;
			this.btnEmote.y = 6;
			this.addChild(this.btnEmote);
			
			this.btnVoice = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonVoice));
			this.btnVoice.x = 256;
			this.btnVoice.y = 6;
			this.addChild(this.btnVoice);
			
			this.btnSpeaker = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonSpeaker));
			this.btnSpeaker.x = 278;
			this.btnSpeaker.y = 6;
			this.addChild(this.btnSpeaker);
			
			this.btnHosting = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonHosting));
			this.btnHosting.x = 312;
			this.btnHosting.y = 5;
			this.addChild(this.btnHosting);
			
			this.chipBar = AssetsManager.instance.getDefinitionBitmap(UITableDefinition.ChipBar);
			this.chipBar.x = 540;
			this.chipBar.y = 8;
			this.addChild(this.chipBar);
			
			this.btnRecharge = new ButtonClip(AssetsManager.instance.getDefinitionMovieClip(UITableDefinition.ButtonRecharge));
			this.btnRecharge.x = 635;
			this.btnRecharge.y = 10;
			this.addChild(this.btnRecharge);
			
			this.txtName = new TextField();
			this.txtName.defaultTextFormat = new TextFormat("simsun", 12, 0XFFFFFF);
			this.txtName.selectable = false;
			this.txtName.x = 374;
			this.txtName.y = 9;
			this.txtName.width = 160;
			this.txtName.autoSize = TextFieldAutoSize.CENTER;
			this.addChild(this.txtName);
			
			this.txtChip = new TextField();
			this.txtChip.defaultTextFormat = new TextFormat("simsun", 12, 0XFFEB00);
			this.txtChip.selectable = false;
			this.txtChip.x = 560;
			this.txtChip.y = 10;
			this.txtChip.autoSize = TextFieldAutoSize.LEFT;
			this.addChild(this.txtChip);
			
			this.btnRecharge.addEventListener(MouseEvent.CLICK, onRecharge, false, 0, true);
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onRecharge(event:MouseEvent):void
		{
			this.dispatchEvent(new Event("recharge"));
		}
	
	}
}
