# Proxy Lab

并发 Web 代理服务器实验。

## 实验概述

Proxy Lab 要求学生实现一个支持并发的 Web 代理服务器。代理服务器作为客户端和服务器之间的中介，接收客户端的 HTTP 请求，转发给目标服务器，然后将响应返回给客户端。

实验分为三个部分：
- **Part I**: 实现基本的顺序代理
- **Part II**: 添加并发支持
- **Part III**: 实现缓存机制

通过这个实验，学生将：
- 学习网络编程和套接字接口
- 掌握并发编程（多线程）
- 理解 HTTP 协议
- 实现 LRU 缓存算法
- 处理同步和线程安全问题

## 📄 实验文档

- [实验说明文档 (PDF)](/labs/proxylab/proxylab.pdf)
- [README](/labs/proxylab/README)

## 💻 实验文件

### 主要文件

- **proxy.c** - 需要实现的代理服务器（框架代码）[查看](/labs/proxylab/proxy.c)
- **csapp.c/h** - CSAPP 包装函数库 [查看源码](/labs/proxylab/csapp.c) | [查看头文件](/labs/proxylab/csapp.h)

### 测试工具

- **driver.sh** - 自动评分脚本 [查看](/labs/proxylab/driver.sh)
- **nop-server.py** - 简单的测试服务器 [查看](/labs/proxylab/nop-server.py)
- **free-port.sh** - 端口检查工具 [查看](/labs/proxylab/free-port.sh)
- **port-for-user.pl** - 端口分配工具 [查看](/labs/proxylab/port-for-user.pl)

### 参考实现

- **tiny/** - Tiny Web 服务器（参考实现）

### 编译文件

- **Makefile** - 编译配置文件 [查看](/labs/proxylab/Makefile)

## 🚀 快速开始

```bash
# 编译代理服务器
make

# 运行代理（监听端口 15213）
./proxy 15213

# 在另一个终端测试
curl --proxy http://localhost:15213 http://www.example.com

# 运行自动测试
./driver.sh

# 使用 Tiny 服务器测试
cd tiny
make
./tiny 8000  # 在端口 8000 启动服务器
```

## 🔑 实现部分

### Part I: 基本顺序代理

实现一个能够处理简单 HTTP/1.0 GET 请求的代理：
- 解析客户端请求
- 转发请求到目标服务器
- 接收服务器响应
- 转发响应给客户端

### Part II: 并发代理

使用多线程处理并发请求：
- 为每个客户端连接创建新线程
- 使用线程分离（pthread_detach）
- 正确处理竞争条件
- 避免内存泄漏

### Part III: 缓存

实现一个 LRU（最近最少使用）缓存：
- 缓存近期访问的对象
- 实现缓存大小限制（MAX_CACHE_SIZE）
- 实现单个对象大小限制（MAX_OBJECT_SIZE）
- 使用读写锁保证线程安全
- 实现 LRU 驱逐策略

## 💡 实现提示

### HTTP 请求处理
```c
// 解析请求行
GET http://www.example.com:8000/index.html HTTP/1.1

// 需要提取：
// - 方法: GET
// - 主机: www.example.com
// - 端口: 8000
// - 路径: /index.html
```

### 并发处理
- 使用 `pthread_create()` 创建线程
- 使用 `pthread_detach()` 分离线程
- 传递参数时注意内存管理

### 缓存设计
- 使用链表或其他数据结构
- 实现读者-写者锁
- 维护 LRU 顺序
- 注意缓存一致性

## 🔍 调试技巧

### 使用 curl 测试
```bash
# 通过代理访问
curl --proxy http://localhost:15213 http://www.google.com

# 查看详细信息
curl -v --proxy http://localhost:15213 http://www.example.com
```

### 使用 telnet 测试
```bash
telnet localhost 15213
GET http://www.example.com/index.html HTTP/1.0

```

### 常用浏览器设置
配置浏览器使用代理：localhost:15213

## ⚠️ 注意事项

- 只需要支持 HTTP/1.0 GET 方法
- 正确处理各种 HTTP 头部
- 注意健壮性（处理错误、超时等）
- 避免缓冲区溢出
- 正确管理文件描述符

## 📊 性能要求

- 能够同时处理多个并发请求
- 缓存能够显著提高性能
- 通过所有自动测试用例

## 📦 下载全部文件

- [查看 GitHub 目录](https://github.com/rwangrwang31/CSAPP-Labs/tree/main/labs/proxylab)
- 下载整个仓库后在 `labs/proxylab/` 目录中查找
