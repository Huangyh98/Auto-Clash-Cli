alias clash_ctl_on='sudo systemctl start clash'
alias clash_ctl_off='sudo systemctl stop clash'
alias clash_ctl_restart='sudo systemctl restart clash'
alias clash_ctl_status='systemctl status clash'
alias clash_on='
gsettings set org.gnome.system.proxy.http host 127.0.0.1
gsettings set org.gnome.system.proxy.http port 7890
gsettings set org.gnome.system.proxy.https host 127.0.0.1
gsettings set org.gnome.system.proxy.https port 7890
gsettings set org.gnome.system.proxy mode manual
echo "start proxy in Gnome Desktop"
'

alias clash_off='gsettings set org.gnome.system.proxy mode none
echo "close proxy in Gnome Desktop"
'
alias clash_shell_on='export http_proxy=http://127.0.0.1:7890;export https_proxy=http://127.0.0.1:7890
echo "start proxy in Terminal"
'
alias clash_shell_off='unset http_proxy;unset https_proxy
echo "close proxy in Terminal"
'
alias clash_manage='firefox http://clash.razord.top'
