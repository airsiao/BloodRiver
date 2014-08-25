package com.ourgame.openface.message.chat {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ourgame.openface.message.chat.OGReqChatChannelMsg.MsgType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class OGReqChatChannelMsg extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.ourgame.openface.message.chat.OGReqChatChannelMsg.Type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT, com.ourgame.openface.message.chat.OGReqChatChannelMsg.MsgType);

		private var Type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			Type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			Type$field = value;
		}

		public function get type():int {
			return Type$field;
		}

		/**
		 *  @private
		 */
		public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatChannelMsg.RoleName", "roleName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const SHOWNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatChannelMsg.ShowName", "showName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
			if(!hasShowName) {
				return "";
			}
			return ShowName$field;
		}

		/**
		 *  @private
		 */
		public static const MSG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatChannelMsg.Msg", "msg", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const VOICEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGReqChatChannelMsg.VoiceID", "voiceID", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var VoiceID$field:int;

		public function clearVoiceID():void {
			hasField$0 &= 0xfffffffd;
			VoiceID$field = new int();
		}

		public function get hasVoiceID():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set voiceID(value:int):void {
			hasField$0 |= 0x2;
			VoiceID$field = value;
		}

		public function get voiceID():int {
			return VoiceID$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.ourgame.openface.message.chat.OGReqChatChannelMsg.Time", "time", (6 << 3) | com.netease.protobuf.WireType.VARINT);

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
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, Type$field);
			}
			if (hasRoleName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, RoleName$field);
			}
			if (hasShowName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ShowName$field);
			}
			if (hasMsg) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, Msg$field);
			}
			if (hasVoiceID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, VoiceID$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
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
			var Type$count:uint = 0;
			var RoleName$count:uint = 0;
			var ShowName$count:uint = 0;
			var Msg$count:uint = 0;
			var VoiceID$count:uint = 0;
			var Time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (Type$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelMsg.type cannot be set twice.');
					}
					++Type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (RoleName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelMsg.roleName cannot be set twice.');
					}
					++RoleName$count;
					this.roleName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (ShowName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelMsg.showName cannot be set twice.');
					}
					++ShowName$count;
					this.showName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (Msg$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelMsg.msg cannot be set twice.');
					}
					++Msg$count;
					this.msg = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (VoiceID$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelMsg.voiceID cannot be set twice.');
					}
					++VoiceID$count;
					this.voiceID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (Time$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelMsg.time cannot be set twice.');
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
