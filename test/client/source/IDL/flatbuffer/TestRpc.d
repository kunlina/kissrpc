// automatically generated by the FlatBuffers compiler, do not modify

module kissrpc.IDL.flatbuffer.TestRpc;

import std.typecons;
import flatbuffers;

struct UserInfoFB {
	mixin Table!UserInfoFB;

  static UserInfoFB getRootAsUserInfoFB(ByteBuffer _bb) {  return UserInfoFB.init_(_bb.get!int(_bb.position()) + _bb.position(), _bb); }
	@property int i() { uint o = __offset(4); return o != 0 ? _buffer.get!int(o + _pos) : 0; }
	@property Nullable!string name() { uint o = __offset(6); return o != 0 ? Nullable!string(__string(o + _pos)) : Nullable!string.init; }

	static uint createUserInfoFB(FlatBufferBuilder builder,int i,uint name) {
		builder.startObject(2);
		UserInfoFB.addName(builder, name);
		UserInfoFB.addI(builder, i);
		return UserInfoFB.endUserInfoFB(builder);
	}

	static void startUserInfoFB(FlatBufferBuilder builder) { builder.startObject(2); }
	static void addI(FlatBufferBuilder builder, int i) { builder.add!int(0, i, 0); }
	static void addName(FlatBufferBuilder builder, uint nameOffset) { builder.addOffset(1, nameOffset, 0); }
	static uint endUserInfoFB(FlatBufferBuilder builder) {
		uint o = builder.endObject();
		return o;
	}
}

