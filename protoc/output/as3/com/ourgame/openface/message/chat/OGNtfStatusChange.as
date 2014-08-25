package com.ourgame.openface.message.chat {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.chat.OGNtfStatusChange.ActionType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class OGNtfStatusChange extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGNtfStatusChange.RoleName", "roleName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var RoleName$field:String;

		public function clearRoleName():void {
			RoleName$field = null;
		}

		public function get hasRoleName():Boolean {
			return RoleName$field != null;
		}

		public function set roleName(value:String):void {
			RoleName$field = value;
		}

		public function get roleName():String {
			return RoleName$field;
		}

		/**
		 *  @private
		 */
		public static const SHOWNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGNtfStatusChange.ShowName", "showName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var ShowName$field:String;

		public function clearShowName():void {
			ShowName$field = null;
		}

		public function get hasShowName():Boolean {
			return ShowName$field != null;
		}

		public function set showName(value:String):void {
			ShowName$field = value;
		}

		public function get showName():String {
			return ShowName$field;
		}

		/**
		 *  @private
		 */
		public static const ACTION:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.ourgame.openface.message.chat.OGNtfStatusChange.Action", "action", (3 << 3) | com.netease.protobuf.WireType.VARINT, com.ourgame.openface.message.chat.OGNtfStatusChange.ActionType);

		private var Action$field:int;

		private var hasField$0:uint = 0;

		public function clearAction():void {
			hasField$0 &= 0xfffffffe;
			Action$field = new int();
		}

		public function get hasAction():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set action(value:int):void {
			hasField$0 |= 0x1;
			Action$field = value;
		}

		public function get action():int {
			return Action$field;
		}

		/**
		 *  @private
		 */
		public static const MSG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGNtfStatusChange.Msg", "msg", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var Msg$field:String;

		public function clearMsg():void {
			Msg$field = null;
		}

		public function get hasMsg():Boolean {
			return Msg$field != null;
		}

		public function set msg(value:String):void {
			Msg$field = value;
		}

		public function get msg():String {
			return Msg$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.ourgame.openface.message.chat.OGNtfStatusChange.Time", "time", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Time$field:Int64;

		public function clearTime():void {
			Time$field = null;
		}

		public function get hasTime():Boolean {
			return Time$field != null;
		}

		public function set time(value:Int64):void {
			Time$field = value;
		}

		public function get time():Int64 {
			return Time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoleName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, RoleName$field);
			}
			if (hasShowName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ShowName$field);
			}
			if (hasAction) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, Action$field);
			}
			if (hasMsg) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, Msg$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, Time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var RoleName$count:uint = 0;
			var ShowName$count:uint = 0;
			var Action$count:uint = 0;
			var Msg$count:uint = 0;
			var Time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (RoleName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfStatusChange.roleName cannot be set twice.');
					}
					++RoleName$count;
					this.roleName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (ShowName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfStatusChange.showName cannot be set twice.');
					}
					++ShowName$count;
					this.showName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (Action$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfStatusChange.action cannot be set twice.');
					}
					++Action$count;
					this.action = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 4:
					if (Msg$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfStatusChange.msg cannot be set twice.');
					}
					++Msg$count;
					this.msg = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (Time$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGNtfStatusChange.time cannot be set twice.');
					}
					++Time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
