# 🧾 Week 7 – Inactive Guest User Cleanup in Microsoft Entra ID (Azure AD)

## 🛡️ Project Overview 🛡️
This script identifies **inactive guest users** in a Microsoft Entra ID (Azure Active Directory) tenant. It uses the **Microsoft Graph API** to query all users with `userType` set to `"Guest"` and evaluates their last sign-in activity. Any guest who hasn't signed in within the past **30 days** (or has never signed in) is reported and optionally disabled.

> 🔒 Inactive external identities can pose a security risk. This script helps clean up dormant accounts and enforce access hygiene across your environment.

---

## 💻 Technologies Used
- PowerShell
- Microsoft Graph PowerShell SDK
- Microsoft Entra ID (Azure AD)
- CSV for reporting

---

## 📂 Features
- Connects to Microsoft Graph securely using delegated permissions
- Queries all guest accounts (`userType eq 'Guest'`)
- Checks `SignInActivity.LastSignInDateTime`
- Filters users inactive for 30+ days
- Exports results to CSV for audit/reporting
- Optional: Disables inactive guest accounts

---

## 🔧 Setup Instructions

### 1. Register an App in Entra ID
- Go to **Azure Portal > App Registrations > New Registration**
- Name: `InactiveGuestCleanup`
- Add API permissions:
  - `User.Read.All` (Delegated)
  - `Directory.Read.All` (Delegated)
- Grant admin consent

### 2. Install Microsoft Graph SDK
```powershell
Install-Module Microsoft.Graph -Scope CurrentUser -Force
```
### 3. Authenticate
```powershell
Connect-MgGraph -Scopes "User.Read.All", "Directory.Read.All"
```
---

### 4. Run the Script ▶️
```powershell
# Get all guest users
$guests = Get-MgUser -Filter "userType eq 'Guest'" -All

# Filter for inactive users
$inactiveGuests = @()
foreach ($user in $guests) {
    $lastSignIn = $user.SignInActivity.LastSignInDateTime
    if ($lastSignIn) {
        $inactiveDays = (Get-Date) - [datetime]$lastSignIn
        if ($inactiveDays.Days -ge 30) {
            $inactiveGuests += $user
        }
    } else {
        $inactiveGuests += $user
    }
}

# Export to CSV
$inactiveGuests | Select-Object DisplayName, UserPrincipalName, @{Name="LastSignInDateTime";Expression={$_.SignInActivity.LastSignInDateTime}} |
Export-Csv -Path ".\Inactive_Guests_Report.csv" -NoTypeInformation
```

---

### Optional: Disable Inactive Guest Accounts
```powershell
foreach ($user in $inactiveGuests) {
    Update-MgUser -UserId $user.Id -AccountEnabled:$false
}
```
---

### Testing 🧪
If no real guest users exist:
 Create a mock guest in Entra ID and DO NOT SIGN IN.
 
 Or simulate $guests with mock data in Powershell to test filtering/ export logic.

---

### Sample Output 📸
![Screenshot 2025-05-26 at 12 25 04 PM](https://github.com/user-attachments/assets/1e498d28-fab9-4431-828d-204eed0885e1)
![Screenshot 2025-05-26 at 12 02 58 PM](https://github.com/user-attachments/assets/e0f008a9-68b2-465a-8b38-67d91276aa2c)

---
### Notes 📌
- Sign-in data may take 30-60 Minutes to reflect in Microsoft Graph after a user logs in.
- Make sure your tenant has sign-in logs diagnostic settings enabled if "SignInActivity" is not populated. 
