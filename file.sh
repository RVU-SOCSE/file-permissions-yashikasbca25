#!/bin/bash
echo "Enter file name: "
read file
echo "Enter permission: "
read perm
chmod $perm $file
echo "Enter new owner name: "
read owner
sudo chown $owner $file
echo "New file permission are: "
ls -l $file




