# 🛡️Week 4 – Automating Access Review Insights with PowerShell & Microsoft Graph API🛡️

## ✨Overview✨
In this IAM-focused automation project, I used **PowerShell** and the **Microsoft Graph API** to extract and export Access Review decision data from Microsoft Entra ID (Azure AD). This project demonstrates how automation can be used to strengthen identity governance by regularly auditing access decisions.

## Real-World Scenario🕵🏾
Imagine you're part of an IT security team in an enterprise where regulatory compliance and internal governance require quarterly access reviews. Every quarter, managers must validate that all users with privileged access still require it. With hundreds of privileged accounts, manually reviewing each decision is cumbersome and error-prone. 

In this scenario, this automation script empowers your team to:

✅ **Automatically extract decision data** from Access Reviews.

✅**Consolidate information** about users, decisions, and reviewers in a CSV file.

✅**Quickly identify anomalies**, such as accounts approved without proper justification or decisions pending too long.

✅**Provide data-driven insights** during governance meetings to support revoking or adjusting unnecessary privileges.

This ensures timely remediation of potential security risks while freeing up valuable administrative time.

## ✨Goals✨
- Authenticate to Microsoft Graph securely via PowerShell.
- Pull Access Review instances and decision results.
- Export decision data to CSV for analysis and reporting.

## Tools & Technologies🛠️
- PowerShell (on macOS)
- Microsoft Graph API (beta endpoint)
- MSAL.PS module for authentication
- Microsoft Entra ID / Azure AD

## 🎯Key Steps🎯
1. **Register a native app** in Entra ID to enable API access.
2. **Connect to Microsoft Graph** using interactive authentication.
3. **Query the Access Review instance** and its decision data using `Invoke-RestMethod`.
4. **Export the decision data to CSV**, making it ready for analysis and reporting.

## 🔋Script Highlights🔋
- **Authentication:** Uses `Get-MsalToken` for a secure interactive login.
- **Dynamic Querying:** Retrieves Access Review instances and decisions via Graph API.
- **Data Export:** Automates the generation of CSV reports with key review details (user, decision, reviewer).

## ✏️Sample Output✏️
A sample CSV (e.g., `AccessReview_Results.csv`) might include:
- **userDisplayName:** Name of the user reviewed.
- **userPrincipalName:** The user's login or email.
- **decision:** Outcome of the review (Approved/Denied/NotResponded).
- **reviewedBy:** The name of the reviewer who made the decision.

## 🚀Use Cases🚀
- **Audit Compliance:** Automatically verify that users with privileged access are still appropriate.
- **Governance Reporting:** Generate routine reports for management reviews and audit preparation.
- **Operational Efficiency:** Reduce manual workload and errors by automating routine access reviews.

## 💻Next Steps💻
- Expand the script to automate scheduled review extractions.
- Add email notifications or Slack alerts when reviews indicate anomalies.
- Integrate with Privileged Identity Management (PIM) to automate remedial actions based on review outcomes.

---

📁 **Full Script Available Here:**  
`Week 4 – PowerShell Access Review Automation/AccessReviewAutomation.ps1`

