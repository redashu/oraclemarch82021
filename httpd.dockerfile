FROM oraclelinux:8.3
maintainer  ashutoshh@linux.com
RUN dnf install httpd -y
ADD hello.html  /var/www/html/index.html
# add and copy both are same 
# but add can take data from URL as well 
COPY ashu.png  /var/www/html/ashu.png
EXPOSE 80
# optional but if you want to define default port
# that will be bounded with Container IP 
CMD ["httpd", "-DFOREGROUND"] 