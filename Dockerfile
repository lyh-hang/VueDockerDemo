# 拉取node镜像
FROM node
# 指定工作目录app
WORKDIR /app
# 复制package文件到容器
COPY package*.json ./
# 修改node镜像cnpm下载源
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
# 下载node_modules
RUN cnpm install
# 复制当前所有到容器
COPY . .
# 打包项目
RUN npm run build
# 拉取nginx镜像
FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build-stage /app/dist /usr/share/nginx/html
# 暴露端口80
EXPOSE 80
# 运行nginx
CMD [ "nginx", '-g', 'daemon off;' ]
