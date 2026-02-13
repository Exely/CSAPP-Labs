# 家庭作业

## 练习题 11.6

{% tabs %}
{% tab title="练习题 11.6" %}
A. 修改 TINY 使得它会原样返回每个请求行和请求报头。

B. 使用你喜欢的浏览器向 TINY 发送一个对静态内容的请求。把 TINY 的输出记录到一个文件中。

C. 检查 TINY 的输出，确定你的浏览器使用的 HTTP 的版本。

D. 参考 RFC 2616 中的 HTTP/1.1 标准，确定你的浏览器的 HTTP 请求中每个报头的含义。你可以从 **www.rfc-editor.org/rfc.html** 获得 RFC 2616。
{% endtab %}
{% endtabs %}

## 练习题 11.7

{% tabs %}
{% tab title="练习题 11.7" %}
扩展 TINY，使得它可以提供 MPG 视频文件。用一个真正的浏览器来检验你的工作。
{% endtab %}
{% endtabs %}

## 练习题 11.8

{% tabs %}
{% tab title="练习题 11.8" %}
修改 TINY，使得它在 SIGCHLD 处理程序中回收操作系统分配给 CGI 子进程的资源，而不是显式地等待它们终止。
{% endtab %}
{% endtabs %}

## 练习题 11.9

{% tabs %}
{% tab title="练习题 11.9" %}
修改 TINY，使得当它服务静态内容时，使用 malloc、rio\_readn 和而不是 mmap 和 rio\_writen 来复制被请求文件到已连接描述符。
{% endtab %}
{% endtabs %}

## 练习题 11.10

{% tabs %}
{% tab title="练习题 11.10" %}
A. 写出图 11-27 中 CGI adder 函数的 HTML 表单。你的表单应謗包括两个文本框，用户将需要相加的两个数字填在这两个文本框中。你的表单应该使用 GET 方法请求内容。

B. 用这样的方法来检查你的程序：使用一个真正的浏览器向 TINY 请求表单，向 TINY 提交填写好的表单，然后显示 adder 生成的动态内容。
{% endtab %}
{% endtabs %}

## 练习题 11.11

{% tabs %}
{% tab title="练习题 11.11" %}
扩展 TINY，以支持 HTTP HEAD 方法。使用 TELNET 作为 Web 客户端来验证你的工作。
{% endtab %}
{% endtabs %}

## 练习题 11.12

{% tabs %}
{% tab title="练习题 11.12" %}
扩展 TINY，使得它服务以 HTTP POST 方式请求的动态内容。用你喜欢的 Web 浏览器来验证你的工作。
{% endtab %}
{% endtabs %}

## 练习题 11.13

{% tabs %}
{% tab title="练习题 11.13" %}
修改 TINY，使得它可以干净地处理（而不是终止）在 write 函数试图写一个过早关闭的连接时发生的 SIGPIPE 信号和 EPIPE 错误。
{% endtab %}
{% endtabs %}





