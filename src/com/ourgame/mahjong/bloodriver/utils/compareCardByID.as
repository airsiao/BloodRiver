package com.ourgame.mahjong.bloodriver.utils
{
	import com.ourgame.mahjong.bloodriver.vo.Card;
	
	/**
	 * 根据ID比较麻将牌
	 * @param card1
	 * @param card2
	 * @return
	 */
	public function compareCardByID(card1:Card, card2:Card):Number
	{
		return card1.id - card2.id;
	}

}
