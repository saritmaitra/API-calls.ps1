# Invoke-RestMethod and Invoke-WebRequest cmdlets to make HTTP/REST calls
# We will call financial time-series data using Quandl API 
# https://www.quandl.com/data/CHRIS/MCX_NG1-Natural-Gas-Futures-Continuous-Contract-1-NG1-Front-Month

$url = https://www.quandl.com/api/v3/datasets/CHRIS/MCX_NG1.xml?api_key=my key
$web = Invoke-WebRequest -uri $url
$rest = Invoke-RestMethod -uri $url

# Invoke-RestMethod differs from Invoke-WebRequest by its passing ability. 
# Invoke-RestMethod natively understands the output a REST API method returns, which is typically JSON. 
# When the API does return JSON, Invoke-RestMethod will parse the JSON and return useful PowerShell objects. 

$web # call status
$web.content

$content = $web.content
$content

#$content.nutcstatus returns nothing. Because the result is a XML file we can tell Powershell that we are working with XML by putting before our variable.
$content.datasetstatus
[xml]$xml = $content
$xml.datasetstatus

# Now we have all the data in the Powershell pipeline. 
# However, Invoke-Restmethod returns the resulting XML back as a powershell object natively.

# Invoke-RestMethod is much better at dealing with XML and JSON results, while Invoke-WebRequest is better at dealing with straight HTML results. 
