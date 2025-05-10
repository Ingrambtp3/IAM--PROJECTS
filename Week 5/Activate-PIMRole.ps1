param (
    [string]$UserEmail,
    [string]$RoleName,
    [string]$Duration = "PT1H"
)

# Step 1: Connect to Microsoft Graph
Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory", "Directory.Read.All"

# Step 2: Get user info
$user = Get-MgUser -UserId $UserEmail
$userId = $user.Id

# Step 3: Get role info
$role = Get-MgRoleManagementDirectoryRoleDefinition | Where-Object { $_.DisplayName -eq $RoleName }
$roleId = $role.Id

# Step 4: Create role activation request
$params = @{
    Action = "adminAssign"
    PrincipalId = $userId
    RoleDefinitionId = $roleId
    DirectoryScopeId = "/"
    Justification = "Temporary access needed"
    ScheduleInfo = @{
        StartDateTime = (Get-Date).ToString("o")
        Expiration = @{
            Type = "AfterDuration"
            Duration = $Duration
        }
    }
}

# Step 5: Submit the request
New-MgRoleManagementDirectoryRoleAssignmentScheduleRequest -BodyParameter $params

# Step 6: Log the activation
@{
    Timestamp = Get-Date
    User = $UserEmail
    Role = $RoleName
    Duration = $Duration
} | Export-Csv -Path "./PIM_Activations_Log.csv" -Append -NoTypeInformation
