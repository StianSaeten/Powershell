$strClass = "organizationalUnit"
$strOUName = "OU=MyTestOU"
$objADSI = [ADSI]"LDAP://DC=Montel,DC=local"
$objOU = $objADSI.Create($strClass, $strOUName)
$objOU.setInfo()