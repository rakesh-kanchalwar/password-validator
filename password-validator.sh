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

printResults(){
	if [ "$1" = true ]; then
		echo -e "${RED}Password size is less than 10${RESET}"
	fi
	if [ "$2" = true ] ; then
		echo -e "${RED}Password does not contain any digit!!${RESET}"
	fi
	if [ "$3" = true ]; then
		echo -e "${RED}Password does not contain any small case character!!${RESET}"
	fi
	if [ "$4" = true ]; then
		echo -e "${RED}Password does not contain any upper case character!!${RESET}"
	fi
	if [ "$5" = true ]; then
		echo -e "${GREEN}Valid Password!!${RESET}"
		exit 0
	else
		exit 1
	fi
}
printResults $invalidSize $digitAbsent $smallcaseAbsent $uppercaseAbsent $validPassword
