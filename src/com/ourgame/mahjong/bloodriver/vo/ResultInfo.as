package com.ourgame.mahjong.bloodriver.vo
{
	
	/**
	 * 结算信息
	 * @author SiaoLeon
	 */
	public class ResultInfo
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		private var _status:uint;
		
		public function get status():uint
		{
			return this._status;
		}
		
		private var _fan:int;
		
		public function get fan():int
		{
			return this._fan;
		}
		
		private var _hands:Vector.<Card>;
		
		public function get hands():Vector.<Card>
		{
			return this._hands;
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function ResultInfo(status:uint, fan:int)
		{
			this._status = status;
			this._fan = fan;
			this._hands = new Vector.<Card>();
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
