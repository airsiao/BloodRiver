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
	public dynamic final class AckScoreChanged extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.table.AckScoreChanged.userId", "userId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var userId:UInt64;

		/**
		 *  @private
		 */
		public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckScoreChanged.score", "score", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var score:uint;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.userId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.score);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var userId$count:uint = 0;
			var score$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckScoreChanged.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (score$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckScoreChanged.score cannot be set twice.');
					}
					++score$count;
					this.score = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
