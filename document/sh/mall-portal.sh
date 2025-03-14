SERVICE_NAME=mall-portal
DOCFILE_NAME=Dockerfile-$SERVICE_NAME
#docker build --platform linux/amd64 -t registry.cn-hangzhou.aliyuncs.com/cr-mall/$SERVICE_NAME:1.0-SNAPSHOT
#docker login --username=hujameson@gmail.com --password=Tender512 registry.cn-hangzhou.aliyuncs.com
#docker pull registry.cn-hangzhou.aliyuncs.com/cr-mall/$SERVICE_NAME:1.0-SNAPSHOT
#docker tag registry.cn-hangzhou.aliyuncs.com/cr-mall/$SERVICE_NAME:1.0-SNAPSHOT $SERVICE_NAME:1.0-SNAPSHOT
docker build --platform linux/amd64 -f $DOCFILE_NAME -t $SERVICE_NAME:1.0-SNAPSHOT .
CID_SERVICE=$(docker ps -a | grep "$SERVICE_NAME" | awk '{print $1}')
if [ -n "$CID_SERVICE" ]; then
        echo "存在$SERVICE_NAME容器，CID_SERVICE =$CID_SERVICE，停止docker容器 ..."
                docker stop -f $SERVICE_NAME
                docker rm -f $SERVICE_NAME
        echo "docker rm -f $SERVICE_NAME容器停止完成"
fi
echo "docker run创建容器..."
docker run -p 8081:8081 --name $SERVICE_NAME \
--link elasticsearch:es \
-e TZ="Asia/Shanghai" \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/search/logs:/var/logs \
-d $SERVICE_NAME:1.0-SNAPSHOT
echo "$SERVICE_NAME容器创建完成"