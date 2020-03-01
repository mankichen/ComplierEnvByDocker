# ComplierEnv By Docker

使用docker 构建交叉编译环境。



## Use

* 拷贝Dockerfile模板

  ```bash
  $ cp template board_name
  ```

* 根据具体的环境需要更改修改Dockerfile

* 使用build.sh构建编译环境镜像与启动容器脚本（必须使用root）

  ```bash
  $ sudo ./build.sh  board_name
  ```

* 完成之后会生成一个容器启动脚本（以`docker`开头，例如：`docker_board_name`

* 检查容器启动脚本的运行权限后，将脚本拷贝到`/usr/bin/`目录中，即可直接在命令行中启动该容器

  * 容器自动挂在当前路径到容器中
  * 容器退出后，自动删除

  

