package com.ourgame.openface.message.game {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.game.RowResult;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class UserResult extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.UserResult.seat", "seat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:uint;

		/**
		 *  @private
		 */
		public static const TOTALWINUNITS:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.game.UserResult.totalWinUnits", "totalWinUnits", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var totalWinUnits:int;

		/**
		 *  @private
		 */
		public static const ROWRESULTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.game.UserResult.rowResults", "rowResults", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.game.RowResult; });

		[ArrayElementType("com.ourgame.openface.message.game.RowResult")]
		public var rowResults:Array = [];

		/**
		 *  @private
		 */
		public static const KOAWARD:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.game.UserResult.KOAward", "kOAward", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var kOAward:int;

		/**
		 *  @private
		 */
		public static const HOMERUNAWARD:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.game.UserResult.homeRunAward", "homeRunAward", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var homeRunAward:int;

		/**
		 *  @private
		 */
		public static const BROKEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.game.UserResult.broken", "broken", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		public var broken:Boolean;

		/**
		 *  @private
		 */
		public static const FANTASY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.game.UserResult.fantasy", "fantasy", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		public var fantasy:Boolean;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.seat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.totalWinUnits);
			for (var rowResults$index:uint = 0; rowResults$index < this.rowResults.length; ++rowResults$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.rowResults[rowResults$index]);
			}
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.kOAward);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.homeRunAward);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.broken);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.fantasy);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var seat$count:uint = 0;
			var totalWinUnits$count:uint = 0;
			var KOAward$count:uint = 0;
			var homeRunAward$count:uint = 0;
			var broken$count:uint = 0;
			var fantasy$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserResult.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (totalWinUnits$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserResult.totalWinUnits cannot be set twice.');
					}
					++totalWinUnits$count;
					this.totalWinUnits = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 3:
					this.rowResults.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.game.RowResult()));
					break;
				case 4:
					if (KOAward$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserResult.kOAward cannot be set twice.');
					}
					++KOAward$count;
					this.kOAward = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 5:
					if (homeRunAward$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserResult.homeRunAward cannot be set twice.');
					}
					++homeRunAward$count;
					this.homeRunAward = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 6:
					if (broken$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserResult.broken cannot be set twice.');
					}
					++broken$count;
					this.broken = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (fantasy$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserResult.fantasy cannot be set twice.');
					}
					++fantasy$count;
					this.fantasy = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
