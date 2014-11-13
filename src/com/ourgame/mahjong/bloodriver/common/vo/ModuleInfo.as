package com.ourgame.mahjong.bloodriver.common.vo
{
	import com.wecoit.data.HashMap;
	import com.wecoit.data.ValueObject;
	import com.wecoit.data.XmlValue;
	
	import flash.display.DisplayObject;
	import flash.system.ApplicationDomain;
	
	/**
	 * 游戏
	 * @author SiaoLeon
	 */
	public class ModuleInfo extends ValueObject
	{
		// -------------------------------------------------------------------------------------------------------- 静态常量
		
		// -------------------------------------------------------------------------------------------------------- 静态变量
		
		// -------------------------------------------------------------------------------------------------------- 静态方法
		
		// -------------------------------------------------------------------------------------------------------- 静态函数
		
		// -------------------------------------------------------------------------------------------------------- 属性
		
		/**
		 * ID
		 * @return
		 */
		public function get id():uint
		{
			return this.getProperty("id", 0);
		}
		
		/**
		 * 名称
		 * @return
		 */
		public function get name():String
		{
			return this.getProperty("name", "");
		}
		
		/**
		 * 路径
		 * @return
		 */
		public function get path():String
		{
			return this.getProperty("path", "");
		}
		
		/**
		 * 地址
		 * @return
		 */
		public function get url():String
		{
			return this.getProperty("url", "");
		}
		
		/**
		 * 主程序
		 * @return
		 */
		public function get main():DisplayObject
		{
			return this.assets.getValue(this.name);
		}
		
		/**
		 * 资源列表
		 * @return
		 */
		public function get assets():HashMap
		{
			return this.getProperty("assets", new HashMap());
		}
		
		/**
		 * 域
		 * @return
		 */
		public function get domain():ApplicationDomain
		{
			return this.getProperty("domain", new ApplicationDomain(ApplicationDomain.currentDomain));
		}
		
		public function set domain(value:ApplicationDomain):void
		{
			this.setProperty("domain", value);
		}
		
		// -------------------------------------------------------------------------------------------------------- 变量
		
		// -------------------------------------------------------------------------------------------------------- 构造
		
		/**
		 * 构造函数
		 */
		public function ModuleInfo(info:XmlValue)
		{
			super();
			
			this.setProperty("id", info.attribute("id"));
			this.setProperty("name", info.name);
			this.setProperty("path", info.attribute("path"));
			this.setProperty("url", info.value);
		}
	
		// -------------------------------------------------------------------------------------------------------- 方法
	
		// -------------------------------------------------------------------------------------------------------- 函数
	
	}
}
