package com.ourgame.mahjong.bloodriver.table.utils
{
	import com.ourgame.mahjong.bloodriver.table.vo.IAction;
	
	/**
	 * 根据类型比较动作
	 * @param action1
	 * @param action2
	 * @return
	 */
	public function compareActionByType(action1:IAction, action2:IAction):Number
	{
		return action1.type - action2.type;
	}

}
