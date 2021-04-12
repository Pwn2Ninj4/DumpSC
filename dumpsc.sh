#!/usr/bin/bash

#Colorurs
green="\e[0;32m\033[1m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;30m\033[1m"
end="\033[0m"

BIN=$1

apt-get install xclip &> /dev/null

if [ -n "$1" ]; then

    echo -e "\n${red}|SHELLCODE|${end}"
    echo -e "${purple}"
    for i in $(objdump -d $BIN | grep "^ " | cut -f2); do
        echo -n '\x'$i | xclip -i
    done
    echo -e "${end}"
    
    echo -e "\n${red}[!]${end}${green}Shellcode copied to clipboard...${end}\n"
    

else

    echo -e "${red}[!]${end}${green}Usage: bash dumpsc <binary>${end}"

fi