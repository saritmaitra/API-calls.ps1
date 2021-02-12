#https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/variablegroups/get%20variable%20groups?view=azure-devops-rest-5.1

$url_base = "MY_BASE_ENDPOINT_URL"
$url_endpoint = "MY_ENDPOINT"
$url = $url_base + $url_endpoint
$Personal_Access_Token = "MY_ACCESS_TOKEN"
$user = ""

$token = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user, $Personal_Access_Token)))
$header = @{authorization = "Basic $token"}

$response = Invoke-RestMethod -uri $url -Method Get -ContentType "application/json" -headers $header

$response | ConvertTo-Json -Depth 4

#v2
# With authentication
Invoke-RestMethod -Uri 'https://api.github.com/users/orgs' -Method Get -Headers $header
$error[0].Exception
$error[0].ErrorDetails.Message | ConvertFrom-Json

# window powershell 5.1
$header = @{
    'Authorization' = 'token xxxxxxxxxxx'
}
Invoke-RestMethod -Uri 'https://api.github.com/users/orgs' -Method Get -Headers $header

#powershell core
$token = Read-Host -Prompt 'API Token' -AsSecureString
Invoke-RestMethod -Uri 'https://api.github.com/users/orgs' -Method Get -Authentication OAuth -Token $token

# Auto de-serialization

# non-powershell returning row json
$curlOutput = curl 'https://api.github.com'
$curlOutput.Content

# powershell de-serialization the json automatically into PSCustomeObject
(Invoke-RestMethod -Uri 'https://api.github.com' -Method Get).GetType()
