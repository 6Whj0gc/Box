echo '
net.ipv4.tcp_rmem = 712500 712500 1425000
net.ipv4.tcp_wmem = 712500 712500 1425000
net.core.rmem_max = 1425000
net.core.wmem_max = 1425000
net.core.rmem_default = 712500
net.core.wmem_default = 712500
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
' >> /etc/sysctl.conf

sysctl -p