package com.ourgame.mahjong.bloodriver.protoc.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.mahjong.bloodriver.protoc.message.Meld;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CurrentTileInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.CurrentTileInfo.seat", "seat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:uint;

		/**
		 *  @private
		 */
		public static const INHANDAMOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.CurrentTileInfo.inhandAmount", "inhandAmount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var inhandAmount:uint;

		/**
		 *  @private
		 */
		public static const SHOWTILES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.mahjong.bloodriver.protoc.message.CurrentTileInfo.showTiles", "showTiles", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.mahjong.bloodriver.protoc.message.Meld; });

		[ArrayElementType("com.ourgame.mahjong.bloodriver.protoc.message.Meld")]
		public var showTiles:Array = [];

		/**
		 *  @private
		 */
		public static const DISCARDEDTILES:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.CurrentTileInfo.discardedTiles", "discardedTiles", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("uint")]
		public var discardedTiles:Array = [];

		/**
		 *  @private
		 */
		public static const INHANDTILES:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.CurrentTileInfo.inhandTiles", "inhandTiles", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("uint")]
		public var inhandTiles:Array = [];

		/**
		 *  @private
		 */
		public static const LASTTILE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.CurrentTileInfo.lastTile", "lastTile", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lastTile$field:uint;

		private var hasField$0:uint = 0;

		public function clearLastTile():void {
			hasField$0 &= 0xfffffffe;
			lastTile$field = new uint();
		}

		public function get hasLastTile():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set lastTile(value:uint):void {
			hasField$0 |= 0x1;
			lastTile$field = value;
		}

		public function get lastTile():uint {
			return lastTile$field;
		}

		/**
		 *  @private
		 */
		public static const FLOWERS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.mahjong.bloodriver.protoc.message.CurrentTileInfo.flowers", "flowers", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var flowers$field:uint;

		public function clearFlowers():void {
			hasField$0 &= 0xfffffffd;
			flowers$field = new uint();
		}

		public function get hasFlowers():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set flowers(value:uint):void {
			hasField$0 |= 0x2;
			flowers$field = value;
		}

		public function get flowers():uint {
			return flowers$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.seat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.inhandAmount);
			for (var showTiles$index:uint = 0; showTiles$index < this.showTiles.length; ++showTiles$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.showTiles[showTiles$index]);
			}
			for (var discardedTiles$index:uint = 0; discardedTiles$index < this.discardedTiles.length; ++discardedTiles$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.discardedTiles[discardedTiles$index]);
			}
			for (var inhandTiles$index:uint = 0; inhandTiles$index < this.inhandTiles.length; ++inhandTiles$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.inhandTiles[inhandTiles$index]);
			}
			if (hasLastTile) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, lastTile$field);
			}
			if (hasFlowers) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, flowers$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var seat$count:uint = 0;
			var inhandAmount$count:uint = 0;
			var lastTile$count:uint = 0;
			var flowers$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: CurrentTileInfo.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (inhandAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: CurrentTileInfo.inhandAmount cannot be set twice.');
					}
					++inhandAmount$count;
					this.inhandAmount = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					this.showTiles.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.mahjong.bloodriver.protoc.message.Meld()));
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT32, this.discardedTiles);
						break;
					}
					this.discardedTiles.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input));
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT32, this.inhandTiles);
						break;
					}
					this.inhandTiles.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input));
					break;
				case 6:
					if (lastTile$count != 0) {
						throw new flash.errors.IOError('Bad data format: CurrentTileInfo.lastTile cannot be set twice.');
					}
					++lastTile$count;
					this.lastTile = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 7:
					if (flowers$count != 0) {
						throw new flash.errors.IOError('Bad data format: CurrentTileInfo.flowers cannot be set twice.');
					}
					++flowers$count;
					this.flowers = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
