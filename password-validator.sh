#! /bin/bash
#set -ex
invalidSize=false
digitAbsent=false
smallcaseAbsent=false
uppercaseAbsent=false
validPassword=true
RED='\033[31m'
GREEN='\033[32m'
RESET='\033[m'
if [ "${#1}" -lt 10 ];  then
	invalidSize=true
	validPassword=false
fi
if [[ $1 =~ ^[^0-9]+$ ]]; then
	digitAbsent=true
	validPassword=false
fi
if [[ $1 =~ ^[^a-z]+$ ]] ; then
	smallcaseAbsent=true
	validPassword=false
fi
if [[ $1 =~ ^[^A-Z]+$ ]] ; then
	uppercaseAbsent=true
	validPassword=false
fi

if [ "$invalidSize" = true ]; then
	echo -e "${RED}Password size is less than 10${RESET}"
fi
if [ "$digitAbsent" = true ] ; then
	echo -e "${RED}Password does not contain any digit!!${RESET}"
fi
if [ "$smallcaseAbsent" = true ]; then
	echo -e "${RED}Password does not contain any small case character!!${RESET}"
fi
if [ "$uppercaseAbsent" = true ]; then
	echo -e "${RED}Password does not contain any upper case character!!${RESET}"
fi
if [ "$validPassword" = true ]; then
	echo -e "${GREEN}Valid Password!!${RESET}"
fi	
