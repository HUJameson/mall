SERVICE_NAME=mall-admin
#docker build --platform linux/amd64 -t registry.cn-hangzhou.aliyuncs.com/cr-mall/$SERVICE_NAME:1.0-SNAPSHOT
#docker login --username=hujameson@gmail.com --password=Tender512 registry.cn-hangzhou.aliyuncs.com
#docker pull registry.cn-hangzhou.aliyuncs.com/cr-mall/$SERVICE_NAME:1.0-SNAPSHOT
#docker tag registry.cn-hangzhou.aliyuncs.com/cr-mall/$SERVICE_NAME:1.0-SNAPSHOT $SERVICE_NAME:1.0-SNAPSHOT
docker build --platform linux/amd64 -t $SERVICE_NAME:1.0-SNAPSHOT
CID_SERVICE=$(docker ps -a | grep "$SERVICE_NAME" | awk '{print $1}')
if [ -n "$CID_SERVICE" ]; then
        echo "存在$SERVICE_NAME容器，CID_SERVICE =$CID_SERVICE，停止docker容器 ..."
                docker stop -f $SERVICE_NAME
                docker rm -f $SERVICE_NAME
        echo "docker rm -f $SERVICE_NAME容器停止完成"
fi
echo "docker run创建容器..."
docker run -p 8080:8080 --name $SERVICE_NAME \
--link redis:redis \
--link logstash:logstash \
-e TZ="Asia/Shanghai" \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/admin/logs:/var/logs \
-d $SERVICE_NAME:1.0-SNAPSHOT
echo "$SERVICE_NAME容器创建完成"