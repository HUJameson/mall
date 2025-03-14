SERVICE_NAME=mall-admin
docker build --platform linux/amd64 -t registry.cn-hangzhou.aliyuncs.com/cr-mall/$SERVICE_NAME:1.0-SNAPSHOT .
docker login --username=hujameson@gmail.com --password=Tender512 registry.cn-hangzhou.aliyuncs.com
docker push registry.cn-hangzhou.aliyuncs.com/cr-mall/$SERVICE_NAME:1.0-SNAPSHOT