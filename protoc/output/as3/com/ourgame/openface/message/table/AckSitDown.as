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
	public dynamic final class AckSitDown extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckSitDown.result", "result", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var result:uint;

		/**
		 *  @private
		 */
		public static const TABLEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckSitDown.tableId", "tableId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var tableId:uint;

		/**
		 *  @private
		 */
		public static const USERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.table.AckSitDown.userId", "userId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var userId:UInt64;

		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.table.AckSitDown.seat", "seat", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:int;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.result);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.tableId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.userId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.seat);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var result$count:uint = 0;
			var tableId$count:uint = 0;
			var userId$count:uint = 0;
			var seat$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckSitDown.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (tableId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckSitDown.tableId cannot be set twice.');
					}
					++tableId$count;
					this.tableId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckSitDown.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 4:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckSitDown.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
