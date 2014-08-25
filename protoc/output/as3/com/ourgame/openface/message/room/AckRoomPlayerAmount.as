package com.ourgame.openface.message.room {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.room.AckRoomPlayerAmount.RoomPlayerAmount;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AckRoomPlayerAmount extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOMPLAYERAMOUNTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.room.AckRoomPlayerAmount.roomPlayerAmounts", "roomPlayerAmounts", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.room.AckRoomPlayerAmount.RoomPlayerAmount; });

		[ArrayElementType("com.ourgame.openface.message.room.AckRoomPlayerAmount.RoomPlayerAmount")]
		public var roomPlayerAmounts:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var roomPlayerAmounts$index:uint = 0; roomPlayerAmounts$index < this.roomPlayerAmounts.length; ++roomPlayerAmounts$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.roomPlayerAmounts[roomPlayerAmounts$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.roomPlayerAmounts.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.room.AckRoomPlayerAmount.RoomPlayerAmount()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
