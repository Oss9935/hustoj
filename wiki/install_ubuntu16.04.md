# 0. Title

    This show you how to install hustoj in ubuntu 16.04
    이 글은 우분투 16.04 버전에서 hustoj를 설치하는 과정을 설명하는 문서입니다.


# 1. Steps

## 1.1 ubuntu version check (우분투 배포판 버전 확인)

    
    $ lsb_release -a
    
    \No LSB modules are available.
    Distributor ID: Ubuntu
    Description:    Ubuntu 16.04.4 LTS
    Release:    16.04
    Codename:   xenial



## 1.2 project clone (프로젝트 클론)

    
    $ git clone https://github.com/zhblue/hustoj.git
    $ cd hustoj/trunk/install



## 1.3 ubuntu 16.o4 install script download (우분투 16.04 설치 스크립트 다운)

If install script already in your project, you don't need to install another one.

해당 디렉토리에 이미 스크립트가 존재한다면 추가적으로 다운로드 받으실 필요가 없습니다.

    
    $ wget https://raw.githubusercontent.com/zhblue/hustoj/master/trunk/install/install-ubuntu16+.sh



## 1.4 run install script (설치 스크립트 실행) 

If you aleady run webserver on 80 port(eg. apache2), you should have to halt it before run install script.

이미 80포트에 웹서버가 돌고있다면 설치스크립트 실행 전에 정지해주셔야합니다.
    
The warnging message which you met during installation will not influence to result. So It will be OK to ignore it.

설치중에 발생하는 warning 메시지들을 설치 결과에는 영향을 주지 않기 때문에 무시하셔도 괜찮습니다.

    $ sudo service apache2 stop(additional. if you use apache2)
    $ sudo bash install-ubuntu16+.sh


## 1.5 enjoy hustoj(설치 완료)

Go on your webbrowser and type localhost in browser's address bar. And then you can see main page of hustoj.



# 2. trouble shooting

## 2.1 nginx error

During installation I encountered a problem which gives me an error message below.

    ● nginx.service - A high performance web server and a reverse proxy server
    Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
    Active: failed (Result: exit-code) since Sun 2018-04-08 16:33:56 PDT; 8ms ago
    Process: 15312 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=1/FAILURE)
    Process: 15302 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)

I think this message means that you aleady use other websever on your 80 port.
So it can be easily resolved with stopping an another server which aleady running on your system. Type following command.

    $ sudo service apache2 stop

After stop that webserver(eg. apache2), you can reinstall nginx easily following command.

    $ sudo aptitude install software-properties-common;
    $ sudo add-apt-repository ppa:nginx/development;
    $ sudo apt-get update;
    $ sudo apt-get install nginx;

An then just reexcute install-ubuntu16.sh

