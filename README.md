hustoj
======
NOTE: All translations are the result of using Google Translator.

<!-- 微信公众号:hustoj -->
wechat public number : hustoj
<img src="http://hustoj.com/wx.jpg" height="180">
HUSTOJ is an GPL FreeSoftware?.
<!--HUSTOJ 是采用GPL的自由软件-->


注意：基于本项目源码从事科研、论文、系统开发，"最好"在文中或系统中表明来自于本项目的内容和创意，否则所有贡献者可能会鄙视你和你的项目。使用本项目源码和freeproblemset题库请尊重程序员职业和劳动。
-> Note: Based on the project's source code for research, thesis, and system development, "best" indicates content and ideas from the project in the text or in the system, otherwise all contributors may despise you and your project. Use the project source code and freeproblemset question bank to respect the programmer's occupation and labor.


论文请引用参考文献[基于开放式云平台的开源在线评测系统设计与实现](http://kns.cnki.net/KCMS/detail/detail.aspx?dbcode=CJFQ&dbname=CJFD2012&filename=JSJA2012S3088&uid=WEEvREcwSlJHSldRa1FhdXNXYXJwcFhRL1Z1Q2lKUDFMNGd0TnJVVlh4bz0=$9A4hF_YAuvQ5obgVAqNKPCYcEjKensW4ggI8Fm4gTkoUKaID8j8gFw!!&v=MjgwNTExVDNxVHJXTTFGckNVUkwyZlllWm1GaURsV3IvQUx6N0JiN0c0SDlPdnJJOU5iSVI4ZVgxTHV4WVM3RGg=)
-> Papers Please cite references

PS: GPL保证你可以合法忽略以上注意事项但不能保证你不受鄙视，呵呵。
-> PS: GPL guarantees that you can legally ignore the above precautions but cannot guarantee that you will not be disdainful.

如果这个项目对你有用，请挥动鼠标，右上角给个Star!
-> If this item is useful to you, please flick the mouse and give it a Star in the upper right corner!

Star us, please!

根据你选择的发行版不同，从下面三个脚本里选一个来用。
-> Depending on the distribution you choose, choose one of the following three scripts to use.

<font color='red'><b>不要相信百度来的长篇大论的所谓教程，那些都是好几年前的老皇历了，会导致不判题，不显示，不好升级等等问题。</b></font>
<font color='red'><b>-> Do not believe that the so-called tutorials of Baidu's lengthy talks are those of the old imperial elixir several years ago. This will lead to problems such as non-judgment, non-display, and bad upgrade.</b></font> 

首先安装Ubuntu14.04（推荐），然后用下面脚本快速安装OJ：  
-> First install Ubuntu14.04 (recommended) and then quickly install OJ using the following script:

    wget https://raw.githubusercontent.com/zhblue/hustoj/master/trunk/install/install-ubuntu14.04.sh
    sudo bash install-ubuntu14.04.sh
  
或者安装ubuntu16.04（不推荐），然后用下面脚本快速安装OJ：  
-> Or install ubuntu16.04 (not recommended), then use the following script to quickly install OJ:

    wget https://raw.githubusercontent.com/zhblue/hustoj/master/trunk/install/install-ubuntu16+.sh
    sudo bash install-ubuntu16+.sh


https://www.youtube.com/watch?v=nlhmfZqyHnA 


假如你不得已非要用centos7 （不推荐），可以用下面脚本快速安装OJ：  
-> If you have to use centos7 (not recommended), you can use the following script to quickly install OJ:

    wget https://raw.githubusercontent.com/zhblue/hustoj/master/trunk/install/install-centos7.sh
    sudo bash install-centos7.sh
    
https://www.youtube.com/watch?v=hRap7ettUWc


<b>安装完成，用admin作为用户名注册一个用户，自动成为管理员。</b>
<b>->After the installation is complete, registering a user with admin as the user name automatically becomes an administrator.</b>
安装后几个重要配置文件的位置
->Position of several important configuration files after installation

    /home/judge/etc/judge.conf
    /home/judge/src/web/include/db_info.inc.php
    /etc/php5/fpm/php.ini 或 /etc/php7.0/fpm/php.ini
    /etc/nginx/sites-enabled/default

REDHAT / CENTOS 用户请浏览 
->REDHAT / CENTOS users please visit

https://github.com/zhblue/hustoj/blob/master/wiki/CentOSx86_64.md

https://github.com/zhblue/hustoj/blob/master/wiki/CentOS.md


docker安装，<b>仅供docker熟练用户参考使用，假如你不知道什么是docker，请假装没看见这一段！</b>
Docker installation, <b>for docker skilled user reference only, if you do not know what docker, please pretend not to see this paragraph!</b>

```	
docker run -d -it \
    -v /data/docker/docker-wxy/data:/data \
    --privileged \
    --name hustoj \
    -p 80:80 shiningrise/hustoj:latest

docker测试安装
->Docker test setup
    docker run -d -it --name hustoj -p 80:80 --privileged shiningrise/hustoj:latest
仅安装C++版本
->Only install C++ version
	docker run -d -it --name hustoj -p 80:80 --privileged shiningrise/hustoj:cpp
```	

树莓派用户请用rpi分支源码手工搭建web，并编译安装core目录下的judged和judge_client。
-> Raspberry Pi users manually build web using rpi branch source code, and compile and install the judged and judge_client under the core directory.

[更多安装方法](https://github.com/zhblue/hustoj/blob/master/trunk/install/README)
-> More installation methods

有问题请先查阅
<b>[FAQ](https://github.com/zhblue/hustoj/blob/master/wiki/FAQ.md)</b> 和
<b>[Wiki](https://github.com/zhblue/hustoj/tree/master/wiki)</b> 或使用搜索引擎。  
-> Please check the FAQ and Wiki or use a search engine if you have problems.

使用上需要帮助，请加用户交流QQ群23361372，仅支持开通支付功能的手机QQ加群，不接受其他方式加群。
->Need to use help, please add users to exchange QQ group 23361372, only support mobile payment QQ plus group to open payment function, do not accept other ways to add groups.

群共享有题库 安装盘 文档 ，群内可以讨论 答疑 。
->The group shared question bank installation disk documents, groups can discuss questions.

新加群，请改群名片，5分钟后可以发言 。
->New Canadian group, please change business cards, you can speak after 5 minutes.

请尊重开源软件开发者的辛苦劳动，出言不逊者将被踢出，群费不退。
->Please respect the hard work of developers of open source software, and those who do not speak out will be kicked out and will not be refunded.

Linux不熟悉的用户推荐使用:
HUSTOJ_LiveCD(关注微信公众号onlinejudge获得百度云下载链接)
->Linux is not familiar with the user recommended to use: HUSTOJ_LiveCD (following WeChat public number onlinejudge obtain Baidu cloud download link)

https://proxy.us.storage.wooden.fish/aria2/hustoj20180331-16.04.iso
https://proxy.us.storage.wooden.fish/aria2/hustoj20180331-14.04.iso

HUSTOJ_Windows（仅支持XP,QQ群23361372共享文件）进行安装。
->HUSTOJ_Windows (supports only XP, QQ group 23361372 shared files) to install.

使用说明见iso中README,也可以参考[LiveCD简介](https://github.com/zhblue/hustoj/tree/master/wiki/HUSTOJ_LiveCD.md)  
->Instructions for use see README in iso, but also refer to LiveCD Introduction

Linux新手请看[鸟哥的私房菜](http://cn.linux.vbird.org/linux_basic/linux_basic.php)
->Linux novice, please see bird brother's private kitchen

建好系统需要题目，请访问[TK题库](http://tk.hustoj.com/)
->Need to build a system, please visit TK Bank

[前台演示](http://hustoj.com/oj/)
->Front desk presentation

后台功能：
->Background function:
<img src="https://raw.githubusercontent.com/zhblue/hustoj/master/wiki/menu.png" >
----------------------
硬件需求：
->Hardware requirements:
<img src="https://raw.githubusercontent.com/zhblue/hustoj/master/wiki/hardware.png" >


