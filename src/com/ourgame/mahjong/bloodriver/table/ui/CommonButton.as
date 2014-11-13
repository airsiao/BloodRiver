package com.ourgame.mahjong.bloodriver.table.ui
{
	import com.wecoit.component.StateButton;
	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * 通用按钮
	 * @author SiaoLeon
	 */
	public class CommonButton extends StateButton
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		private var txtLabel:TextField;
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function CommonButton(label:String, width:Number=100, height:Number=30, textColor:uint=0XFFFFFF, backgroundColor:uint=0X000000, backgroundAlpha:Number=1.0)
		{
			super();
			
			this.buttonMode = true;
			this.width = width;
			this.height = height;
			
			this.txtLabel = new TextField();
			this.txtLabel.defaultTextFormat = new TextFormat("simsun", 12, textColor, null, null, null, null, null, TextFormatAlign.CENTER);
			this.txtLabel.selectable = false;
			this.txtLabel.mouseEnabled = false;
			this.txtLabel.autoSize = TextFieldAutoSize.CENTER;
			this.txtLabel.text = label;
			this.txtLabel.x = (this.width - this.txtLabel.width) / 2;
			this.txtLabel.y = (this.height - this.txtLabel.height) / 2;
			this.addChild(this.txtLabel);
			
			this.draw(backgroundColor, backgroundAlpha);
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
