# Auto-clash-cli
这是一个帮你自动配置clash的脚本，只适用于 x86 电脑
# 使用指南
1. ```
    git clone https://gitee.com/wangdaochuan/auto-clash-cli.git
    cd auto-clash-cli
    touch clash_link.txt
    ```

2. 将 URL 复制到 **clash_link.txt** 中,注意是Clash用的url，如果你用过windows 下的 Clash 就应该知道。
3. 运行 **./config_clash.sh** ,脚本会自动帮你完成配置,中途需要你输入一次密码使得能够使用systemd控制clash 运行
4. 打开一个新的terminal，使用 "clash_help" 查看帮助

