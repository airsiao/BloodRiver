package com.ourgame.openface.message.chat {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.chat.E_Pos_CoinType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Pos_Position extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COINTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.ourgame.openface.message.chat.Pos_Position.CoinType", "coinType", (1 << 3) | com.netease.protobuf.WireType.VARINT, com.ourgame.openface.message.chat.E_Pos_CoinType);

		private var CoinType$field:int;

		private var hasField$0:uint = 0;

		public function clearCoinType():void {
			hasField$0 &= 0xfffffffe;
			CoinType$field = new int();
		}

		public function get hasCoinType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set coinType(value:int):void {
			hasField$0 |= 0x1;
			CoinType$field = value;
		}

		public function get coinType():int {
			if(!hasCoinType) {
				return com.ourgame.openface.message.chat.E_Pos_CoinType.CT_UNDEFINED;
			}
			return CoinType$field;
		}

		/**
		 *  @private
		 */
		public static const CHANNELID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.Pos_Position.ChannelID", "channelID", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ChannelID$field:int;

		public function clearChannelID():void {
			hasField$0 &= 0xfffffffd;
			ChannelID$field = new int();
		}

		public function get hasChannelID():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set channelID(value:int):void {
			hasField$0 |= 0x2;
			ChannelID$field = value;
		}

		public function get channelID():int {
			if(!hasChannelID) {
				return -1;
			}
			return ChannelID$field;
		}

		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.Pos_Position.GameID", "gameID", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var GameID$field:int;

		public function clearGameID():void {
			hasField$0 &= 0xfffffffb;
			GameID$field = new int();
		}

		public function get hasGameID():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set gameID(value:int):void {
			hasField$0 |= 0x4;
			GameID$field = value;
		}

		public function get gameID():int {
			if(!hasGameID) {
				return 0;
			}
			return GameID$field;
		}

		/**
		 *  @private
		 */
		public static const GROUPID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.Pos_Position.GroupID", "groupID", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var GroupID$field:int;

		public function clearGroupID():void {
			hasField$0 &= 0xfffffff7;
			GroupID$field = new int();
		}

		public function get hasGroupID():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set groupID(value:int):void {
			hasField$0 |= 0x8;
			GroupID$field = value;
		}

		public function get groupID():int {
			if(!hasGroupID) {
				return 0;
			}
			return GroupID$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.ourgame.openface.message.chat.Pos_Position.RoomID", "roomID", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var RoomID$field:Int64;

		public function clearRoomID():void {
			RoomID$field = null;
		}

		public function get hasRoomID():Boolean {
			return RoomID$field != null;
		}

		public function set roomID(value:Int64):void {
			RoomID$field = value;
		}

		public function get roomID():Int64 {
			if(!hasRoomID) {
				return new Int64(0, 0);
			}
			return RoomID$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCoinType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, CoinType$field);
			}
			if (hasChannelID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ChannelID$field);
			}
			if (hasGameID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, GameID$field);
			}
			if (hasGroupID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, GroupID$field);
			}
			if (hasRoomID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, RoomID$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var CoinType$count:uint = 0;
			var ChannelID$count:uint = 0;
			var GameID$count:uint = 0;
			var GroupID$count:uint = 0;
			var RoomID$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (CoinType$count != 0) {
						throw new flash.errors.IOError('Bad data format: Pos_Position.coinType cannot be set twice.');
					}
					++CoinType$count;
					this.coinType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (ChannelID$count != 0) {
						throw new flash.errors.IOError('Bad data format: Pos_Position.channelID cannot be set twice.');
					}
					++ChannelID$count;
					this.channelID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (GameID$count != 0) {
						throw new flash.errors.IOError('Bad data format: Pos_Position.gameID cannot be set twice.');
					}
					++GameID$count;
					this.gameID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (GroupID$count != 0) {
						throw new flash.errors.IOError('Bad data format: Pos_Position.groupID cannot be set twice.');
					}
					++GroupID$count;
					this.groupID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (RoomID$count != 0) {
						throw new flash.errors.IOError('Bad data format: Pos_Position.roomID cannot be set twice.');
					}
					++RoomID$count;
					this.roomID = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
