$strClass = "User"
$strOUName = "CN=MyTestUser"
$objADSI = [ADSI]"LDAP://OU=MyTestOU,DC=Montel,DC=local"
$objUser = $objADSI.Create($strClass, $strOUName)
$objUser.put("sAMAccountName", "MyTestUser")
$objUser.setInfo()
