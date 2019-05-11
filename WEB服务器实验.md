# WEB服务器实验

## 零.环境配置:

### 1.虚拟机/主机配置：

主机环境：Win10

虚拟机环境：Ubuntu18 server版

网卡：Host-only：192.168.56.5

​            Nat：10.0.2.15

虚拟机网络拓扑结构：



### 2.配置Nginx：

安装Nginx：

```shell
# install nginx
sudo apt install nginx
```

启动Nginx：

```shell
# start nginx 
sudo systemctl start nginx
```

默认监听80端口，不需再次配置。

### 3.配置杂项：

安装MySQL：

```shell
# install mysql
sudo apt install mysql-server
```

安装PHP：

```shell
# install php进程管理器，php-mysql
sudo apt install php-fpm php-mysql
```

修改Nginx配置PHP-FPM进程的反向代理配置在Nginx服务器上，保存退出：

```shell
sudo vim /etc/nginx/sites-enabled/default

     location ~ \.php$ {
         include snippets/fastcgi-php.conf;
          fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
     }
```

```shell
# 重新启动nginx使配置生效
sudo systemctl restart nginx
```

### 4.配置VeryNginx：

安装各种依赖：

python3依赖，

首先git clone仓库:

<https://github.com/alexazhou/VeryNginx/blob/master/readme_zh.md>(Readme.md)

```shell
# git clone
git clone https://github.com/alexazhou/VeryNginx.git
```

在文件夹中有python的安装文件install.py：

```shell
# install VeryNginx
python install.py install
```



## 一.实验要求：

### 1.基本要求：

1.在一台主机（虚拟机）上同时配置Nginx和VeryNginx

- VeryNginx作为本次实验的Web App的反向代理服务器和WAF
- PHP-FPM进程的反向代理配置在nginx服务器上，VeryNginx服务器不直接配置Web站点服务

2.使用[Wordpress](https://wordpress.org/)搭建的站点对外提供访问的地址为： https://wp.sec.cuc.edu.cn

3.使用[Damn Vulnerable Web Application (DVWA)](http://www.dvwa.co.uk/)搭建的站点对外提供访问的地址为： http://dvwa.sec.cuc.edu.cn

### 2.安全加固要求：

1.使用IP地址方式均无法访问上述任意站点，并向访客展示自定义的**友好错误提示信息页面-1**

2.[Damn Vulnerable Web Application (DVWA)](http://www.dvwa.co.uk/)只允许白名单上的访客来源IP，其他来源的IP访问均向访客展示自定义的**友好错误提示信息页面-2**

3.在不升级Wordpress版本的情况下，通过定制[VeryNginx](https://github.com/alexazhou/VeryNginx)的访问控制策略规则，**热**修复[WordPress < 4.7.1 - Username Enumeration](https://www.exploit-db.com/exploits/41497/)

4.通过配置[VeryNginx](https://github.com/alexazhou/VeryNginx)的Filter规则实现对[Damn Vulnerable Web Application (DVWA)](http://www.dvwa.co.uk/)的SQL注入实验在低安全等级条件下进行防护

### 3.VERYNGINX配置要求

1.[VeryNginx](https://github.com/alexazhou/VeryNginx)的Web管理页面仅允许白名单上的访客来源IP，其他来源的IP访问均向访客展示自定义的**友好错误提示信息页面-3**

2.通过定制VeryNginx的访问控制策略规则实现：

- 限制DVWA站点的单IP访问速率为每秒请求数 < 50
- 限制Wordpress站点的单IP访问速率为每秒请求数 < 20
- 超过访问频率限制的请求直接返回自定义**错误提示信息页面-4**
- 禁止curl访问





