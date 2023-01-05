# Padavan
[下载固件](../../releases/latest)

IP:192.168.2.1  
用户名: `admin` 密码: `admin`  
系统语言: 英文  
刷完固件后请进行双清
```
Advanced Setting -> Administration -> Settings -> Router Settings (NVRAM) -> Factory Default -> Reset  
Advanced Setting -> Administration -> Settings -> Router Internal Storage (/etc/storage) -> Factory Default -> Reset
```
源码: https://github.com/padavanonly/rt-n56u

# Docker
系统: Alpine 3.4
## 使用
```
docker run -it \
-v /opt/images:/opt/rt-n56u/trunk/images \
waterlemons2k/padavan
```
将 `/opt/images` 替换为存放固件的目录

## 编译
```
git clone --depth=1 https://github.com/padavanonly/rt-n56u.git /opt/rt-n56u
cd /opt/rt-n56u/trunk
fakeroot ./build_firmware_ci PSG1218
# PSG1218为路由器型号，在/opt/rt-n56u/trunk/configs/templates/中
# 编译好的固件在/opt/rt-n56u/trunk/images里
# 编译完成后，如果需要编译其它固件，需要执行清理脚本：
./clear_tree_simple
```
## 删除名称为 waterlemons2k/padavan 的容器和镜像
```
docker rm $(docker ps -a | grep "waterlemons2k/padavan" | awk '{print $1}')
docker rmi $(docker images -a | grep "waterlemons2k/padavan" | awk '{print $3}')
```