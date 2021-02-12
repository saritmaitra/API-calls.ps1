# SOAP API PowerShell Script Examples
# To use the SOAP API you first must enable Webservices. 
# To do so, go to Admin > Configuration general tab. Enabling Webservices simply makes the ASP.NET SOAP and REST Webservices built into Secret Server available.

# The overall flow of accessing resources from a SOAP source are to access the source using New-WebServiceProxy, storing the results in a variable. 
# We’ll then run Get-Member to look at the methods your WebService offers, and then go from there with accessing it.

$url = "http://www.webservicex.net/length.asmx?WSDL"
$proxy = New-WebServiceProxy $url
$proxy | gm -memberType Method

#serviceProxy.ChangeLengthUnit() 

# Those definition types are long. It basically abbreviates down to (“NumberOfUnits”,”StartingLengthUnit”,”EndingLengthUnit”)
# We can give it a try to convert smaller proportions
$serviceProxy.ChangeLengthUnit(15,"Meters","Inches")
