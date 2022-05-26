$password=$args[0]

$invalidSize=$false
$digitAbsent=$false
$smallcaseAbsent=$false
$uppercaseAbsent=$false
$validPassword=$true


if ( $password.Length -lt 10 ){
	$invalidSize=$true
	$validPassword=$false
}
if  ( $password -match '^[^0-9]+$' ){
	$digitAbsent=$true
	$validPassword=$false
}
if  ( $password -cmatch '^[^a-z]+$' ){
	Write-HOST "$password"
	$smallcaseAbsent=$true
	$validPassword=$false
}
if  ( $password -cmatch '^[^A-Z]+$' ){
	$uppercaseAbsent=$true
	$validPassword=$false
}

if  ( $invalidSize -eq $true ){
	Write-HOST "Password size is less than 10" -fore red
}
if  ( $digitAbsent -eq $true ){
	Write-HOST "Password does not contain any digit!!" -fore red
}
if  ( $smallcaseAbsent -eq $true ){
	Write-HOST "Password does not contain any small case character!!" -fore red
}
if  ( $uppercaseAbsent -eq $true ){
	Write-HOST "Password does not contain any upper case character!!" -fore red
}
if  ( $validPassword -eq $true ){
	Write-HOST "Valid Password!!" -fore green
	exit 0
}
else{
	exit 1
}	