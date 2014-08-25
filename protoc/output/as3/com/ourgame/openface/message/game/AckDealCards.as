package com.ourgame.openface.message.game {
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
	public dynamic final class AckDealCards extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.AckDealCards.seat", "seat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:uint;

		/**
		 *  @private
		 */
		public static const MAXUSETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.AckDealCards.maxUseTime", "maxUseTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var maxUseTime:uint;

		/**
		 *  @private
		 */
		public static const CARDS:RepeatedFieldDescriptor$TYPE_SINT32 = new RepeatedFieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.game.AckDealCards.cards", "cards", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var cards:Array = [];

		/**
		 *  @private
		 */
		public static const FANTASY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.game.AckDealCards.fantasy", "fantasy", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fantasy$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearFantasy():void {
			hasField$0 &= 0xfffffffe;
			fantasy$field = new Boolean();
		}

		public function get hasFantasy():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set fantasy(value:Boolean):void {
			hasField$0 |= 0x1;
			fantasy$field = value;
		}

		public function get fantasy():Boolean {
			return fantasy$field;
		}

		/**
		 *  @private
		 */
		public static const VACANT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.game.AckDealCards.vacant", "vacant", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vacant$field:Boolean;

		public function clearVacant():void {
			hasField$0 &= 0xfffffffd;
			vacant$field = new Boolean();
		}

		public function get hasVacant():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set vacant(value:Boolean):void {
			hasField$0 |= 0x2;
			vacant$field = value;
		}

		public function get vacant():Boolean {
			return vacant$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.seat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.maxUseTime);
			for (var cards$index:uint = 0; cards$index < this.cards.length; ++cards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.cards[cards$index]);
			}
			if (hasFantasy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, fantasy$field);
			}
			if (hasVacant) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, vacant$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var seat$count:uint = 0;
			var maxUseTime$count:uint = 0;
			var fantasy$count:uint = 0;
			var vacant$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckDealCards.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (maxUseTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckDealCards.maxUseTime cannot be set twice.');
					}
					++maxUseTime$count;
					this.maxUseTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_SINT32, this.cards);
						break;
					}
					this.cards.push(com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input));
					break;
				case 4:
					if (fantasy$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckDealCards.fantasy cannot be set twice.');
					}
					++fantasy$count;
					this.fantasy = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 5:
					if (vacant$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckDealCards.vacant cannot be set twice.');
					}
					++vacant$count;
					this.vacant = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
