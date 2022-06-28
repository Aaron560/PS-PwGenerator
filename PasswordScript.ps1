$url = "http://192.168.1.1/1.2.4/login.html"
$loginName = "admin"
$Pass = "XX37Msw3XdGSYMM"


#GeneratesRandom Password to be used for changing wifi password.
$Passwordlength = '10'
$NonAlphanumeric = '6'
$CreatePassword =[System.Web.Security.Membership]::GeneratePassword($Passwordlength, $NonAlphanumeric)
$wifiNames =
'Rebellious Amish Family',
'Not a Meth Lab',
'Definitely a Meth Lab',
'FBI Surveillance Van 3',
'I am Always Watching',
'Hack of All Trades',
'Russian Hackers',
'LAN-Rover',
'You Will Regret This',
'Clean Your Glasses!',
'Wi-Fi for the Recently Deceased',
'The Promised LAN',
'Reserved for Guests I Hate',
'Open Sesame',
'Jump on the Bandwidth',
'Look Ma, No Wires!',
'Im Under Your Bed',
'Enter the Dragons Wi-Fi',
'Wi of the Figer',
'Bob DyLAN'

$CreatePassword
$NewwifiName = Get-Random -InputObject $wifiNames
$NewwifiName



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
$SSID_24g.value = "$NewwifiName"

$pwd_24g = $ie.document.getElementByID('pwd_24g')
$pwd_24g.click()
$pwd_24g.value = "$CreatePassword"

$Save = $ie.document.getElementByID('save')
$Save.click()

$confirmButton = $ie.document.getElementByName('confirm')
$confirmButton.click()
