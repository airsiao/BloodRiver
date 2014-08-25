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
	public dynamic final class Table extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TABLEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.Table.tableId", "tableId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var tableId:uint;

		/**
		 *  @private
		 */
		public static const TABLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.table.Table.tableName", "tableName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var tableName:String;

		/**
		 *  @private
		 */
		public static const PLAYERAMOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.Table.playerAmount", "playerAmount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var playerAmount:uint;

		/**
		 *  @private
		 */
		public static const MAXPLAYERAMOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.Table.maxPlayerAmount", "maxPlayerAmount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var maxPlayerAmount:uint;

		/**
		 *  @private
		 */
		public static const ENTERBUYIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.Table.enterBuyin", "enterBuyin", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var enterBuyin:uint;

		/**
		 *  @private
		 */
		public static const ENTERSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.Table.enterScore", "enterScore", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		public var enterScore:uint;

		/**
		 *  @private
		 */
		public static const UNITVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.Table.unitValue", "unitValue", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		public var unitValue:uint;

		/**
		 *  @private
		 */
		public static const MINSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.Table.minScore", "minScore", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		public var minScore:uint;

		/**
		 *  @private
		 */
		public static const GAMETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.Table.gameType", "gameType", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gameType:uint;

		/**
		 *  @private
		 */
		public static const ACTIVITYFLAG:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.table.Table.activityFlag", "activityFlag", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var activityFlag$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearActivityFlag():void {
			hasField$0 &= 0xfffffffe;
			activityFlag$field = new Boolean();
		}

		public function get hasActivityFlag():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set activityFlag(value:Boolean):void {
			hasField$0 |= 0x1;
			activityFlag$field = value;
		}

		public function get activityFlag():Boolean {
			return activityFlag$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.tableId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.tableName);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.playerAmount);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.maxPlayerAmount);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.enterBuyin);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.enterScore);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.unitValue);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.minScore);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.gameType);
			if (hasActivityFlag) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, activityFlag$field);
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
			var tableName$count:uint = 0;
			var playerAmount$count:uint = 0;
			var maxPlayerAmount$count:uint = 0;
			var enterBuyin$count:uint = 0;
			var enterScore$count:uint = 0;
			var unitValue$count:uint = 0;
			var minScore$count:uint = 0;
			var gameType$count:uint = 0;
			var activityFlag$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (tableId$count != 0) {
						throw new flash.errors.IOError('Bad data format: Table.tableId cannot be set twice.');
					}
					++tableId$count;
					this.tableId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (tableName$count != 0) {
						throw new flash.errors.IOError('Bad data format: Table.tableName cannot be set twice.');
					}
					++tableName$count;
					this.tableName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (playerAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: Table.playerAmount cannot be set twice.');
					}
					++playerAmount$count;
					this.playerAmount = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (maxPlayerAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: Table.maxPlayerAmount cannot be set twice.');
					}
					++maxPlayerAmount$count;
					this.maxPlayerAmount = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if (enterBuyin$count != 0) {
						throw new flash.errors.IOError('Bad data format: Table.enterBuyin cannot be set twice.');
					}
					++enterBuyin$count;
					this.enterBuyin = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 6:
					if (enterScore$count != 0) {
						throw new flash.errors.IOError('Bad data format: Table.enterScore cannot be set twice.');
					}
					++enterScore$count;
					this.enterScore = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 7:
					if (unitValue$count != 0) {
						throw new flash.errors.IOError('Bad data format: Table.unitValue cannot be set twice.');
					}
					++unitValue$count;
					this.unitValue = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 8:
					if (minScore$count != 0) {
						throw new flash.errors.IOError('Bad data format: Table.minScore cannot be set twice.');
					}
					++minScore$count;
					this.minScore = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 9:
					if (gameType$count != 0) {
						throw new flash.errors.IOError('Bad data format: Table.gameType cannot be set twice.');
					}
					++gameType$count;
					this.gameType = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 10:
					if (activityFlag$count != 0) {
						throw new flash.errors.IOError('Bad data format: Table.activityFlag cannot be set twice.');
					}
					++activityFlag$count;
					this.activityFlag = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
