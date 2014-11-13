package com.ourgame.mahjong.bloodriver.table.view
{
	import com.ourgame.mahjong.bloodriver.table.method.TableMethod;
	import com.ourgame.mahjong.bloodriver.table.ui.ResultPanel;
	import com.ourgame.mahjong.bloodriver.table.ui.TableLayer;
	import com.ourgame.mahjong.bloodriver.table.vo.ResultRecord;
	import com.wecoit.mvc.View;
	import com.wecoit.mvc.core.INotice;
	
	import flash.events.Event;
	
	/**
	 * 结算视图
	 * @author SiaoLeon
	 */
	public class ResultView extends View
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
		public function ResultView()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		public function play(notice:INotice):void
		{
			var results:Vector.<int> = notice.params[0];
			var records:Vector.<ResultRecord> = notice.params[1];
			
			var panel:ResultPanel = new ResultPanel(results, records);
			panel.addEventListener("continue", onContinue, false, 0, true);
			panel.addEventListener("return", onReturn, false, 0, true);
			TableLayer.instance.pop.addChild(panel);
			
			notice.complete();
		}
		
		// -------------------------------------------------------------------------------------------------------- 函数
		
		private function onContinue(event:Event):void
		{
			this.notify(TableMethod.STAND_BY);
		}
		
		private function onReturn(event:Event):void
		{
			this.notify(TableMethod.RETURN);
		}
	
	}
}
