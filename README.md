# 🛡️ Identity & Access Management (IAM) Labs – By The BYTEKAGE

Welcome to my IAM project series — a hands-on portfolio designed to showcase real-world Identity and Access Management implementations using Microsoft Entra ID, Auth0, PowerShell, and Microsoft Graph API.

These labs reflect my practical experience and professional growth as I transition deeper into the IAM space, building the technical skills required to design, secure, and automate modern identity systems.

🧠 I'm not just learning — I'm executing.  
📈 I'm not just documenting — I'm building.  
🌍 I'm not just growing — I'm showing the path for others breaking into tech.

---

## 🎯 Why These Labs Matter

- Every project simulates a real-world scenario an IAM engineer or security analyst would face
- Each lab reinforces identity governance, automation, role-based access control, SSO, and more
- I use these labs to deepen my own mastery **and** to help others see what it looks like to do the work that earns the role

Whether you're a hiring manager, aspiring IAM pro, or someone curious about what identity looks like in action — this repo shows the receipts.

------

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

---

# 🔐 Week 8 – SAML SSO Lab: Auth0 (IdP) → Microsoft Entra ID (SP)

In this lab, I configured a SAML-based Single Sign-On (SSO) flow using **Auth0 as the Identity Provider (IdP)** and **Microsoft Entra ID as the Service Provider (SP)**. I manually set up the SAML integration by exporting metadata from Auth0, uploading the X.509 signing certificate into Entra, and defining the ACS and Entity ID settings. After assigning a test user in Entra, I confirmed the flow end-to-end using an IdP-initiated login that redirected to a custom GitHub Pages landing page.

---

## ✅ Key Topics Covered

- SAML 2.0 protocol fundamentals: NameID, ACS URL, Entity ID
- Identity federation between Auth0 and Entra ID
- X.509 certificate trust setup in Entra
- Redirect handling and custom post-login landing pages
- Real-world SSO lab structure and documentation

---

## 🧰 Tools & Technologies

- Auth0 (SAML IdP)
- Microsoft Entra ID (SAML SP)
- X.509 Certificates
- GitHub Pages

---

## 🔐 Outcome

This project shows how to federate identity between a third-party IdP and Microsoft Entra using SAML 2.0. It simulates real enterprise SSO setups and reinforces identity federation, assertion handling, and trust relationships across platforms.
🔗 Project Folder: [Week 8- SAML SSO Lab: Auth0 (IdP) → Microsoft Entra ID (SP)](https://github.com/Ingrambtp3/IAM--PROJECTS/tree/main/week%208)

---

# 🔐 Week 9 – Hybrid Identity Lab: bytekagelab.local → Microsoft Entra ID

In this lab, I created a hybrid identity environment by deploying a Windows Server 2019 VM in Azure and configuring it as a domain controller (`bytekagelab.local`). I installed Azure AD Connect and synced on-prem AD users to Microsoft Entra ID. This simulates how organizations bridge legacy identity infrastructure with cloud-based directories.

---

## ✅ Key Topics Covered

- Active Directory Domain Services (AD DS) configuration
- Azure AD Connect setup and sync
- PowerShell-based manual sync triggering
- Troubleshooting module import and sync cmdlets
- Hybrid identity architecture in real-world environments

---

## 🧰 Tools & Technologies

- Windows Server 2019 (Azure VM)
- Active Directory Domain Services (AD DS)
- Azure AD Connect
- Microsoft Entra ID (Azure AD)
- PowerShell

---

## 🔐 Outcome

This project demonstrates how hybrid identity works by integrating on-prem AD with Microsoft Entra. I gained hands-on experience with directory synchronization, identity provisioning, and PowerShell troubleshooting — replicating enterprise IAM workflows.

🔗 Project Folder: [Week 9 – Hybrid Identity Lab][(https://github.com/Ingrambtp3/IAM--PROJECTS/tree/main/week09-hybrid-identity-ad-sync)]

---

# 🔐 Week 10 – Hybrid Identity Access Governance: Group-Based App Provisioning

In this lab, I extended my hybrid identity environment by implementing role-based access control (RBAC) and automated cloud app provisioning. I created security groups in on-prem Active Directory, synced them to Microsoft Entra ID using Azure AD Connect, and assigned these groups to the ServiceNow app. I then added test users to the on-prem groups and verified that access was automatically granted in the cloud.

---

## ✅ Key Topics Covered

- On-prem AD security group creation and structure  
- Azure AD Connect group synchronization  
- Enterprise application assignment to groups in Microsoft Entra  
- Automatic cloud access provisioning through group membership  
- Real-world RBAC and onboarding simulation

---

## 🧰 Tools & Technologies

- Windows Server 2019 (Azure VM)  
- Active Directory Users and Computers (ADUC)  
- Azure AD Connect  
- Microsoft Entra ID (Azure AD)  
- ServiceNow (Enterprise App)

---

## 🔐 Outcome

This project showcases how organizations can automate access provisioning using group-based role assignments. By linking on-prem group membership to cloud app access through Entra ID, I simulated a real-world identity governance flow that improves onboarding efficiency and enforces least privilege.

🔗 Project Folder: [Week 10 – Hybrid Identity Access Governance](https://github.com/Ingrambtp3/IAM--PROJECTS/tree/main/Week%2010)
