FROM tomcat
# this is officail image on Docker hub by apache foundation 
MAINTAINER ashutoshh@linux.com
WORKDIR /usr/local/tomcat/webapps
# is to change directory during build time 
# its like cd command in general OS
RUN mkdir ashuapp
WORKDIR ashuapp
# changing directory to ashuapp 
ADD  myapp . 
# copy all the content of myapp directory to ashuapp that is current folder
RUN chmod 755 . -R
# fixing permission of java based code 
EXPOSE 8080
# optional field but you can use to define default port for deployment purpose 
# its just for information purpose 
# CMD is not required bcz tomcat already have its own cmd to start web server