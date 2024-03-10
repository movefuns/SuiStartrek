# 给定一个 jar 包，打包成 docker 镜像
# 注意项:
# 1. 参数接收：jar 包，docker 模板文件
# 2. 镜像名、版本从 jar 包名推导

JAR_FILE=$1
# 不存在就是失败
if [ -z $JAR_FILE ]; then
    echo "JAR_FILE is empty"
    exit 1
fi
if [ ! -f $JAR_FILE ]; then
    echo "JAR_FILE not exists"
    exit 1
fi

DOCKER_FILE=$2
# 不存在用 Dockerfile_template
if [ -z $DOCKER_FILE ]; then
    DOCKER_FILE=Dockerfile
fi

# 获取 jar 包名, 格式 xxx-1.0.0-SNAPSHOT.jar, 获取 xxx 1.0.0-SNAPSHOT；xxx-1.0.0.jar, 获取 xxx 1.0.0
JAR_NAME=$(basename $JAR_FILE)
JAR_NAME_WITHOUT_EXTENSION=${JAR_NAME%%.*}
JAR_VERSION=$(echo $JAR_NAME | sed -n -e 's/^.*\([0-9]\+\.[0-9]\+\.[0-9]\+\(-SNAPSHOT\)\?\).*$/\1/p')


echo "JAR_NAME: $JAR_NAME"
echo "JAR_VERSION: $JAR_VERSION"
echo "DOCKER_FILE: $DOCKER_FILE"

# 获取不到就是失败
if [ -z $JAR_NAME ] || [ -z $JAR_VERSION ]; then
    echo "JAR_NAME or JAR_VERSION is empty"
    exit 1
fi

# 构建镜像
mkdir -p target
cp -f $JAR_FILE target/app.jar
docker build -t "$JAR_NAME:$JAR_VERSION" -f $DOCKER_FILE .