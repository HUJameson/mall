mkdir upload || true
rm upload/* -f
cp mall-admin/target/mall-admin-1.0-SNAPSHOT.jar upload/mall-admin-1.0-SNAPSHOT.jar
cp mall-search/target/mall-search-1.0-SNAPSHOT.jar upload/mall-search-1.0-SNAPSHOT.jar
cp mall-portal/target/mall-portal-1.0-SNAPSHOT.jar upload/mall-portal-1.0-SNAPSHOT.jar
cp document/docker/Dockerfile-mall-admin upload/Dockerfile-mall-admin
cp document/docker/Dockerfile-mall-search upload/Dockerfile-mall-search
cp document/docker/Dockerfile-mall-portal upload/Dockerfile-mall-portal
cp document/docker/docker-compose-mall-app.yml upload/docker-compose-mall-app.yml
cp document/sh/mall-cd.sh upload/mall-cd.sh