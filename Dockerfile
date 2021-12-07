FROM node:lts-alpine as build-stage
WORKDIR /docker_demo
COPY package*.json ./
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
RUN cnpm install
COPY . .
RUN npm run build

# 拉取nginx作为主镜像
FROM nginx

# 删除镜像/etc/nginx/conf.d目录下所有
RUN rm -rf /etc/nginx/conf.d/*

# 拷贝admin.conf文件到镜像/etc/nginx/conf.d/目录中
COPY docker_demo.conf /etc/nginx/conf.d/

# 拷贝nginx.conf文件到镜像/etc/nginx/nginx.conf目录中
COPY nginx.conf /etc/nginx/nginx.conf

# 添加/dist 到/admin
COPY --from=build-stage /docker_demo/dist /usr/share/nginx/html

# 指定工作目录/admin
# WORKDIR /docker_demo
EXPOSE 80
# CMD ["nginx", '-g', "daemon off;"]
