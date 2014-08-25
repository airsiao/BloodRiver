package com.ourgame.openface.message.game {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.game.CardPosition;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class UserCards extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.UserCards.seat", "seat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:uint;

		/**
		 *  @private
		 */
		public static const CARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ourgame.openface.message.game.UserCards.cards", "cards", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ourgame.openface.message.game.CardPosition; });

		[ArrayElementType("com.ourgame.openface.message.game.CardPosition")]
		public var cards:Array = [];

		/**
		 *  @private
		 */
		public static const INHANDCARDS:RepeatedFieldDescriptor$TYPE_SINT32 = new RepeatedFieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.game.UserCards.inHandCards", "inHandCards", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var inHandCards:Array = [];

		/**
		 *  @private
		 */
		public static const TOTALTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.UserCards.totalTime", "totalTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var totalTime$field:uint;

		private var hasField$0:uint = 0;

		public function clearTotalTime():void {
			hasField$0 &= 0xfffffffe;
			totalTime$field = new uint();
		}

		public function get hasTotalTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set totalTime(value:uint):void {
			hasField$0 |= 0x1;
			totalTime$field = value;
		}

		public function get totalTime():uint {
			return totalTime$field;
		}

		/**
		 *  @private
		 */
		public static const REMAINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.game.UserCards.remainTime", "remainTime", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var remainTime$field:uint;

		public function clearRemainTime():void {
			hasField$0 &= 0xfffffffd;
			remainTime$field = new uint();
		}

		public function get hasRemainTime():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set remainTime(value:uint):void {
			hasField$0 |= 0x2;
			remainTime$field = value;
		}

		public function get remainTime():uint {
			return remainTime$field;
		}

		/**
		 *  @private
		 */
		public static const TRUST:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.game.UserCards.trust", "trust", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var trust$field:Boolean;

		public function clearTrust():void {
			hasField$0 &= 0xfffffffb;
			trust$field = new Boolean();
		}

		public function get hasTrust():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set trust(value:Boolean):void {
			hasField$0 |= 0x4;
			trust$field = value;
		}

		public function get trust():Boolean {
			return trust$field;
		}

		/**
		 *  @private
		 */
		public static const BROKEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.game.UserCards.broken", "broken", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var broken$field:Boolean;

		public function clearBroken():void {
			hasField$0 &= 0xfffffff7;
			broken$field = new Boolean();
		}

		public function get hasBroken():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set broken(value:Boolean):void {
			hasField$0 |= 0x8;
			broken$field = value;
		}

		public function get broken():Boolean {
			return broken$field;
		}

		/**
		 *  @private
		 */
		public static const FANTASY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.game.UserCards.fantasy", "fantasy", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fantasy$field:Boolean;

		public function clearFantasy():void {
			hasField$0 &= 0xffffffef;
			fantasy$field = new Boolean();
		}

		public function get hasFantasy():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set fantasy(value:Boolean):void {
			hasField$0 |= 0x10;
			fantasy$field = value;
		}

		public function get fantasy():Boolean {
			return fantasy$field;
		}

		/**
		 *  @private
		 */
		public static const VACANT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.game.UserCards.vacant", "vacant", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vacant$field:Boolean;

		public function clearVacant():void {
			hasField$0 &= 0xffffffdf;
			vacant$field = new Boolean();
		}

		public function get hasVacant():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set vacant(value:Boolean):void {
			hasField$0 |= 0x20;
			vacant$field = value;
		}

		public function get vacant():Boolean {
			return vacant$field;
		}

		/**
		 *  @private
		 */
		public static const FINISHED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.game.UserCards.finished", "finished", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var finished$field:Boolean;

		public function clearFinished():void {
			hasField$0 &= 0xffffffbf;
			finished$field = new Boolean();
		}

		public function get hasFinished():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set finished(value:Boolean):void {
			hasField$0 |= 0x40;
			finished$field = value;
		}

		public function get finished():Boolean {
			return finished$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.seat);
			for (var cards$index:uint = 0; cards$index < this.cards.length; ++cards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.cards[cards$index]);
			}
			for (var inHandCards$index:uint = 0; inHandCards$index < this.inHandCards.length; ++inHandCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.inHandCards[inHandCards$index]);
			}
			if (hasTotalTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, totalTime$field);
			}
			if (hasRemainTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, remainTime$field);
			}
			if (hasTrust) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, trust$field);
			}
			if (hasBroken) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, broken$field);
			}
			if (hasFantasy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, fantasy$field);
			}
			if (hasVacant) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, vacant$field);
			}
			if (hasFinished) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, finished$field);
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
			var totalTime$count:uint = 0;
			var remainTime$count:uint = 0;
			var trust$count:uint = 0;
			var broken$count:uint = 0;
			var fantasy$count:uint = 0;
			var vacant$count:uint = 0;
			var finished$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserCards.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					this.cards.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ourgame.openface.message.game.CardPosition()));
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_SINT32, this.inHandCards);
						break;
					}
					this.inHandCards.push(com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input));
					break;
				case 4:
					if (totalTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserCards.totalTime cannot be set twice.');
					}
					++totalTime$count;
					this.totalTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if (remainTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserCards.remainTime cannot be set twice.');
					}
					++remainTime$count;
					this.remainTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 6:
					if (trust$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserCards.trust cannot be set twice.');
					}
					++trust$count;
					this.trust = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (broken$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserCards.broken cannot be set twice.');
					}
					++broken$count;
					this.broken = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 8:
					if (fantasy$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserCards.fantasy cannot be set twice.');
					}
					++fantasy$count;
					this.fantasy = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 9:
					if (vacant$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserCards.vacant cannot be set twice.');
					}
					++vacant$count;
					this.vacant = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 10:
					if (finished$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserCards.finished cannot be set twice.');
					}
					++finished$count;
					this.finished = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
