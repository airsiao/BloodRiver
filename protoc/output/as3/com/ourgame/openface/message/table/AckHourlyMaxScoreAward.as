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
	public dynamic final class AckHourlyMaxScoreAward extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckHourlyMaxScoreAward.roomId", "roomId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var roomId:uint;

		/**
		 *  @private
		 */
		public static const TABLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.table.AckHourlyMaxScoreAward.tableName", "tableName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var tableName:String;

		/**
		 *  @private
		 */
		public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckHourlyMaxScoreAward.score", "score", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var score:uint;

		/**
		 *  @private
		 */
		public static const NICKNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.table.AckHourlyMaxScoreAward.nickname", "nickname", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var nickname:String;

		/**
		 *  @private
		 */
		public static const ENDHOUR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckHourlyMaxScoreAward.endHour", "endHour", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var endHour:uint;

		/**
		 *  @private
		 */
		public static const AWARD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.AckHourlyMaxScoreAward.award", "award", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		public var award:uint;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.roomId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.tableName);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.score);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.nickname);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.endHour);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.award);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var roomId$count:uint = 0;
			var tableName$count:uint = 0;
			var score$count:uint = 0;
			var nickname$count:uint = 0;
			var endHour$count:uint = 0;
			var award$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (roomId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckHourlyMaxScoreAward.roomId cannot be set twice.');
					}
					++roomId$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (tableName$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckHourlyMaxScoreAward.tableName cannot be set twice.');
					}
					++tableName$count;
					this.tableName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (score$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckHourlyMaxScoreAward.score cannot be set twice.');
					}
					++score$count;
					this.score = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (nickname$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckHourlyMaxScoreAward.nickname cannot be set twice.');
					}
					++nickname$count;
					this.nickname = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (endHour$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckHourlyMaxScoreAward.endHour cannot be set twice.');
					}
					++endHour$count;
					this.endHour = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 6:
					if (award$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckHourlyMaxScoreAward.award cannot be set twice.');
					}
					++award$count;
					this.award = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
