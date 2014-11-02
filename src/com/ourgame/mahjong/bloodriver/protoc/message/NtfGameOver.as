package com.ourgame.mahjong.bloodriver.protoc.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfGameOver.FinalWinInfo;
	import com.ourgame.mahjong.bloodriver.protoc.message.NtfGameOver.FinalStatus;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NtfGameOver extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameOver.gameId", "gameId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gameId:UInt64;

		/**
		 *  @private
		 */
		public static const FINALSTATUS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameOver.finalStatus", "finalStatus", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.mahjong.bloodriver.protoc.message.NtfGameOver.FinalStatus; });

		[ArrayElementType("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameOver.FinalStatus")]
		public var finalStatus:Array = [];

		/**
		 *  @private
		 */
		public static const FINALWININFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameOver.finalWinInfos", "finalWinInfos", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.mahjong.bloodriver.protoc.message.NtfGameOver.FinalWinInfo; });

		[ArrayElementType("com.ourgame.mahjong.bloodriver.protoc.message.NtfGameOver.FinalWinInfo")]
		public var finalWinInfos:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.gameId);
			for (var finalStatus$index:uint = 0; finalStatus$index < this.finalStatus.length; ++finalStatus$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.finalStatus[finalStatus$index]);
			}
			for (var finalWinInfos$index:uint = 0; finalWinInfos$index < this.finalWinInfos.length; ++finalWinInfos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.finalWinInfos[finalWinInfos$index]);
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
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gameId$count != 0) {
						throw new flash.errors.IOError('Bad data format: NtfGameOver.gameId cannot be set twice.');
					}
					++gameId$count;
					this.gameId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					this.finalStatus.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.mahjong.bloodriver.protoc.message.NtfGameOver.FinalStatus()));
					break;
				case 3:
					this.finalWinInfos.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.mahjong.bloodriver.protoc.message.NtfGameOver.FinalWinInfo()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
