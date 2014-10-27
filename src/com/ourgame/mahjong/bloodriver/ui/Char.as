package com.ourgame.mahjong.bloodriver.ui
{
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.display.LayoutElement;
	
	import flash.display.Bitmap;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * 角色
	 * @author SiaoLeon
	 */
	public class Char extends LayoutElement
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
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var chipBar:Bitmap;
		
		private var txtName:TextField;
		
		private var txtChip:TextField;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function Char(position:uint)
		{
			super();
			
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
					break;
				case Position.NEXT:
					this.width = 130;
					this.height = 180;
					this.x = 830;
					this.y = 180;
					this.txtName.x = 10;
					this.txtName.y = 0;
					break;
				case Position.OPPOSITE:
					this.width = 220;
					this.height = 120;
					this.x = 680;
					this.y = 0;
					this.txtName.x = 110;
					this.txtName.y = 6;
					break;
				case Position.PREV:
					this.width = 130;
					this.height = 180;
					this.x = 0;
					this.y = 180;
					this.txtName.x = 10;
					this.txtName.y = 0;
					break;
			}
			
			this.txtChip.x = this.txtName.x + 20;
			this.txtChip.y = this.txtName.y + 22;
			
			this.chipBar.x = this.txtName.x;
			this.chipBar.y = this.txtName.y + 20;
			
			this.draw(0XFF0000, 0.2);
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
