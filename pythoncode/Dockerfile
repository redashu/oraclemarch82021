FROM oraclelinux:8.3 
# docker engine will check for above image and if it is not present then it will
# donwload it from DockerHUB
MAINTAINER  ashutoshh@linux.com 
# optional field but good for support - please connect me if having any issues
RUN  dnf install python3 -y
# is like giving you shell access with rootpower 
RUN mkdir  /mycode 
COPY  hello.py  /mycode/hello.py

# copy instruction will copy data from client machine to Docker ENgine machine
# under newly created docker image 
CMD   ["python3" ,"/mycode/hello.py"]  
# CMD means default  process of a container if not 
# given by user during container creation time 
# CMD you can not use more than one time 
# because container can't have more than one parent process
