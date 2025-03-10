#!/usr/bin/env bash
app_name='mall-admin'
docker run -p 18080:8080 --name ${app_name} \
-e TZ="Asia/Shanghai" \
-v /etc/localtime:/etc/localtime \
-v /Users/huchangzheng/mydata/app/${app_name}/logs:/var/logs \
-d mall/${app_name}:1.0-SNAPSHOT
echo '----start container----'