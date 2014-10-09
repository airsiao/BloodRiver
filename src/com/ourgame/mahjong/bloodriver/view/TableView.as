package com.ourgame.mahjong.bloodriver.view
{
	import com.ourgame.mahjong.bloodriver.BloodRiver;
	import com.ourgame.mahjong.bloodriver.enum.Position;
	import com.ourgame.mahjong.bloodriver.enum.UITableDefinition;
	import com.ourgame.mahjong.bloodriver.ui.Char;
	import com.ourgame.mahjong.bloodriver.ui.LayerManager;
	import com.ourgame.mahjong.libaray.vo.UserInfo;
	import com.wecoit.core.AssetsManager;
	import com.wecoit.data.ArrayList;
	import com.wecoit.mvc.View;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	
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
		
		public var charCurrent:Char;
		
		public var charNext:Char;
		
		public var charOpposite:Char;
		
		public var charPrev:Char;
		
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
			
			this.charCurrent = new Char(Position.CURRENT);
			LayerManager.instance.background.addChild(this.charCurrent);
			
			this.charNext = new Char(Position.NEXT);
			LayerManager.instance.background.addChild(this.charNext);
			
			this.charOpposite = new Char(Position.OPPOSITE);
			LayerManager.instance.background.addChild(this.charOpposite);
			
			this.charPrev = new Char(Position.PREV);
			LayerManager.instance.background.addChild(this.charPrev);
			
			this.update();
		}
		
		override public function onRemove():void
		{
			LayerManager.instance.background.removeChild(this.logo);
			this.logo = null;
			
			LayerManager.instance.background.removeChild(this.frame);
			this.frame = null;
			
			LayerManager.instance.background.removeChild(this.background);
			this.background = null;
			
			LayerManager.instance.background.removeChild(this.charPrev);
			this.charPrev = null;
			
			LayerManager.instance.background.removeChild(this.charOpposite);
			this.charOpposite = null;
			
			LayerManager.instance.background.removeChild(this.charNext);
			this.charNext = null;
			
			LayerManager.instance.background.removeChild(this.charCurrent);
			this.charCurrent = null;
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		public function update():void
		{
			var userlist:ArrayList = (this.module as BloodRiver).info.data.table.userList;
			
			for (var i:int = 0; i < userlist.length; i++)
			{
				var user:UserInfo = userlist.element(i);
				
				if (user.seat < 0)
				{
					continue;
				}
				
				switch ((this.module as BloodRiver).info.data.table.getSeatPosition(user.seat))
				{
					case Position.CURRENT:
						this.charCurrent.user = user;
						break;
					case Position.OPPOSITE:
						this.charOpposite.user = user;
						break;
					case Position.PREV:
						this.charPrev.user = user;
						break;
					case Position.NEXT:
						this.charNext.user = user;
						break;
				}
			}
		}
	
	}
}
