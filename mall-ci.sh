mkdir upload || true
rm upload/* -f
cp mall-admin/target/mall-admin-1.0-SNAPSHOT.jar upload/mall-admin-1.0-SNAPSHOT.jar
cp mall-search/target/mall-search-1.0-SNAPSHOT.jar upload/mall-search-1.0-SNAPSHOT.jar
cp mall-portal/target/mall-portal-1.0-SNAPSHOT.jar upload/mall-portal-1.0-SNAPSHOT.jar
cp document/sh/Dockerfile-mall-admin upload/Dockerfile-mall-admin
cp document/sh/Dockerfile-mall-search upload/Dockerfile-mall-search
cp document/sh/Dockerfile-mall-portal upload/Dockerfile-mall-portal
cp document/sh/mall-admin.sh upload/mall-admin.sh
cp document/sh/mall-search.sh upload/mall-search.sh
cp document/sh/mall-portal.sh upload/mall-portal.sh