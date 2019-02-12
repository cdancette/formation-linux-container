#!/bin/bash

cat /root/passwd >> /etc/passwd
rm /root/passwd
cat /root/shadow >> /etc/shadow
rm /root/shadow
cat /root/group >> /etc/group
rm /root/group