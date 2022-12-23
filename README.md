# Auto-clash-cli

这是一个帮你自动配置 无界面 clash的 脚本, 仅支持ubuntu 系统

支持架构 

- AMD64
- ARMv8
- ARMv7a

# 使用指南

1. ```
    git clone https://gitee.com/wangdaochuan/auto-clash-cli.git
    cd auto-clash-cli
    touch clash_link.txt
   ```

2. 将 订阅链接 复制到 **clash_link.txt** 中,注意是Clash用的订阅链接，如果你用过windows 下的 Clash 就应该知道。

3. 运行 **./config_clash.sh <架构>** ,脚本会自动帮你完成配置,中途需要你输入一次密码使得能够使用systemd控制clash 运行。如
   
   ```
   ./config_clash.sh AMD64
   ```
   
   

4. 打开一个新的terminal，使用 "clash_help" 查看帮助

# 更新订阅的配置文件

1. 修改clash_link.txt 为新的 订阅链接
2. ./update_clash_url.sh

# clash 项目地址

https://github.com/Dreamacro/clash

# 常用的使用场景

## 在 使用apt 命令时 临时使用代理 下载 软件

```bash
sudo apt install $apt_proxy sublime-text
```

## docker

docker pull 走代理

[Docker的三种网络代理配置 &middot; 零壹軒·笔记](https://note.qidong.name/2020/05/docker-proxy/)

在执行`docker pull`时，是由守护进程`dockerd`来执行。 因此，代理需要配在`dockerd`的环境中。 而这个环境，则是受`systemd`所管控，因此实际是`systemd`的配置。

```bash
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo touch /etc/systemd/system/docker.service.d/proxy.conf
sudo vim /etc/systemd/system/docker.service.d/proxy.conf
```

在这个`proxy.conf`文件（可以是任意`*.conf`的形式）中，添加以下内容：

```
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:7890/"
Environment="HTTPS_PROXY=http://127.0.0.1:7890/"
```

最后

```
systemctl daemon-reload
systemctl restart docker
```

# 备注

总觉得 没界面的版本稳定些，所以搞了这个，需要的依赖提前放到国内了，以防github下不下来
