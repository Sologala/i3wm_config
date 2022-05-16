##########################################################################
# File Name: keytron3.sh
# Author: Dawson wen
# mail: dawsonwen123@gmail.com
# Created Time: 2022年05月13日 星期五 21时31分28秒
#########################################################################
#!/bin/bash

sudo sed '$i options hid_apple fnmode=2' /etc/modprobe.d/hid_apple.conf 
