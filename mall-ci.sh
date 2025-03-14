mkdir upload || true
rm * -f
cp mall-admin/target/mall-admin-1.0-SNAPSHOT.jar upload/mall-admin-1.0-SNAPSHOT.jar
#cp mall-search/target/mall-search-1.0-SNAPSHOT.jar upload/mall-search-1.0-SNAPSHOT.jar
#cp mall-portal/target/mall-portal-1.0-SNAPSHOT.jar upload/mall-portal-1.0-SNAPSHOT.jar
cp document/sh/Dockerfile-mall-admin upload/Dockerfile-mall-admin
cp document/sh/mall-admin.sh upload/mall-admin.sh