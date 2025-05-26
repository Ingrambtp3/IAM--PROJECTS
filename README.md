# Identity and Access Management (IAM) Journey 🚀  

This repository showcases my hands-on work and implementations across key IAM domains including Microsoft Entra ID, Okta, AWS IAM, and identity governance best practices.  
Each weekly project simulates real-world IAM responsibilities such as access reviews, privileged access control, identity lifecycle automation, and zero trust enforcement.
---

## 📂 Weekly Progress  (WEEK 1)
- [Week 1 - Azure Conditional Access & MFA](week-1-iam)  

---

## 🔥 Topics Covered  
✅ Azure Entra ID (Conditional Access, MFA, RBAC)  
✅ Okta SSO, Group-Based Access Control  
✅ AWS IAM Roles, Policies, CloudTrail Logs  
✅ IAM Best Practices & Security Principles  

---

## 📂 Weekly Progress (WEEK 2)
-[Week 2 Scenario Based Remediation](https://github.com/Ingrambtp3/IAM--PROJECTS/tree/main/Week%202#readme)

## 🔥 Topics Covered  
✅Identify and remove excessive privileges from the test account.

✅ Access Reviews to monitor privileged role assignments.

✅ Privileged Identity Management (PIM) for secure and controlled administrative access.

---

### Weekly Progress (WEEK 3)
- [Week 3 – Access Reviews in Entra ID](https://github.com/Ingrambtp3/IAM--PROJECTS/tree/main/Week%203%20Access%20Reviews)
### ✅ Topics Covered
- Set up and tested Access Reviews to ensure users still need access
- Assigned reviewers and applied decisions to remove unnecessary access
- Practiced governance and cleanup using built-in tools in Entra ID

  ---
  
### 🛡️WEEK 4 – Automating Access Review Insights with PowerShell 🛡️

In this lab, I automated the process of pulling Access Review decision data using PowerShell and the Microsoft Graph API.  
I authenticated with a custom app registration, queried Access Review instances and decisions, and exported the results to a CSV for auditing.

🛠️ Skills Practiced:
- Microsoft Graph API
- PowerShell scripting
- Identity Governance automation
- Least privilege enforcement

📁 Project Folder: [Week 4 – PowerShell Access Review Automation](https://github.com/Ingrambtp3/IAM--PROJECTS/tree/main/WEEK%204%20Automation)

---

### 🔐 Week 5 – PIM Role Activation Automation
- Automated Just-In-Time (JIT) role activation using Microsoft Graph and PowerShell  
- Script accepts user email, role name, and access duration  
- Activates eligible PIM roles and logs each activation to a CSV file  
- Simulates real-world enterprise access governance and least privilege controls

📁 Project Folder: [Week 5 - PIM Role Activation Automation](https://github.com/Ingrambtp3/IAM--PROJECTS/tree/main/Week%205)

---

### 🔎 Week 6 – PIM Role Audit & Auto-Cleanup Script
**Goal:** Detect and clean up Entra ID PIM role assignments that remain active beyond their allowed time window using PowerShell and Microsoft Graph API.

**What I did:**
- Connected to Microsoft Graph to retrieve all **active role assignments**
- Used PowerShell to check which roles were still active **after 1 hour**
- Exported flagged assignments to a CSV for auditing
- Built in optional auto-removal logic for roles that break policy
- Created a **mock data test script** to simulate violations for testing

📁 Project Folder: [Week 6-PIM Role Audit & Auto-Cleanup](https://github.com/Ingrambtp3/IAM--PROJECTS/tree/main/Week%206#readme)

---

### ✅ Week 7 – Inactive Guest User Cleanup

- Scripted the detection and reporting of inactive guest accounts in Microsoft Entra ID  
- Used Microsoft Graph PowerShell SDK to pull all guest users and check last sign-in timestamps  
- Exported inactive accounts (30+ days or never signed in) to a CSV report  
- Simulated lifecycle cleanup and identity hygiene used in enterprise IAM practices

🔗 Project Folder: [Week 7 – Inactive Guest User Cleanup](https://github.com/Ingrambtp3/IAM--PROJECTS/tree/main/week%207)
