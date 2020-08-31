user=lemonproxies
passw=$(pwgen -A 6 1)
sudo htpasswd -b -c /etc/squid/passwd ${user} ${passw}
