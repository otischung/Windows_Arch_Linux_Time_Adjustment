uid=$(id -u)
if [ $uid != 0 ]; then
	echo "please use root privilege to run this script"
	exit 1
fi

if [ ! -f /usr/bin/ntpdate ]; then
	echo "ntpdate doesn't exist, downloading automatically."
	pacman -S --noconfirm ntp
fi

systemctl stop --now ntpd.service
timedatectl set-local-rtc 1 --adjust-system-clock
ntpdate -u 0.arch.pool.ntp.org
# ntpdate -u 1.arch.pool.ntp.org
# ntpdate -u 2.arch.pool.ntp.org
# ntpdate -u 3.arch.pool.ntp.org
# ntpdate -u time.windwos.com
systemctl enable --now ntpd.service
systemctl start --now ntpd.service
hwclock --utc --systohc
