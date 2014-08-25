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
	public dynamic final class AckStandUp extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TABLEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckStandUp.tableId", "tableId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var tableId:uint;

		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.table.AckStandUp.seat", "seat", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:int;

		/**
		 *  @private
		 */
		public static const REASON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckStandUp.reason", "reason", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var reason:uint;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.tableId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.seat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.reason);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var tableId$count:uint = 0;
			var seat$count:uint = 0;
			var reason$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (tableId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckStandUp.tableId cannot be set twice.');
					}
					++tableId$count;
					this.tableId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckStandUp.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 3:
					if (reason$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckStandUp.reason cannot be set twice.');
					}
					++reason$count;
					this.reason = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
