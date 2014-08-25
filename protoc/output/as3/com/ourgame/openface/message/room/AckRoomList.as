package com.ourgame.openface.message.room {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.room.AckRoomList.Room;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AckRoomList extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.room.AckRoomList.rooms", "rooms", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.room.AckRoomList.Room; });

		[ArrayElementType("com.ourgame.openface.message.room.AckRoomList.Room")]
		public var rooms:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var rooms$index:uint = 0; rooms$index < this.rooms.length; ++rooms$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.rooms[rooms$index]);
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
					this.rooms.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.room.AckRoomList.Room()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
