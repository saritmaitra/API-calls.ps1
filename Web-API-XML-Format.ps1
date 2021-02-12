# We will call financial time-series data using Quandl API 
# https://www.quandl.com/data/CHRIS/MCX_NG1-Natural-Gas-Futures-Continuous-Contract-1-NG1-Front-Month

$url = https://www.quandl.com/api/v3/datasets/CHRIS/MCX_NG1.xml?api_key=my key
$web = Invoke-WebRequest -uri $url

$web # call status
$web.content

$content = $web.content
$content

#$content.nutcstatus returns nothing. Because the result is a XML file we can tell Powershell that we are working with XML by putting before our variable.
$content.nutcstatus
[xml]$xml = $content
$xml.nutcstatus

# Now we have all the data in the Powershell pipeline. 
# However, Invoke-Restmethod returns the resulting XML back as a powershell object natively.

# Invoke-RestMethod is much better at dealing with XML and JSON results, while Invoke-WebRequest is better at dealing with straight HTML results. 
