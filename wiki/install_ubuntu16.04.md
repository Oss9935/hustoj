# Title

    This show you how to install hustoj in ubuntu 16.04
    이 글은 우분투 16.04 버전에서 hustoj를 설치하는 과정을 설명하는 문서입니다.


# Steps

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

## 1.3  ubuntu 16.o4 install script download (우분투 16.04 설치 스크립트 다운)

    
    $ wget https://raw.githubusercontent.com/zhblue/hustoj/master/trunk/install/install-ubuntu16+.sh
    $ sudo bash install-ubuntu16+.sh


