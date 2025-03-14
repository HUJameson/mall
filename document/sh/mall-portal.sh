SERVICE_NAME=mall-portal
VERSION=1.0-SNAPSHOT
DOCFILE_NAME=Dockerfile-$SERVICE_NAME
#docker build --platform linux/amd64 -t registry.cn-hangzhou.aliyuncs.com/cr-mall/$SERVICE_NAME:$VERSION
#docker login --username=hujameson@gmail.com --password=Tender512 registry.cn-hangzhou.aliyuncs.com
#docker pull registry.cn-hangzhou.aliyuncs.com/cr-mall/$SERVICE_NAME:$VERSION
#docker tag registry.cn-hangzhou.aliyuncs.com/cr-mall/$SERVICE_NAME:$VERSION $SERVICE_NAME:$VERSION
CID_SERVICE=$(docker ps -a | grep "$SERVICE_NAME" | awk '{print $1}')
if [ -n "$CID_SERVICE" ]; then
        echo "存在$SERVICE_NAME容器，CID_SERVICE =$CID_SERVICE，开始停止并删除docker容器 ..."
                docker stop $SERVICE_NAME
                docker rm -f $SERVICE_NAME
        echo "完成docker容器的停止和删除：$SERVICE_NAME"
fi
CID_SERVICE=$(docker images -a | grep -E '$SERVICE_NAME.*$VERSION' | awk '{print $1}')
if [ -n "$CID_SERVICE" ]; then
        echo "存在$SERVICE_NAME镜像，CID_SERVICE =$CID_SERVICE，开始删除docker镜像 ..."
                docker rmi $SERVICE_NAME:$VERSION
        echo "完成docker镜像删除：$SERVICE_NAME:$VERSION"
fi
echo "开始创建docker镜像..."
docker build --platform linux/amd64 -f $DOCFILE_NAME -t $SERVICE_NAME:$VERSION .
echo "完成docker镜像的创建：$SERVICE_NAME:$VERSION"
echo "开始创建docker容器..."
docker run -p 8085:8085 --name $SERVICE_NAME \
--link redis:redis \
--link mongo:mongo \
--link rabbitmq:rabbitmq \
-e TZ="Asia/Shanghai" \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/portal/logs:/var/logs \
-d $SERVICE_NAME:$VERSION
echo "完成docker容器的创建：$SERVICE_NAME"
