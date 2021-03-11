FROM  oraclelinux:8.3
MAINTAINER  ashutoshh@linux.com
ENV  customer=app1 
# env will be creating a varimage for docker image 
RUN dnf  install httpd -y
RUN mkdir  /app   /app/app1   /app/app2  /app/app3 
COPY customerapp1  /app/app1/
COPY customerapp2  /app/app2/
COPY customerapp3  /app/app3/
COPY web.sh /app/web.sh
WORKDIR /app
RUN chmod +x web.sh 
EXPOSE 80
ENTRYPOINT ["./web.sh"]
# httpd server is reading app from /var/www/html/

