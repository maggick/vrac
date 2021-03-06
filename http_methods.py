#!/usr/bin/env python3

import sys
import requests
requests.packages.urllib3.disable_warnings()

if len(sys.argv)!=2:
  print("Usage: python http_methods.py [URL]")
  exit(0)

url = sys.argv[1]
methods = ["HEAD", "OPTIONS", "PUT", "DELETE", "NOTAMETHOD"]
#CONNECT TRACE

for method in methods:
    r = requests.Response
    if (method == "PUT"):
        data = '<html>test</html>'
        r = requests.request(method,url+"/test.html", data=data, verify=False)
        print("{} /test.html HTTP/1.1 \nHost: {} \n{}\n".format(method, url.split('/')[2], data))
    elif (method == "DELETE"):
        r = requests.request(method,url+"/test.html", verify=False)
        print("{} /test.html HTTP/1.1 \nHost: {} \n".format(method, url.split('/')[2]))
    elif (method == "CONNECT"):
        pass #TODO
    else:
        r = requests.request(method,url, verify=False)
        print("{} / HTTP/1.1 \nHost: {} \n".format(method, url.split('/')[2]))
    try :
        print ("HTTP/1.1 {}".format(r.status_code))
    except AttributeError:
        # TODO
        pass
    for header in r.headers:
        print ("{}: {}".format(header, r.headers[header]))
    print ("{}\n".format(r.text))
