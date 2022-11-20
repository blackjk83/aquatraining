import sys, os, platform, psutil
from requests import get

# Get version number from file
version_file = open('version','r')
ver = version_file.read()
version_file.close()
# Print Hello message and version
print("Hello World! Version {}".format(ver))
# Print System os version
print("\nSystem OS version:\n {}".format(platform.platform()))
# Print External IP address
ip = get('https://api.ipify.org').text
print('\nExternal IP Address is: {}'.format(ip))
# printing disk info
path = "/"
dirs = os.scandir(path)
print("\nRoot system folders usage:")
for dir in dirs:
    new_path = dir.path
    disk_us = psutil.disk_usage(new_path)
    print("\t{}:\t\t{}%".format(dir.path,disk_us.percent))
