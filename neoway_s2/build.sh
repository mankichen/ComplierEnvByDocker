#!/bin/bash

board_name=$1

if [[ ${board_name} =~ "help" ]] 
then
    echo "命令带一个参数（板卡名称），并使用管理员权限运行。"
    echo "eg: sudo ./build.sh hi3520d"
elif [ ${#board_name} -gt 2 ]
then
    # 将大写改成小写
    typeset -l ${board_name} 

    # 生成的文件名
    general_file_name="docker_"${board_name}
    # 挂在路径
    mount_path="/home/"${board_name}
    # 镜像名称
    image_name="$USER/${board_name}_image:v1"
    # 容器名称s
    container_name=${board_name}"_container"
    # --rm :设置镜像成功后删除中间容器；
    docker build --rm --build-arg board=${board_name} -t ${image_name} .
    # 判断是够构建成功，若成功，则生成对应的容器启动脚本
    if [ 0 == $? ]
    then 
        echo '#!/bin/bash' > ${general_file_name}
        echo '' >> ${general_file_name}
        echo '#start a docker container' >> ${general_file_name}
        echo "docker run -it -v \`pwd\`:${mount_path} --name ${container_name} ${image_name} /bin/bash" >> ${general_file_name}
        echo '#When leave remote this container' >> ${general_file_name}
        echo "docker rm ${container_name}" >> ${general_file_name}
        echo ' ' >> ${general_file_name}

        chmod a+x ${general_file_name}
        echo "生成 ${general_file_name} 成功"
    fi
else
    echo "请看帮助: ./build.sh help"
fi
