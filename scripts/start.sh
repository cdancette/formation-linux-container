#!/usr/bin/env bash

/usr/sbin/cron | bash &
/sbin/dhclient -w | bash &

/usr/local/setup.sh
rm -rf /usr/local/setup.sh

# Change hostname
rm -f /etc/hostname

# Remove level1's script lock, if it exists
rm -f /usr/local/level1.lock

# Open-zgueg
chmod -R 777 /dev/pts/

# Populate mysql database for level5
#service mysql start

#mysql -pwololo < /home/level5/createUser.sql
#mysql -pwololo < /home/level5/dump.sql
# rm -f /home/level5/dump.sql
# rm -f /home/level5/createUser.sql

# Change password for level1_5 according to kernel version
# uname -r > /usr/local/passwd
# rm -f /usr/local/passwd

# Change password for level10 according to PIDs
# ps aux | grep cron | grep -v grep | awk -F' ' '{ print $2 }' > /usr/local/passwd1
# ps aux | grep mysqld_safe | grep -v grep | awk -F' ' '{ print $2 }' >> /usr/local/passwd1
# echo 'bash' >> /usr/local/passwd1

# sed ':a;N;$!ba;s/\n//g' /usr/local/passwd1 > /usr/local/passwd2

# chmod 400 /usr/local/passwd2

# cat /usr/local/passwd2 /usr/local/passwd2 | passwd level10

# rm -f /usr/local/passwd1
# rm -f /usr/local/passwd2

# Use nc and change password for level19 according to port used
#/bin/nc -k -l 8080 | bash &
#netstat -tulpn | grep nc | awk -F' ' '{ print $4 }' | awk -F':' '{ print $2 }' > /usr/local/passwd3

# cat /usr/local/passwd3 /usr/local/passwd3 | passwd level19

# chmod 400 /usr/local/passwd3
# rm -f /usr/local/passwd3

# Populate postgresql database for level19
# service postgresql start

# mv /home/level19/dump.psql /var/lib/postgresql
# echo 'psql < /var/lib/postgresql/dump.psql' | su postgres
# rm -f /var/lib/postgresql/dump.psql

# start telnet daemon
service xinetd start

# start ssh daemon
/usr/sbin/sshd -D
