# Getting started with Docker 

## If deployment is gonna happend 

<img src="app.png">

## problems 

<img src="hard.png">

## solution to bare-metal based deployment is Virtualization 

<img src="vm.png">

##  problem with VM & Baremetal with respect to OS 

<img src="os.png">

# Introduction to containers 

<img src="container.png">

## hypervisor vs CRE 

<img src="cre.png">

## Docker with Kernel 

<img src="docker.png">

## Docker installation in Windows 10 & mac using Docker desktop 

### docker desktop for MAC

[maclink]('https://hub.docker.com/editions/community/docker-ce-desktop-mac')

### docker desktop for Windows 10 

[w10link]('https://hub.docker.com/editions/community/docker-ce-desktop-windows/')

# Docker Architecutre. 

### checking docker client side software 

```
❯ docker  version
Client: Docker Engine - Community
 Cloud integration: 1.0.7
 Version:           20.10.2
 API version:       1.41
 Go version:        go1.13.15
 Git commit:        2291f61
 Built:             Mon Dec 28 16:12:42 2020
 OS/Arch:           darwin/amd64
 Context:           default
 Experimental:      true


OR 

❯ docker  -v
Docker version 20.10.2, build 2291f61



```


## IF you have Docker desktop and that is running fine you will see this output 

```
❯ docker  version
Client: Docker Engine - Community
 Cloud integration: 1.0.7
 Version:           20.10.2
 API version:       1.41
 Go version:        go1.13.15
 Git commit:        2291f61
 Built:             Mon Dec 28 16:12:42 2020
 OS/Arch:           darwin/amd64
 Context:           default
 Experimental:      true

Server: Docker Engine - Community
 Engine:
  Version:          20.10.2
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.13.15
  Git commit:       8891c58
  Built:            Mon Dec 28 16:15:28 2020
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.4.3
  GitCommit:        269548fa27e0089a8b8278fc4fc781d7f65a939b
 runc:
  Version:          1.0.0-rc92
  GitCommit:        ff819c7e9184c13b7c2607fe6c30ae19403a7aff
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0

```

## Now only Installing and starting docker engine on AWS cloud in a linux VM 

### step 1 

```
[root@ip-172-31-86-132 ~]# yum  install docker  -y
Failed to set locale, defaulting to C
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
amzn2-core                                                                                | 3.7 kB  00:00:00     
Resolving Dependencies
--> Running transaction check
---> Package docker.x86_64 0:19.03.13ce-1.amzn2 will be installed
--> Processing Dependency: runc >= 1.0.0 for package: docker-19.03.13ce-1.amzn2.x86_64
--> Processing Dependency: containerd >= 1.3.2 for package: docker-19.03.13ce-1.amzn2.x86_64
--> Processing Dependency: pigz for package: docker-19.03.13ce-1.amzn2.x86_64
--> Processing Dependency: libcgroup for package: docker-19.03.13ce-1.amzn2.x86_64
--> Running transaction check
---> Package containerd.x86_64 0:1.4.1-2.amzn2 will be installed
---> Package libcgroup.x86_64 0:0.41-21.amzn2 will be installed
---> Package pigz.x86_64 0:2.3.4-1.amzn2.0.1 will be installed
---> Package runc.x86_64 0:1.0.0-0.1.20200826.gitff819c7.amzn2 will be installed
--> Finished Dependency Resolution


```

### step 2  COnfigure Docker engine to accept remote client request 

```
[root@ip-172-31-86-132 ~]# cd  /etc/sysconfig/
[root@ip-172-31-86-132 sysconfig]# ls
acpid       console         grub        man-db           nfs            rpcbind    sshd
atd         cpupower        i18n        modules          raid-check     rsyncd     sysstat
authconfig  crond           init        netconsole       rdisc          rsyslog    sysstat.ioconf
chronyd     docker          irqbalance  network          readonly-root  run-parts
clock       docker-storage  keyboard    network-scripts  rpc-rquotad    selinux
[root@ip-172-31-86-132 sysconfig]# vim docker
[root@ip-172-31-86-132 sysconfig]# cat  docker
# The max number of open files for the daemon itself, and all
# running containers.  The default value of 1048576 mirrors the value
# used by the systemd service unit.
DAEMON_MAXFILES=1048576

# Additional startup options for the Docker daemon, for example:
# OPTIONS="--ip-forward=true --iptables=true"
# By default we limit the number of open files per container
OPTIONS="--default-ulimit nofile=1024:4096 -H tcp://0.0.0.0:2375"

# How many seconds the sysvinit script waits for the pidfile to appear
# when starting the daemon.
DAEMON_PIDFILE_TIMEOUT=10
[root@ip-172-31-86-132 sysconfig]# systemctl daemon-reload 
[root@ip-172-31-86-132 sysconfig]# systemctl restart docker 
[root@ip-172-31-86-132 sysconfig]# systemctl enable  docker 
Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.


```

## ANy OS client can connect to remote Docker engine using context logic

```
9975  docker  context  create  training   --docker  host="tcp://54.204.22.14:2375"
 9976  history
 9977  docker  context  ls
 9978  docker  context  use  training 
 9979  docker  context  ls
 9980  history
 9981  docker  context  ls

```

## ANother method for connecting to remote DOcker engine 

### For windows powershell 

```
 $env:DOCKER_HOST="tcp://54.204.22.14:2375"
```

### For linux / mac client 

```
export DOCKER_HOST="tcp://54.204.22.14:2375"
```

## Container creation process 

<img src="cont.png">

## Docker images from. Docker hub 

<img src="dockerhub.png">

### PUlling first docker image from Docker HUb 

```
❯ docker  images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
❯ docker  pull  oraclelinux:8.3
8.3: Pulling from library/oraclelinux
230d257ffbc9: Pull complete 
Digest: sha256:7640e89a4a47b71132d66546acf73741d21353149a5c523c6cd4e84fb860d30a
Status: Downloaded newer image for oraclelinux:8.3
docker.io/library/oraclelinux:8.3
❯ 
❯ docker  images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
oraclelinux   8.3       d8ccb1b24024   4 weeks ago   223MB


```

## some more images

```
10005  docker  pull  busybox  
10006  docker  pull  alpine 
10007  docker  pull  mysql 
❯ docker  images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
mysql         latest    8457e9155715   9 days ago    546MB
busybox       latest    491198851f0c   2 weeks ago   1.23MB
alpine        latest    28f6e2705743   2 weeks ago   5.61MB
oraclelinux   8.3       d8ccb1b24024   4 weeks ago   223MB
❯ 

```

## SOme internal about docker ENgine side 

```
[root@ip-172-31-86-132 sysconfig]# cd  /var/lib/docker/
[root@ip-172-31-86-132 docker]# ls
builder  buildkit  containers  image  network  overlay2  plugins  runtimes  swarm  tmp  trust  volumes
[root@ip-172-31-86-132 docker]# cd  image/
[root@ip-172-31-86-132 image]# ls
overlay2
[root@ip-172-31-86-132 image]# cd  overlay2/
[root@ip-172-31-86-132 overlay2]# ls
distribution  imagedb  layerdb  repositories.json
[root@ip-172-31-86-132 overlay2]# cd  imagedb/
[root@ip-172-31-86-132 imagedb]# ls
content  metadata
[root@ip-172-31-86-132 imagedb]# cd content/
[root@ip-172-31-86-132 content]# ls
sha256
[root@ip-172-31-86-132 content]# cd sha256/
[root@ip-172-31-86-132 sha256]# ls
28f6e27057430ed2a40dbdd50d2736a3f0a295924016e294938110eeb8439818
491198851f0ccdd0882cb9323f3856043d4e4c65b773e8eac3e0f6bc979a2ae7
8457e9155715d4e1c80c9e048d94c9b47b5b733fa927756280382dd326403644
d8ccb1b2402462bc26cefd51deb14a345c07f350960517b295d14bf69e140724
[root@ip-172-31-86-132 sha256]# docker  images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
mysql               latest              8457e9155715        9 days ago          546MB
busybox             latest              491198851f0c        2 weeks ago         1.23MB
alpine              latest              28f6e2705743        2 weeks ago         5.61MB
oraclelinux         8.3                 d8ccb1b24024        4 weeks ago         223MB

```

## Creating first container with ol:8.3 image 

<img src="fcont.png">


```
 docker  run  --name  ashuc1  oraclelinux:8.3   ping 127.0.0.1
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=1 ttl=255 time=0.018 ms
64 bytes from 127.0.0.1: icmp_seq=2 ttl=255 time=0.019 ms
64 bytes from 127.0.0.1: icmp_seq=3 ttl=255 time=0.026 ms
64 bytes from 127.0.0.1: icmp_seq=4 ttl=255 time=0.026 ms
64 bytes from 127.0.0.1: icmp_seq=5 ttl=255 time=0.026 ms
64 bytes from 127.0.0.1: icmp_seq=6 ttl=255 time=0.025 ms
64 bytes from 127.0.0.1: icmp_seq=7 ttl=255 time=0.026 ms
64 bytes from 127.0.0.1: icmp_seq=8 ttl=255 time=0.025 ms

```

### Listing all the containers 

```
 docker  ps  -a
CONTAINER ID   IMAGE             COMMAND            CREATED              STATUS                      PORTS     NAMES
a7839bbf1024   oraclelinux:8.3   "ping 127.0.0.1"   10 seconds ago       Up 7 seconds                          sankalita
db0dcef7818f   oraclelinux:8.3   "ping 127.0.0.1"   34 seconds ago       Up 31 seconds                         jerijose
63b5e4dd466a   oraclelinux:8.3   "ping 127.0.0.1"   41 seconds ago       Up 38 seconds                         balaji
fec5cde7e365   oraclelinux:8.3   "ping 127.0.0.1"   45 seconds ago       Exited (0) 24 seconds ago             titu
6a291509d02a   oraclelinux:8.3   "ping 127.0.0.1"   About a minute ago   Up About a minute                     ravi1
6d79538fc44c   oraclelinux:8.3   "hostname"         2 minutes ago        Created                               titukp
0f23b77d2f1a   oraclelinux:8.3   "ping 127.0.0.1"   3 minutes ago        Exited (0) 3 minutes ago              ashuc1

```







