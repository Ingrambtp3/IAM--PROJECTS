# test.ps1

# Simulate a flagged assignment
$mockFlaggedRoles = @(
    [PSCustomObject]@{
        Id = "1234-FAKE-ID"
        PrincipalId = "5678-FAKE-USER"
        RoleDefinitionId = "SecurityAdministrator"
        StartDateTime = (Get-Date).AddMinutes(-90)
        EndDateTime   = (Get-Date).AddMinutes(-30)
    }
)

# Export mock data
$mockFlaggedRoles | Export-Csv -Path "flagged_roles.csv" -NoTypeInformation

# View the result
Import-Csv -Path "flagged_roles.csv" | Format-Table
