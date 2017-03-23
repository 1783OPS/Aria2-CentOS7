wget http://ftp.tu-chemnitz.de/pub/linux/dag/redhat/el7/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm 
rpm -ivh rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm 
sudo yum --enablerepo=epel-testing install uget aria2 -y

mkdir mkdir ~/.aria2
cat /dev/null > ~/.aria2/aria2.session
wget https://raw.githubusercontent.com/1783OPS/Aria2-CentOS7/master/aria2.conf -O ~/.aria2/aria2.conf

wget https://raw.githubusercontent.com/1783OPS/Aria2-CentOS7/master/aria2c -O /etc/init.d/aria2c
chmod +x /etc/init.d/aria2c
echo "/etc/init.d/aria2 start">> /etc/rc.local
/etc/init.d/aria2 start
iptables -A INPUT -p tcp --dport 6800 -j ACCEPT

#lip = /sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"

echo "================================================="
echo "Aria2 RPC Address : your ip:6800/jsonrpc"
echo "You can access https://aria2.follw.me"
echo "================================================="

git clone https://github.com/ziahamza/webui-aria2
cd webui-aria2
python -m SimpleHTTPServer 9999
