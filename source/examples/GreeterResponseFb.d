// automatically generated by the FlatBuffers compiler, do not modifymodule import std.typecons;
module example.GreeterResponseFb;
import flatbuffers;

struct GreeterResponseFb {
	mixin Table!GreeterResponseFb;

  static GreeterResponseFb getRootAsGreeterResponseFb(ByteBuffer _bb) {  return GreeterResponseFb.init_(_bb.get!int(_bb.position()) + _bb.position(), _bb); }
	@property Nullable!string msg() { uint o = __offset(4); return o != 0 ? Nullable!string(__string(o + _pos)) : Nullable!string.init; }

	static uint createGreeterResponseFb(FlatBufferBuilder builder,uint msg) {
		builder.startObject(1);
		GreeterResponseFb.addMsg(builder, msg);
		return GreeterResponseFb.endGreeterResponseFb(builder);
	}

	static void startGreeterResponseFb(FlatBufferBuilder builder) { builder.startObject(1); }
	static void addMsg(FlatBufferBuilder builder, uint msgOffset) { builder.addOffset(0, msgOffset, 0); }
	static uint endGreeterResponseFb(FlatBufferBuilder builder) {
		uint o = builder.endObject();
		return o;
	}
}

