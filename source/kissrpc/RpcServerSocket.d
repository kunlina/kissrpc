﻿module kissrpc.RpcServerSocket;

import kissrpc.RpcRecvPackageManage;
import kissrpc.RpcEventInterface;
import kissrpc.RpcSocketBaseInterface;
import kissrpc.Unit;

import std.socket;
import std.stdio;
import std.conv;
import core.thread;


import kiss.net.TcpServer;
import kiss.aio.AsynchronousSocketChannel;
import kiss.aio.ByteBuffer;
import kiss.aio.AsynchronousChannelSelector;

class RpcServerSocket:TcpServer, RpcSocketBaseInterface{

public:
	this(AsynchronousSocketChannel client, RpcEventInterface rpcEventDalegate)
	{
		_socketEventDelegate = rpcEventDalegate;
		_packageManage = new RpcRecvPackageManage(this, rpcEventDalegate);
		super(client, RPC_PACKAGE_MAX);
		_selector = client.getSelector();
		_socketEventDelegate.socketEvent(this, SOCKET_STATUS.SE_CONNECTD, "client inconming....");
	}
	override void onWriteCompleted(void* attachment, size_t count , ByteBuffer buffer) {

	}
	override void onWriteFailed(void* attachment) {
		
		_socketEventDelegate.socketEvent(this, SOCKET_STATUS.SE_WRITE_FAILED, "write data to client is failed");
	}
    override void onReadCompleted(void* attachment, size_t count , ByteBuffer buffer) {
		_packageManage.add(cast(ubyte[])(buffer.getCurBuffer()));
	}
	override void onReadFailed(void* attachment) {

	}
    override void onClose() {
		_socketEventDelegate.socketEvent(this, SOCKET_STATUS.SE_DISCONNECTD, "disconnect from client!");
	}

	void disconnect()
	{
		close();	
	}
	bool write(byte[] buf) {
		super.doWrite(buf);
		return true;
	}

	int getFd() { return cast(int)(fd()); }
	string getIp() { return ip(); }
	string getPort() { return port(); }

public: 
	 AsynchronousChannelSelector _selector;

private:
	RpcEventInterface _socketEventDelegate;
	RpcRecvPackageManage _packageManage;
}

