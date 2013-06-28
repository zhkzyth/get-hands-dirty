#!/bin/sh 
IPTABLES=/sbin/iptables 
MODEPROBE=/sbin/modeprobe
INT_NET=192.168.10.0/24

##flush existing rules and set chain policy setting to DROP
echo "[+] Flushing existing iptables rules..."

$IPTABLES -F
$IPTABLES -F -t nat
$IPTABLES -X
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

###load connection-tracking modules
$MODEPROBE ip_conntrack
$MODEPROBE iptables_nat
$MODEPROBE ip_conntrack_ftp
$MODEPROBE ip_nat_ftp

###IPUT chain#####
echo "[+] Setting up INPUT chain..."
###state tracking rules
$IPTABLES -A INPUT -m state --state INVALID -j LOG --log-prefix "DROP INVALID" --log-ip-options --log-tcp-options
$IPTABLES -A INPUT -m state --state INVALID -j DROP
$IPTABLES -A INPUT -m state --state ESTABLISHED ,RELATED -j ACCEPT

##anti-spoofing rules
$IPTABLES -A INPUT -i eth1 -s ! $INT_NET -j LOG --log--prefix "SPOOED PKT"
$IPTABLES -A INPUT -i eth1 -s ! $INT_NET -j DROP

### ACCEPT rules
$IPTABLES -A INPUT -i eth1 -p tcp -s $INT_NET --dport 22 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type echo-request -j ACCEPT 

##DEFAULT INPUT LOG rule 
$IPTABLES -A INPUT -i ! lo -j LOG --log-prefix "DROP" --log-ip-options --log-tcp-options

##OUTPUT chain ####
echo "[+] Setting up OUTPUT chain..."
### state tracking rules
$IPTABLES -A OUTPUT -m state --state INVALID -j LOG --log-prefix \
   "DROP INVALID "  --log-ip-options --log-tcp-options
$IPTABLES -A OUTPUT -m state --state INVALID -j DROP
$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

### ACCEPT rules for allowing connections out 
$IPTABLES -A OUTPUT -p tcp --dport 21 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 22 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 25 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 43 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 80 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 443 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 4321 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p udp --dport 53 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT

###default OUTPUT LOG rule 
$IPTABLES -A OUTPUT -o ! lo -j LOG  --log-prefix "DROP" --log-ip-options --log-tcp-options

####FORWARD chain #####
echo "[+] Setting up FORWARD chain..."
### state tracking rules
$IPTABLES -A FORWARD -m state --state INVALID -j LOG --log-prefix "DROP INVALID" --log-ip-options --log-tcp-options
$IPTABLES -A FORWARD -m state --state INVALID -j DROP
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

###anti-spoofing rules
$IPTABLES -A FORWARD -i eth1 -s ! $INT_NET -j LOG --log-prefix "SPOOED PKT"
$IPTABLES -A FORWARD -i eth1 -s ! $INT_NET -j DROP

###ACCEPT rules
$IPTABLES -A FORWARD -p tcp -i eth1 -s $INT_NET --dport 21 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -p tcp -i eth1 -s $INT_NET --dport 22 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -p tcp -i eth1 -s $INT_NET --dport 25 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -p tcp -i eth1 -s $INT_NET --dport 43 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -p tcp -i eth1 -s $INT_NET --dport 80 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -p tcp -i eth1 -s $INT_NET --dport 443 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -p tcp -i eth1 -s $INT_NET --dport 4321 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -p udp -i eth1 -s $INT_NET --dport 53 --syn -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -p icmp -i eth1 -s $INT_NET --dport --syn -m state --state NEW -j ACCEPT

###default log rule 
$IPTABLES -A FORWARD -i ! lo -j LOG --log-prefix "DROP" --log-ip-options --log-tcp-options

##### NAT rules ######
echo "[+] Setting up NAT rules..."
$IPTABLES -t nat -A PREROUTING -p tcp --dport 80 -i eth0 -j DNAT --to 192.168.10.3:80
$IPTABLES -t nat -A PREROUTING -p tcp --dport 443 -i eth0 -j DNAT --to 192.168.10.3:443
$IPTABLES -t nat -A PREROUTING -p tcp --dport 53 -i eth0 -j DNAT --to 192.168.10.4:53
$IPTABLES -t nat -A POSTROUTING -s $INT_NET -o eth0 -j MASQUERADE

#### forwarding ####
echo "[+] Enabling IP forwarding..."
echo 1 > /proc/sys/net/ipv4/ip_forward
