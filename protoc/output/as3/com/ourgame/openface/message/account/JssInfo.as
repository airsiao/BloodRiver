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
	public dynamic final class JssInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOMIP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.JssInfo.roomIP", "roomIP", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var roomIP$field:String;

		public function clearRoomIP():void {
			roomIP$field = null;
		}

		public function get hasRoomIP():Boolean {
			return roomIP$field != null;
		}

		public function set roomIP(value:String):void {
			roomIP$field = value;
		}

		public function get roomIP():String {
			return roomIP$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMPORT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.JssInfo.roomPort", "roomPort", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var roomPort$field:String;

		public function clearRoomPort():void {
			roomPort$field = null;
		}

		public function get hasRoomPort():Boolean {
			return roomPort$field != null;
		}

		public function set roomPort(value:String):void {
			roomPort$field = value;
		}

		public function get roomPort():String {
			return roomPort$field;
		}

		/**
		 *  @private
		 */
		public static const REMARK:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.ourgame.openface.message.account.JssInfo.remark", "remark", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var remark$field:String;

		public function clearRemark():void {
			remark$field = null;
		}

		public function get hasRemark():Boolean {
			return remark$field != null;
		}

		public function set remark(value:String):void {
			remark$field = value;
		}

		public function get remark():String {
			return remark$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoomIP) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, roomIP$field);
			}
			if (hasRoomPort) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, roomPort$field);
			}
			if (hasRemark) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, remark$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var roomIP$count:uint = 0;
			var roomPort$count:uint = 0;
			var remark$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (roomIP$count != 0) {
						throw new flash.errors.IOError('Bad data format: JssInfo.roomIP cannot be set twice.');
					}
					++roomIP$count;
					this.roomIP = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (roomPort$count != 0) {
						throw new flash.errors.IOError('Bad data format: JssInfo.roomPort cannot be set twice.');
					}
					++roomPort$count;
					this.roomPort = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (remark$count != 0) {
						throw new flash.errors.IOError('Bad data format: JssInfo.remark cannot be set twice.');
					}
					++remark$count;
					this.remark = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
