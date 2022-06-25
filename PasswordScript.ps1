$url = "Insert your value here."
$loginName = "Insert your value here."
$Pass = "Insert your value here."


#GeneratesRandom Password to be used for changing wifi password.
$Passwordlength = '10'
$NonAlphanumeric = '6'
$CreatePassword =[System.Web.Security.Membership]::GeneratePassword($Passwordlength, $NonAlphanumeric)

$CreatePassword



#browser Automation for login.
$ie = New-Object -ComObject 'internetExplorer.Application'
$ie.Visible= $true # Make it visible

$username="$loginName"
$password="$pass"

$ie.Navigate("$url")

Start-Sleep -Seconds 3

$usernamefield = $ie.document.getElementByID('username')
$usernamefield.value = "$username"

$passwordfield = $ie.document.getElementByID('password')
$passwordfield.value = "$password"

$Link = $ie.document.getElementByID('login-btn')
$Link.click()

Start-Sleep -Seconds 3

$SSID_24g = $ie.document.getElementByID('ssid_24g')
$SSID_24g.click()
$SSID_24g.value = "test"
