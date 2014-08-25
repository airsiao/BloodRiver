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
	public dynamic final class TablePlayer extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEAT:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.table.TablePlayer.seat", "seat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var seat:int;

		/**
		 *  @private
		 */
		public static const USERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.table.TablePlayer.userId", "userId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var userId:UInt64;

		/**
		 *  @private
		 */
		public static const NICKNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.table.TablePlayer.nickname", "nickname", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var nickname:String;

		/**
		 *  @private
		 */
		public static const SCORE:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("com.ourgame.openface.message.table.TablePlayer.score", "score", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var score:int;

		/**
		 *  @private
		 */
		public static const GENDER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.TablePlayer.gender", "gender", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gender$field:uint;

		private var hasField$0:uint = 0;

		public function clearGender():void {
			hasField$0 &= 0xfffffffe;
			gender$field = new uint();
		}

		public function get hasGender():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set gender(value:uint):void {
			hasField$0 |= 0x1;
			gender$field = value;
		}

		public function get gender():uint {
			return gender$field;
		}

		/**
		 *  @private
		 */
		public static const HEADIMAGE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.table.TablePlayer.headImage", "headImage", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var headImage$field:String;

		public function clearHeadImage():void {
			headImage$field = null;
		}

		public function get hasHeadImage():Boolean {
			return headImage$field != null;
		}

		public function set headImage(value:String):void {
			headImage$field = value;
		}

		public function get headImage():String {
			return headImage$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.TablePlayer.level", "level", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:uint;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffd;
			level$field = new uint();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set level(value:uint):void {
			hasField$0 |= 0x2;
			level$field = value;
		}

		public function get level():uint {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const EXPERIENCE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.table.TablePlayer.experience", "experience", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var experience$field:uint;

		public function clearExperience():void {
			hasField$0 &= 0xfffffffb;
			experience$field = new uint();
		}

		public function get hasExperience():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set experience(value:uint):void {
			hasField$0 |= 0x4;
			experience$field = value;
		}

		public function get experience():uint {
			return experience$field;
		}

		/**
		 *  @private
		 */
		public static const WINRATE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("com.ourgame.openface.message.table.TablePlayer.winRate", "winRate", (9 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var winRate$field:Number;

		public function clearWinRate():void {
			hasField$0 &= 0xfffffff7;
			winRate$field = new Number();
		}

		public function get hasWinRate():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set winRate(value:Number):void {
			hasField$0 |= 0x8;
			winRate$field = value;
		}

		public function get winRate():Number {
			return winRate$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.seat);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.userId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.nickname);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.score);
			if (hasGender) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, gender$field);
			}
			if (hasHeadImage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, headImage$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, level$field);
			}
			if (hasExperience) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, experience$field);
			}
			if (hasWinRate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, winRate$field);
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
			var userId$count:uint = 0;
			var nickname$count:uint = 0;
			var score$count:uint = 0;
			var gender$count:uint = 0;
			var headImage$count:uint = 0;
			var level$count:uint = 0;
			var experience$count:uint = 0;
			var winRate$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seat$count != 0) {
						throw new flash.errors.IOError('Bad data format: TablePlayer.seat cannot be set twice.');
					}
					++seat$count;
					this.seat = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 2:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: TablePlayer.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (nickname$count != 0) {
						throw new flash.errors.IOError('Bad data format: TablePlayer.nickname cannot be set twice.');
					}
					++nickname$count;
					this.nickname = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (score$count != 0) {
						throw new flash.errors.IOError('Bad data format: TablePlayer.score cannot be set twice.');
					}
					++score$count;
					this.score = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 5:
					if (gender$count != 0) {
						throw new flash.errors.IOError('Bad data format: TablePlayer.gender cannot be set twice.');
					}
					++gender$count;
					this.gender = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 6:
					if (headImage$count != 0) {
						throw new flash.errors.IOError('Bad data format: TablePlayer.headImage cannot be set twice.');
					}
					++headImage$count;
					this.headImage = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: TablePlayer.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 8:
					if (experience$count != 0) {
						throw new flash.errors.IOError('Bad data format: TablePlayer.experience cannot be set twice.');
					}
					++experience$count;
					this.experience = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 9:
					if (winRate$count != 0) {
						throw new flash.errors.IOError('Bad data format: TablePlayer.winRate cannot be set twice.');
					}
					++winRate$count;
					this.winRate = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
