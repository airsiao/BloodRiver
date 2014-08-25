package com.ourgame.openface.message.game {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.game.UserCards;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AckGameStatus extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USERCARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.game.AckGameStatus.userCards", "userCards", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.game.UserCards; });

		[ArrayElementType("com.ourgame.openface.message.game.UserCards")]
		public var userCards:Array = [];

		/**
		 *  @private
		 */
		public static const DEALERSEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.AckGameStatus.dealerSeat", "dealerSeat", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dealerSeat$field:uint;

		private var hasField$0:uint = 0;

		public function clearDealerSeat():void {
			hasField$0 &= 0xfffffffe;
			dealerSeat$field = new uint();
		}

		public function get hasDealerSeat():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set dealerSeat(value:uint):void {
			hasField$0 |= 0x1;
			dealerSeat$field = value;
		}

		public function get dealerSeat():uint {
			return dealerSeat$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var userCards$index:uint = 0; userCards$index < this.userCards.length; ++userCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.userCards[userCards$index]);
			}
			if (hasDealerSeat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, dealerSeat$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var dealerSeat$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.userCards.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.game.UserCards()));
					break;
				case 2:
					if (dealerSeat$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGameStatus.dealerSeat cannot be set twice.');
					}
					++dealerSeat$count;
					this.dealerSeat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
