package com.ourgame.mahjong.bloodriver.table.model
{
	import com.ourgame.mahjong.bloodriver.common.data.CommonData;
	import com.ourgame.mahjong.bloodriver.common.vo.ITableProxy;
	import com.ourgame.mahjong.bloodriver.table.method.TableMethod;
	import com.wecoit.mvc.Model;
	
	/**
	 * 桌子数据模型
	 * @author SiaoLeon
	 */
	public class TableModel extends Model implements ITableProxy
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
		public function TableModel()
		{
			super();
		}
		
		// -------------------------------------------------------------------------------------------------------- 方法
		
		override public function onAdd():void
		{
			CommonData.tableProxy = this;
		}
		
		override public function onRemove():void
		{
			CommonData.tableProxy = null;
		}
		
		public function start():void
		{
			this.notify(TableMethod.GAME_ENTER);
		}
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
