echo -e "---------登录镜像容器服务--------"
###
 # @Author: your name
 # @Date: 2022-01-21 15:29:18
 # @LastEditTime: 2022-01-25 13:59:02
 # @LastEditors: your name
 # @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 # @FilePath: \blog\blog-deploy.sh
### 
# 登录阿里云镜像容器服务
docker login --username=healerrr registry.cn-hangzhou.aliyuncs.com --password=ys19940912ysxin2
echo -e "---------停掉镜像--------"
# 停掉容器
docker stop blog
echo -e "---------删除本地容器和镜像--------"
# 删除本地容器
docker rm blog
# 删除本地镜像
docker rmi registry.cn-hangzhou.aliyuncs.com/healerrr/blog:latest
echo -e "---------拉取镜像--------"
# 拉取镜像
docker pull registry.cn-hangzhou.aliyuncs.com/healerrr/blog:latest
echo -e "---------创建容器并运行容器--------"
# -rm: docker会在容器退出时删除与它关联的数据卷
# -d: 后台运行容器，并返回容器ID
# -p: 端口映射，本机端口:容器端口
# --name: 指定容器名称
# 最后一个为镜像名称
docker run --rm -d -p 8080:80 --name blog registry.cn-hangzhou.aliyuncs.com/healerrr/blog:latest
echo -e "---------执行完毕--------"
