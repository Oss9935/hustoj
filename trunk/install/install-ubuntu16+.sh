#!/bin/bash
apt-get update
apt-get install -y subversion

# uid 1536번으로 judge 계정 생성. 계정 추가 시 해당 계정의 home 디렉토리 추가
/usr/sbin/useradd -m -u 1536 judge
cd /home/judge/

# svn checkout (co) — Check out a working copy from a repository.
# /home/judeg/src에 클론받아옴.
svn co https://github.com/zhblue/hustoj/trunk/trunk/  src


apt-get install -y make flex g++ clang libmysqlclient-dev libmysql++-dev php-fpm nginx mysql-server php-mysql php-gd php-zip fp-compiler openjdk-8-jdk mono-devel php-mbstring php-xml

# /etc/mysql/debian.cnf => debian-sys-maint
# debian-sys-maint 사용자는 root와 동일한 권한을 갖는다.
# 이 사용자는 보통  데비안 시스템의 특정 유지 보수 스크립트에서 사용됩니다.
USER=`cat /etc/mysql/debian.cnf |grep user|head -1|awk  '{print $3}'`
PASSWORD=`cat /etc/mysql/debian.cnf |grep password|head -1|awk  '{print $3}'`

# cpu core 설정
CPU=`grep "cpu cores" /proc/cpuinfo |head -1|awk '{print $4}'`

mkdir etc data log

# java.policy 파일은 노드의 JVM에서 실행하는 모든 Java 프로그램에 공유되는 글로벌 기본 정책을 의미한다.
# java.io.FilePermission 설정관련 정책 업데이트
cp src/install/java0.policy  /home/judge/etc

# judge 서버 관련 정보 정의(OJ_HOST_NAME, OJ_USER_NAME, OJ_HTTP_BASEURL, ..._)
cp src/install/judge.conf  /home/judge/etc
chmod +x src/install/ans2out

# judge.conf파일의 디폴트 값 : OJ_SHM_RUN=1
if grep "OJ_SHM_RUN=0" etc/judge.conf ; then
	mkdir run0 run1 run2 run3
	chown www-data run0 run1 run2 run3
fi

#judge.conf 파일 내용 변경
sed -i "s/OJ_USER_NAME=root/OJ_USER_NAME=$USER/g" etc/judge.conf
sed -i "s/OJ_PASSWORD=root/OJ_PASSWORD=$PASSWORD/g" etc/judge.conf
sed -i "s/OJ_COMPILE_CHROOT=1/OJ_COMPILE_CHROOT=0/g" etc/judge.conf
sed -i "s/OJ_RUNNING=1/OJ_RUNNING=$CPU/g" etc/judge.conf

chmod 700 etc/judge.conf

sed -i "s/DB_USER=\"root\"/DB_USER=\"$USER\"/g" src/web/include/db_info.inc.php
sed -i "s/DB_PASS=\"root\"/DB_PASS=\"$PASSWORD\"/g" src/web/include/db_info.inc.php
chmod 700 src/web/include/db_info.inc.php
chown www-data src/web/include/db_info.inc.php
chown www-data src/web/upload data run0 run1 run2 run3
if grep client_max_body_size /etc/nginx/nginx.conf ; then 
	echo "client_max_body_size already added" ;
else
	sed -i "s:include /etc/nginx/mime.types;:client_max_body_size    80m;\n\tinclude /etc/nginx/mime.types;:g" /etc/nginx/nginx.conf
fi

#mysql
# -h. --host=name connect to host
# -u, --user=name User for login if not current user.
# -p password
# jol 데이터베이스 생성(compileinfo, contest, contest_problem, loginlog, mail, news, privilege,
# problem, reply, sim, solution, source_code, topic, users, online, runtimeinfo, custominput, printer, balloon)
# simfilter trigger 생성 및 정의 (sim table에 insert 시 trigger)
mysql -h localhost -u$USER -p$PASSWORD < src/install/db.sql

echo "insert into jol.privilege values('admin','administrator','N');"|mysql -h localhost -u$USER -p$PASSWORD 

# nginx의 DocumentRoot(웹서버의 최상위 폴더)를 /hmoe/judge/src/web 으로 변경
sed -i "s:root /var/www/html;:root /home/judge/src/web;:g" /etc/nginx/sites-enabled/default

# nginx의 default index file 변경
sed -i "s:index index.html:index index.php:g" /etc/nginx/sites-enabled/default
sed -i "s:#location ~ \\\.php\\$:location ~ \\\.php\\$:g" /etc/nginx/sites-enabled/default
sed -i "s:#\tinclude snippets:\tinclude snippets:g" /etc/nginx/sites-enabled/default
sed -i "s|#\tfastcgi_pass unix|\tfastcgi_pass unix|g" /etc/nginx/sites-enabled/default
sed -i "s:}#added_by_hustoj::g" /etc/nginx/sites-enabled/default
sed -i "s|# deny access to .htaccess files|}#added by hustoj\n\n\n\t# deny access to .htaccess files|g" /etc/nginx/sites-enabled/default
/etc/init.d/nginx restart
sed -i "s/post_max_size = 8M/post_max_size = 80M/g" /etc/php/7.0/fpm/php.ini
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 80M/g" /etc/php/7.0/fpm/php.ini

COMPENSATION=`grep 'mips' /proc/cpuinfo|awk -F: '{printf("%.2f",$2/5000)}'`
sed -i "s/OJ_CPU_COMPENSATION=1.0/OJ_CPU_COMPENSATION=$COMPENSATION/g" etc/judge.conf

/etc/init.d/php7.0-fpm restart
service php7.0-fpm restart

# judge 부분 (분석 예정)
cd src/core
chmod +x ./make.sh
./make.sh

# /etc/rc.local : 부팅시 자동 실행할 명령어 리스트
if grep "/usr/bin/judged" /etc/rc.local ; then
	echo "auto start judged added!"
else
	sed -i "s/exit 0//g" /etc/rc.local
	echo "/usr/bin/judged" >> /etc/rc.local
	echo "exit 0" >> /etc/rc.local
fi
if grep "bak.sh" /var/spool/cron/crontabs/root ; then
	echo "auto backup added!"
else
	echo "1 0 * * * /home/judge/src/install/bak.sh" >> /var/spool/cron/crontabs/root
fi
ln -s /usr/bin/mcs /usr/bin/gmcs

/usr/bin/judged
