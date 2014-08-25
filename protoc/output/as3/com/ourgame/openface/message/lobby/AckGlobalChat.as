package com.ourgame.openface.message.lobby {
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
	public dynamic final class AckGlobalChat extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MSGTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.AckGlobalChat.msgType", "msgType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var msgType:uint;

		/**
		 *  @private
		 */
		public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.AckGlobalChat.content", "content", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var content:String;

		/**
		 *  @private
		 */
		public static const SENDER:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.lobby.AckGlobalChat.sender", "sender", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var sender:UInt64;

		/**
		 *  @private
		 */
		public static const RECEIVERS:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("com.ourgame.openface.message.lobby.AckGlobalChat.receivers", "receivers", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var receivers$field:UInt64;

		public function clearReceivers():void {
			receivers$field = null;
		}

		public function get hasReceivers():Boolean {
			return receivers$field != null;
		}

		public function set receivers(value:UInt64):void {
			receivers$field = value;
		}

		public function get receivers():UInt64 {
			return receivers$field;
		}

		/**
		 *  @private
		 */
		public static const SENDERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.lobby.AckGlobalChat.senderName", "senderName", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var senderName$field:String;

		public function clearSenderName():void {
			senderName$field = null;
		}

		public function get hasSenderName():Boolean {
			return senderName$field != null;
		}

		public function set senderName(value:String):void {
			senderName$field = value;
		}

		public function get senderName():String {
			return senderName$field;
		}

		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.AckGlobalChat.result", "result", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var result$field:uint;

		private var hasField$0:uint = 0;

		public function clearResult():void {
			hasField$0 &= 0xfffffffe;
			result$field = new uint();
		}

		public function get hasResult():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set result(value:uint):void {
			hasField$0 |= 0x1;
			result$field = value;
		}

		public function get result():uint {
			return result$field;
		}

		/**
		 *  @private
		 */
		public static const PRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.ourgame.openface.message.lobby.AckGlobalChat.price", "price", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var price$field:uint;

		public function clearPrice():void {
			hasField$0 &= 0xfffffffd;
			price$field = new uint();
		}

		public function get hasPrice():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set price(value:uint):void {
			hasField$0 |= 0x2;
			price$field = value;
		}

		public function get price():uint {
			return price$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.msgType);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.content);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.sender);
			if (hasReceivers) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, receivers$field);
			}
			if (hasSenderName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, senderName$field);
			}
			if (hasResult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, result$field);
			}
			if (hasPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, price$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var msgType$count:uint = 0;
			var content$count:uint = 0;
			var sender$count:uint = 0;
			var receivers$count:uint = 0;
			var senderName$count:uint = 0;
			var result$count:uint = 0;
			var price$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (msgType$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGlobalChat.msgType cannot be set twice.');
					}
					++msgType$count;
					this.msgType = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (content$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGlobalChat.content cannot be set twice.');
					}
					++content$count;
					this.content = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (sender$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGlobalChat.sender cannot be set twice.');
					}
					++sender$count;
					this.sender = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 4:
					if (receivers$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGlobalChat.receivers cannot be set twice.');
					}
					++receivers$count;
					this.receivers = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 5:
					if (senderName$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGlobalChat.senderName cannot be set twice.');
					}
					++senderName$count;
					this.senderName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGlobalChat.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 7:
					if (price$count != 0) {
						throw new flash.errors.IOError('Bad data format: AckGlobalChat.price cannot be set twice.');
					}
					++price$count;
					this.price = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
