#!/bin/bash
echo "Menu: "
echo "1) Start nano"
echo "2) Start vi"
echo "3) Start links"
echo "4) Exit!"
read comand
case $comand in
1) nano
;;
2) vi
;;
3) links
;;
4) exit 0
esac
