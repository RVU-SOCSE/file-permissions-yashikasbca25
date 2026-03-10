#!/bin/bash
./prog.sh abc.txt
usage(){
echo "usage: $0 abc.txt" exit 1
}
if["$#" -ne 1];
then
usage
fi
abc.txt=$1
if[!-e "$abc.txt" ];
then
echo "error: file '$abc.txt' does not exist." exit 1
fi
current_permissions=$(ls -l "$abc.txt" |awk '{print $1}')
echo "current permissions for '$abc.txt':$current_permission"
read -p "enter new permissions: " new_permissions
chmod "$new_permissions" "$abc.txt"
if[$? -eq 0];
then
echo "permissions for '$abc.txt' changed to $new_permissions."
else
echo "error: could not change permissions for '$abc.txt'."
exit 1
fi
new_permissions_display=$(ls -l "$abc.txt"|awk '{print $1}')
echo "new permissions for '$abc.txt':$new_permissions_diaplay"
read -p "do you want to change the ownership of the file? (y/n): " change_ownership
if[["$change_ownership"=~^[Yy]$]];
then
read -p "enter new owner: " new_owner
read -p "enter new group (groupname): " new_group
chown "$new_owner":"$new_group""$abc.txt"
if[$? -eq 1];
then
echo "error: could not change ownership"
exit 1
fi
else fi
echo "final details for '$abc.txt': "
ls -l "$abc.txt"
