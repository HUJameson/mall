CID_SERVICE=$(docker ps -a | grep "mall-admin" | awk '{print $1}')
if [ -n "$CID_SERVICE" ]; then
        echo "存在mall-admin容器，CID_SERVICE =$CID_SERVICE，开始停止并删除docker容器 ..."
                docker stop mall-admin
                docker rm -f mall-admin
        echo "完成docker容器的停止和删除：mall-admin"
fi
CID_SERVICE=$(docker images -a | grep -E "mall-admin.*1.0-SNAPSHOT" | awk '{print $1}')
if [ -n "$CID_SERVICE" ]; then
        echo "存在mall-admin，CID_SERVICE =$CID_SERVICE，开始删除docker镜像 ..."
                docker rmi mall-admin:1.0-SNAPSHOT
        echo "完成docker镜像删除：mall-admin:1.0-SNAPSHOT"
fi

CID_SERVICE=$(docker ps -a | grep "mall-search" | awk '{print $1}')
if [ -n "$CID_SERVICE" ]; then
        echo "存在mall-search容器，CID_SERVICE =$CID_SERVICE，开始停止并删除docker容器 ..."
                docker stop mall-search
                docker rm -f mall-search
        echo "完成docker容器的停止和删除：mall-search"
fi
CID_SERVICE=$(docker images -a | grep -E "mall-search.*1.0-SNAPSHOT" | awk '{print $1}')
if [ -n "$CID_SERVICE" ]; then
        echo "存在mall-search，CID_SERVICE =$CID_SERVICE，开始删除docker镜像 ..."
                docker rmi mall-search:1.0-SNAPSHOT
        echo "完成docker镜像删除：mall-search:1.0-SNAPSHOT"
fi

CID_SERVICE=$(docker ps -a | grep "mall-portal" | awk '{print $1}')
if [ -n "$CID_SERVICE" ]; then
        echo "存在mall-portal容器，CID_SERVICE =$CID_SERVICE，开始停止并删除docker容器 ..."
                docker stop mall-portal
                docker rm -f mall-portal
        echo "完成docker容器的停止和删除：mall-portal"
fi
CID_SERVICE=$(docker images -a | grep -E "mall-portal.*1.0-SNAPSHOT" | awk '{print $1}')
if [ -n "$CID_SERVICE" ]; then
        echo "存在mall-portal，CID_SERVICE =$CID_SERVICE，开始删除docker镜像 ..."
                docker rmi mall-portal:1.0-SNAPSHOT
        echo "完成docker镜像删除：mall-portal:1.0-SNAPSHOT"
fi

docker-compose -f docker-compose-mall-app.yml up -d --build
