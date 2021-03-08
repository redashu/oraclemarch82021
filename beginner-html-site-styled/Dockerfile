FROM nginx 
MAINTAINER  ashutoshh@linux.com
COPY .  /usr/share/nginx/html/
# here . means where dockerfile is present from that location take everything
# and paste it to target location in docker image build process time 
# As per documentation /usr/share/nginx/html is default location of nginx web server
# Note: please use .dockerignore if you don't wanna copy some thing in copy step
#CMD  something that can start web server during container creation 
# if you miss CMD your FROM image CMD will be inherited 

