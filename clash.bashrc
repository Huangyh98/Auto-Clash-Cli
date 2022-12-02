alias clash_ctl_on='sudo systemctl start clash'
alias clash_ctl_off='sudo systemctl stop clash'
alias clash_ctl_restart='sudo systemctl restart clash'
alias clash_ctl_status='systemctl status clash'
# Anaconda /bin 也有叫做 gsettings 的程序
# 以下设置也适用于 unity 桌面
alias clash_on='
/usr/bin/gsettings set org.gnome.system.proxy.http host 127.0.0.1
/usr/bin/gsettings set org.gnome.system.proxy.http port 7890
/usr/bin/gsettings set org.gnome.system.proxy.https host 127.0.0.1
/usr/bin/gsettings set org.gnome.system.proxy.https port 7890
/usr/bin/gsettings set org.gnome.system.proxy mode manual
echo "start proxy in Gnome Desktop"
'

alias clash_off='gsettings set org.gnome.system.proxy mode none
echo "close proxy in Gnome Desktop"
'
alias clash_shell_on='export http_proxy=http://127.0.0.1:7890;export https_proxy=http://127.0.0.1:7890
echo "start proxy in Terminal"
'
clash_shell_on
alias clash_shell_off='unset http_proxy;unset https_proxy
echo "close proxy in Terminal"
'
alias clash_manage='firefox http://clash.razord.top'

export apt_proxy='-o Acquire::http::proxy=http:127.0.0.1:7890'
