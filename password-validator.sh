#! /bin/bash
#set -ex
while [ true ]; do
	if [ "$1" = "-f" ]; then
	   shift 1
	   filename=$1
           #echo $filename
	   break
	else
	    echo "File path not provided"
	    exit 1
	fi
done

if [ ! -f "$filename" ]; then
	echo "Invalid file name provided."
	exit 1
fi


password=$(<$filename)
#echo $password
invalidSize=false
digitAbsent=false
smallcaseAbsent=false
uppercaseAbsent=false
validPassword=true
RED='\033[31m'
GREEN='\033[32m'
RESET='\033[m'
if [ "${#password}" -lt 10 ];  then
	invalidSize=true
	validPassword=false
fi
if [[ $password =~ ^[^0-9]+$ ]]; then
	digitAbsent=true
	validPassword=false
fi
if [[ $password =~ ^[^a-z]+$ ]] ; then
	smallcaseAbsent=true
	validPassword=false
fi
if [[ $password =~ ^[^A-Z]+$ ]] ; then
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
