package com.ourgame.openface.message.game {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.game.UserResult;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AckGameResult extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESULTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.game.AckGameResult.results", "results", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.game.UserResult; });

		[ArrayElementType("com.ourgame.openface.message.game.UserResult")]
		public var results:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var results$index:uint = 0; results$index < this.results.length; ++results$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.results[results$index]);
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
					this.results.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.game.UserResult()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
