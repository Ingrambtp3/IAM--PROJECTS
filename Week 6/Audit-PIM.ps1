# Week 6 - Audit & Auto-Cleanup of Active PIM Role Assignments

# Connect to Microsoft Graph (you must be signed in with appropriate permissions)
Connect-MgGraph -Scopes "RoleManagement.Read.Directory", "Directory.Read.All"
Select-MgProfile -Name "beta"

# Step 1: Get all active PIM role assignment instances
$activeRoles = Get-MgRoleManagementDirectoryRoleAssignmentScheduleInstance -ExpandProperty "*"

# Step 2: Set your expiration threshold
$now = Get-Date
$thresholdMinutes = 60  # Change this to test different expiration windows

# Step 3: Filter for roles active too long
$flaggedRoles = $activeRoles | Where-Object {
    $_.EndDateTime -ne $null -and 
    ($now - $_.StartDateTime).TotalMinutes -gt $thresholdMinutes
}

# Step 4: Output flagged roles to terminal
$flaggedRoles | Select-Object Id, PrincipalId, RoleDefinitionId, StartDateTime, EndDateTime | Format-Table

# Step 5: Export flagged roles to CSV for audit logs
$flaggedRoles | Select-Object Id, PrincipalId, RoleDefinitionId, StartDateTime, EndDateTime |
Export-Csv -Path "flagged_roles.csv" -NoTypeInformation

# OPTIONAL Step 6: Automatically remove flagged roles (uncomment to activate)
<# 
foreach ($role in $flaggedRoles) {
    Remove-MgRoleManagementDirectoryRoleAssignmentScheduleInstance `
        -DirectoryRoleAssignmentScheduleInstanceId $role.Id `
        -Confirm:$false
}
#>

Write-Host "`n✅ Script complete. CSV exported to 'flagged_roles.csv'"
