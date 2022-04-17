# 通过浏览器请求如下的接口 
#  https://www.vmware.com/go/getworkstation-linux
# 系统会自动重定向并且下载最新的vmware-linux，同理win


wget -c https://download3.vmware.com/software/WKST-1623-LX-New/VMware-Workstation-Full-16.2.3-19376536.x86_64.bundle -O /tmp/vmware_install.bundle
sudo chmod u+x  /tmp/vmware_install.bundle
sudo /tmp/vmware_install.bundle
