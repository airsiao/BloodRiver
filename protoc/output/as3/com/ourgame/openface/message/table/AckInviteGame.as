package com.ourgame.openface.message.table {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AckInviteGame extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.table.AckInviteGame.gameId", "gameId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gameId:UInt64;

		/**
		 *  @private
		 */
		public static const SERVERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.table.AckInviteGame.serverId", "serverId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var serverId:UInt64;

		/**
		 *  @private
		 */
		public static const GAMETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckInviteGame.gameType", "gameType", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gameType$field:uint;

		private var hasField$0:uint = 0;

		public function clearGameType():void {
			hasField$0 &= 0xfffffffe;
			gameType$field = new uint();
		}

		public function get hasGameType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set gameType(value:uint):void {
			hasField$0 |= 0x1;
			gameType$field = value;
		}

		public function get gameType():uint {
			return gameType$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.gameId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.serverId);
			if (hasGameType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, gameType$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var gameId$count:uint = 0;
			var serverId$count:uint = 0;
			var gameType$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gameId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckInviteGame.gameId cannot be set twice.');
					}
					++gameId$count;
					this.gameId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (serverId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckInviteGame.serverId cannot be set twice.');
					}
					++serverId$count;
					this.serverId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (gameType$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckInviteGame.gameType cannot be set twice.');
					}
					++gameType$count;
					this.gameType = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
