# https://idratherbewriting.com/learnapidoc/

# Invoke_WebRequest is the cmdlet to interface with RESTful web API


# We may replace the URL values to match our scenario
$url_base = "https://cat-fact.herokuapp.com"
$url_endpoint = "/facts"
$url = $url_base + $url_endpoint

$response = Invoke-RestMethod -uri $url -Method Get -ContentType "application/json" -headers $header

#option 1 for display/utilization
foreach($item in $response.all)
{
$item
}

#option 2 for display/utilization
$response | ConvertTo-Json #-Depth 4
$response | ConvertTo-Json -Depth 4


# v2
#Query root endpoint
Invoke-RestMethod -Uri 'https://api.github.com' -Method Get

#Query user endpoint
Invoke-RestMethod -Uri 'https://api.github.com/users/saritmaitra' -Method Get

# header to request a specific version (v3)
$header = @{ 'Accept' = 'application/vnd.github.v3+json' } 
Invoke-RestMethod -Uri 'https://api.github.com' -Method Get -Headers $header

#run without pagination setting
$repos = Invoke-RestMethod -Uri 'https://api.github.com/users/PowerShell/repos' -Method Get
$repos | Measure-Object

#run with pagination setting in the URI (1 page with max 100 items)
$repos = Invoke-RestMethod -Uri 'https://api.github.com/users/PowerShell/repos?page=1&per_page=100' -Method Get
$repos | Measure-Object

#run specifying pagination setting (1 page with max 100 items)
$body = @{
    'page' = 1
    'per_page' = 50
}

$body
$repos = Invoke-RestMethod -Uri 'https://api.github.com/users/PowerShell/repos' -Method Get -Body $body
$repos | Measure-Object
