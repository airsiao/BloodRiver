package com.ourgame.openface.message.chat {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class OGReqChatChannelLogin extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const VERSION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.ourgame.openface.message.chat.OGReqChatChannelLogin.Version", "version", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Version$field:Int64;

		public function clearVersion():void {
			Version$field = null;
		}

		public function get hasVersion():Boolean {
			return Version$field != null;
		}

		public function set version(value:Int64):void {
			Version$field = value;
		}

		public function get version():Int64 {
			if(!hasVersion) {
				return new Int64(0, 0);
			}
			return Version$field;
		}

		/**
		 *  @private
		 */
		public static const CHANNELID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGReqChatChannelLogin.ChannelID", "channelID", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ChannelID$field:int;

		private var hasField$0:uint = 0;

		public function clearChannelID():void {
			hasField$0 &= 0xfffffffe;
			ChannelID$field = new int();
		}

		public function get hasChannelID():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set channelID(value:int):void {
			hasField$0 |= 0x1;
			ChannelID$field = value;
		}

		public function get channelID():int {
			if(!hasChannelID) {
				return -1;
			}
			return ChannelID$field;
		}

		/**
		 *  @private
		 */
		public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatChannelLogin.RoleName", "roleName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const SHOWNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatChannelLogin.ShowName", "showName", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const CHANNEROOMLID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.chat.OGReqChatChannelLogin.ChanneRoomlID", "channeRoomlID", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ChanneRoomlID$field:int;

		public function clearChanneRoomlID():void {
			hasField$0 &= 0xfffffffd;
			ChanneRoomlID$field = new int();
		}

		public function get hasChanneRoomlID():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set channeRoomlID(value:int):void {
			hasField$0 |= 0x2;
			ChanneRoomlID$field = value;
		}

		public function get channeRoomlID():int {
			if(!hasChanneRoomlID) {
				return 0;
			}
			return ChanneRoomlID$field;
		}

		/**
		 *  @private
		 */
		public static const CERTSTREAM:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("com.ourgame.openface.message.chat.OGReqChatChannelLogin.CertStream", "certStream", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var CertStream$field:flash.utils.ByteArray;

		public function clearCertStream():void {
			CertStream$field = null;
		}

		public function get hasCertStream():Boolean {
			return CertStream$field != null;
		}

		public function set certStream(value:flash.utils.ByteArray):void {
			CertStream$field = value;
		}

		public function get certStream():flash.utils.ByteArray {
			return CertStream$field;
		}

		/**
		 *  @private
		 */
		public static const ENTERMSG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatChannelLogin.EnterMsg", "enterMsg", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var EnterMsg$field:String;

		public function clearEnterMsg():void {
			EnterMsg$field = null;
		}

		public function get hasEnterMsg():Boolean {
			return EnterMsg$field != null;
		}

		public function set enterMsg(value:String):void {
			EnterMsg$field = value;
		}

		public function get enterMsg():String {
			if(!hasEnterMsg) {
				return "";
			}
			return EnterMsg$field;
		}

		/**
		 *  @private
		 */
		public static const LEAVEMSG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.chat.OGReqChatChannelLogin.LeaveMsg", "leaveMsg", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var LeaveMsg$field:String;

		public function clearLeaveMsg():void {
			LeaveMsg$field = null;
		}

		public function get hasLeaveMsg():Boolean {
			return LeaveMsg$field != null;
		}

		public function set leaveMsg(value:String):void {
			LeaveMsg$field = value;
		}

		public function get leaveMsg():String {
			if(!hasLeaveMsg) {
				return "";
			}
			return LeaveMsg$field;
		}

		/**
		 *  @private
		 */
		public static const USESHOWNAME:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("com.ourgame.openface.message.chat.OGReqChatChannelLogin.UseShowName", "useShowName", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var UseShowName$field:Boolean;

		public function clearUseShowName():void {
			hasField$0 &= 0xfffffffb;
			UseShowName$field = new Boolean();
		}

		public function get hasUseShowName():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set useShowName(value:Boolean):void {
			hasField$0 |= 0x4;
			UseShowName$field = value;
		}

		public function get useShowName():Boolean {
			if(!hasUseShowName) {
				return false;
			}
			return UseShowName$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasVersion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, Version$field);
			}
			if (hasChannelID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ChannelID$field);
			}
			if (hasRoleName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, RoleName$field);
			}
			if (hasShowName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ShowName$field);
			}
			if (hasChanneRoomlID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ChanneRoomlID$field);
			}
			if (hasCertStream) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, CertStream$field);
			}
			if (hasEnterMsg) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, EnterMsg$field);
			}
			if (hasLeaveMsg) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, LeaveMsg$field);
			}
			if (hasUseShowName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, UseShowName$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var Version$count:uint = 0;
			var ChannelID$count:uint = 0;
			var RoleName$count:uint = 0;
			var ShowName$count:uint = 0;
			var ChanneRoomlID$count:uint = 0;
			var CertStream$count:uint = 0;
			var EnterMsg$count:uint = 0;
			var LeaveMsg$count:uint = 0;
			var UseShowName$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (Version$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelLogin.version cannot be set twice.');
					}
					++Version$count;
					this.version = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (ChannelID$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelLogin.channelID cannot be set twice.');
					}
					++ChannelID$count;
					this.channelID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (RoleName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelLogin.roleName cannot be set twice.');
					}
					++RoleName$count;
					this.roleName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (ShowName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelLogin.showName cannot be set twice.');
					}
					++ShowName$count;
					this.showName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (ChanneRoomlID$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelLogin.channeRoomlID cannot be set twice.');
					}
					++ChanneRoomlID$count;
					this.channeRoomlID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (CertStream$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelLogin.certStream cannot be set twice.');
					}
					++CertStream$count;
					this.certStream = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 7:
					if (EnterMsg$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelLogin.enterMsg cannot be set twice.');
					}
					++EnterMsg$count;
					this.enterMsg = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					if (LeaveMsg$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelLogin.leaveMsg cannot be set twice.');
					}
					++LeaveMsg$count;
					this.leaveMsg = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (UseShowName$count != 0) {
						throw new flash.errors.IOError('Bad data format: OGReqChatChannelLogin.useShowName cannot be set twice.');
					}
					++UseShowName$count;
					this.useShowName = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
