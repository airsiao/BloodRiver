package com.ourgame.mahjong.bloodriver.table.utils
{
	import com.ourgame.mahjong.bloodriver.table.ui.Tile;
	
	/**
	 * 根据ID比较麻将牌
	 * @param tile1
	 * @param tile2
	 * @return
	 */
	public function compareTileByID(tile1:Tile, tile2:Tile):Number
	{
		return tile1.card.id - tile2.card.id;
	}

}
