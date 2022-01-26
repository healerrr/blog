FROM nginx
COPY ./build/ /usr/share/nginx/html/
# 第一步nginx配置文件名称
  # COPY ./vhost.nginx.conf /etc/nginx/conf.d/blog.conf
EXPOSE 80
