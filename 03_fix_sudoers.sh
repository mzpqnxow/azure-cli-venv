#!/bin/bash

function bail {
  echo "$1"
  exit 1
}

[[ "$1" = "" ]] && bail "Please specify resource group as first argument"
[[ "$2" = "" ]] && bail "Please specify hostname as second argument"

command="az vm run-command invoke -g $1 -n $2 --command-id RunShellScript --scripts \"rm -f /etc/sudoers.d/*transition*\""


echo "---"
echo "Resource Group:  $1"
echo "VM Name:         $2"
echo "Command:         $command"
echo
echo -n "Continue? [Enter or Control-C]"
read _
$command
