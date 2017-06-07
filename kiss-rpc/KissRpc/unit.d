﻿module KissRpc.unit;


const ubyte[8] RPC_HANDER_MAGIC = [0xaa, 0xbb, 0xcc, 0xdd, 0xaa, 0xaa, 0xaa, 0xff];
const short RPC_HANDER_VERSION = 0x0001;
const ulong RPC_PACKAGE_MAX = 8*1024;

const uint RPC_REQUEST_TIMEOUT_SECONDS = 20;
shared ulong RPC_SYSTEM_TIMESTAMP = 0;

const uint RPC_CLIENT_DEFAULT_THREAD_POOL = 1;