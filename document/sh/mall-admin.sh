#!/usr/bin/env bash
app_name='mall-admin'
docker login --username=hujameson@gmail.com --password=Tender512 registry.cn-hangzhou.aliyuncs.com
docker pull registry.cn-hangzhou.aliyuncs.com/cr-mall/${app_name}:1.0-SNAPSHOT
docker tag registry.cn-hangzhou.aliyuncs.com/cr-mall/${app_name}:1.0-SNAPSHOT ${app_name}:1.0-SNAPSHOT
CID_SERVICE=$(docker ps | grep "${app_name}" | awk '{print $1}')
if [ -n "$CID_SERVICE" ]; then
        echo "存在${app_name}容器，CID_SERVICE =$CID_SERVICE，停止docker容器 ..."
                docker stop -f ${app_name}
                docker rm -f ${app_name}
        echo "docker rm -f ${app_name}容器停止完成"
fi
echo "docker run创建容器..."
docker run -p 18080:8080 --name ${app_name} \
-e TZ="Asia/Shanghai" \
-v /etc/localtime:/etc/localtime \
-v /Users/huchangzheng/mydata/app/${app_name}/logs:/var/logs \
-d ${app_name}:1.0-SNAPSHOT
echo "${app_name}容器创建完成"