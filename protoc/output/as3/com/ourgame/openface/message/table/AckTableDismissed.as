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
	public dynamic final class AckTableDismissed extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TABLEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckTableDismissed.tableId", "tableId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var tableId:uint;

		/**
		 *  @private
		 */
		public static const REASON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckTableDismissed.reason", "reason", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var reason$field:uint;

		private var hasField$0:uint = 0;

		public function clearReason():void {
			hasField$0 &= 0xfffffffe;
			reason$field = new uint();
		}

		public function get hasReason():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set reason(value:uint):void {
			hasField$0 |= 0x1;
			reason$field = value;
		}

		public function get reason():uint {
			return reason$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.tableId);
			if (hasReason) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, reason$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var tableId$count:uint = 0;
			var reason$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (tableId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckTableDismissed.tableId cannot be set twice.');
					}
					++tableId$count;
					this.tableId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (reason$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckTableDismissed.reason cannot be set twice.');
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
