package com.ourgame.openface.message.account {
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
	public dynamic final class ReqGameLogin extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.ReqGameLogin.userName", "userName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var userName:String;

		/**
		 *  @private
		 */
		public static const PASSWORD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.ReqGameLogin.password", "password", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var password:String;

		/**
		 *  @private
		 */
		public static const TERMINAL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.account.ReqGameLogin.terminal", "terminal", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var terminal:int;

		/**
		 *  @private
		 */
		public static const DEVICENUMBER:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.ReqGameLogin.deviceNumber", "deviceNumber", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var deviceNumber:String;

		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ourgame.openface.message.account.ReqGameLogin.gameId", "gameId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gameId:int;

		/**
		 *  @private
		 */
		public static const COMEFROM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.ReqGameLogin.comeFrom", "comeFrom", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var comeFrom:String;

		/**
		 *  @private
		 */
		public static const TOKEN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.ReqGameLogin.token", "token", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var token:String;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.userName);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.password);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.terminal);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.deviceNumber);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.gameId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.comeFrom);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.token);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var userName$count:uint = 0;
			var password$count:uint = 0;
			var terminal$count:uint = 0;
			var deviceNumber$count:uint = 0;
			var gameId$count:uint = 0;
			var comeFrom$count:uint = 0;
			var token$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (userName$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqGameLogin.userName cannot be set twice.');
					}
					++userName$count;
					this.userName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (password$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqGameLogin.password cannot be set twice.');
					}
					++password$count;
					this.password = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (terminal$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqGameLogin.terminal cannot be set twice.');
					}
					++terminal$count;
					this.terminal = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (deviceNumber$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqGameLogin.deviceNumber cannot be set twice.');
					}
					++deviceNumber$count;
					this.deviceNumber = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (gameId$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqGameLogin.gameId cannot be set twice.');
					}
					++gameId$count;
					this.gameId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (comeFrom$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqGameLogin.comeFrom cannot be set twice.');
					}
					++comeFrom$count;
					this.comeFrom = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (token$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReqGameLogin.token cannot be set twice.');
					}
					++token$count;
					this.token = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
