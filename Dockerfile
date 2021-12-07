# 拉取nginx作为主镜像
FROM nginx

# 删除镜像/etc/nginx/conf.d目录下所有
RUN rm -rf /etc/nginx/conf.d/*

# 拷贝admin.conf文件到镜像/etc/nginx/conf.d/目录中
COPY docker_demo.conf /etc/nginx/conf.d/

# 拷贝nginx.conf文件到镜像/etc/nginx/nginx.conf目录中
COPY nginx.conf /etc/nginx/nginx.conf

# 添加/dist 到/admin
ADD dist /docker_demo

# 指定工作目录/admin
WORKDIR /docker_demo
