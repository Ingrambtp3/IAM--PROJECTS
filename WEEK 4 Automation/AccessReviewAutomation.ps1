# Week 4 - PowerShell Automation Script for Access Review Decisions

# 1. Define tenant and app info
$tenantId = "your-tenant-id"
$clientId = "your-client-id"
$scopes = "https://graph.microsoft.com/.default"

# 2. Authenticate and get access token
$authResult = Get-MsalToken -TenantId $tenantId -ClientId $clientId -Interactive -Scopes $scopes
$token = $authResult.AccessToken

# 3. Define your Access Review Definition ID
$definitionId = "your-access-review-definition-id"

# 4. Get Access Review Instances (usually just 1 per review)
$instanceUrl = "https://graph.microsoft.com/beta/identityGovernance/accessReviews/definitions/$definitionId/instances"
$instanceResponse = Invoke-RestMethod -Uri $instanceUrl -Headers @{Authorization = "Bearer $token"} -Method Get
$instanceId = $instanceResponse.value[0].id  # Grabs the first instance ID

# 5. Pull Access Review Decision Results
$decisionsUrl = "https://graph.microsoft.com/beta/identityGovernance/accessReviews/definitions/$definitionId/instances/$instanceId/decisions"
$decisionsResponse = Invoke-RestMethod -Uri $decisionsUrl -Headers @{Authorization = "Bearer $token"} -Method Get

# 6. Export decision data to CSV
$csvPath = "$HOME/Desktop/AccessReview_Results.csv"
$decisionsResponse.value |
    Select-Object userDisplayName, userPrincipalName, decision, reviewedBy |
    Export-Csv -Path $csvPath -NoTypeInformation

Write-Host "✅ Access Review decisions exported to $csvPath"
