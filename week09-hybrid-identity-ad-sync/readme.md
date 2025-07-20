# 🔐 Week 9 – Hybrid Identity Lab: On-Prem AD + Microsoft Entra ID (Azure AD Connect)

## 🧠 Overview

This lab was all about simulating a real-world **hybrid identity environment**, which is critical in modern enterprise IAM architecture. I deployed a cloud-based Windows Server 2019 VM, built out an **on-premises Active Directory domain**, and used **Azure AD Connect** to sync identities to Microsoft Entra ID.

I successfully created and synced multiple test users from `bytekagelab.local` to Microsoft Entra — mirroring how large organizations bridge their on-prem and cloud identity systems.

---

## 🎯 Purpose

Active Directory (AD) and hybrid identity work are core skills in Identity & Access Management (IAM). Many enterprise environments still run legacy on-prem infrastructure that must connect to the cloud securely. This lab shows I understand:

- How to deploy and configure a domain controller
- How to integrate AD with Microsoft Entra ID
- How to manage user identities in hybrid environments
- Real-world tools like Azure AD Connect and PowerShell for identity sync

This is more than a practice lab — it reflects what companies do every day when managing users across hybrid environments.

---

## 🛠️ Lab Objectives

- ✅ Provision a cloud-hosted Windows Server 2019 VM in Azure
- ✅ Install and configure Active Directory Domain Services (AD DS)
- ✅ Promote the VM to a domain controller (`bytekagelab.local`)
- ✅ Install and configure Azure AD Connect for directory sync
- ✅ Create and sync test users to Microsoft Entra ID
- ✅ Verify successful identity synchronization in the Entra portal
- ✅ Troubleshoot PowerShell module loading for forced sync

---

## 🔧 Lab Steps

### 1. Provisioned VM in Azure
- **OS**: Windows Server 2019 Datacenter  
- **VM Name**: `DC01`  
- **Size**: Standard B2s (2 vCPU, 4GB RAM)  
- **Networking**: RDP port open, auto-shutdown configured  
- **Purpose**: Simulated on-prem server environment

### 2. Configured Active Directory
- Installed **Active Directory Domain Services (AD DS)**
- Promoted the server to a domain controller for: `bytekagelab.local`
- Verified DNS and domain trust were properly configured

### 3. Installed Azure AD Connect
- Used **Express Setup** for simplified config
- Linked on-prem domain (`bytekagelab.local`) with Microsoft Entra tenant
- Authenticated using a **Global Admin account**

### 4. Created and Synced Test Users
- Created the following in AD:
  - `Test User01`
  - `TestUser1`
  - `TestUser2`
- Used PowerShell to trigger manual sync with:
  ```powershell
  Start-ADSyncSyncCycle -PolicyType Delta
---

## 📸 Screenshots
<img width="458" height="417" alt="Screenshot 2025-07-20 at 1 19 01 PM" src="https://github.com/user-attachments/assets/139cb90e-69d9-403c-8a21-a839340820f8" />
<img width="887" height="578" alt="Screenshot 2025-07-20 at 1 26 06 PM" src="https://github.com/user-attachments/assets/80b1ad8d-da5c-4b96-b673-6b8418b941aa" />
<img width="1225" height="708" alt="Screenshot 2025-07-20 at 1 32 11 PM" src="https://github.com/user-attachments/assets/a870e9d8-1d95-465e-91fa-e5d9ec59c0b9" />
<img width="845" height="667" alt="Screenshot 2025-07-19 at 5 50 52 PM" src="https://github.com/user-attachments/assets/19d3b749-e24c-48f8-894b-7ea277decb67" />
 <img width="798" height="571" alt="Screenshot 2025-07-20 at 1 34 08 PM" src="https://github.com/user-attachments/assets/477fb09f-fb89-4388-bd02-e2a22f37d8f5" />
<img width="444" height="310" alt="Screenshot 2025-07-20 at 1 56 31 PM" src="https://github.com/user-attachments/assets/ebc078cb-b5b9-4fbd-a4c1-219dfc7803e9" />
<img width="930" height="493" alt="Screenshot 2025-07-20 at 1 37 59 PM" src="https://github.com/user-attachments/assets/4731122c-594d-43a5-87d6-cc95b5b63d4a" />
<img width="581" height="429" alt="Screenshot 2025-07-20 at 2 11 54 PM" src="https://github.com/user-attachments/assets/05c7ce91-f163-4013-8d7c-6dd7bf693273" />
<img width="756" height="319" alt="Screenshot 2025-07-20 at 2 14 04 PM" src="https://github.com/user-attachments/assets/61bd67c8-3eb2-4d28-95d9-76ca0c46cf67" />
<img width="498" height="115" alt="Screenshot 2025-07-20 at 2 14 26 PM" src="https://github.com/user-attachments/assets/8313432f-bc0b-4987-a873-fbfe1ba31aa6" />
<img width="482" height="353" alt="Screenshot 2025-07-20 at 2 14 43 PM" src="https://github.com/user-attachments/assets/a3aee446-684e-43a7-b125-1c8c5cdbc3c1" />
<img width="291" height="256" alt="Screenshot 2025-07-20 at 2 15 29 PM" src="https://github.com/user-attachments/assets/06623db5-a17c-4357-864b-8ca621ba4a7d" />
<img width="483" height="341" alt="Screenshot 2025-07-20 at 2 16 34 PM" src="https://github.com/user-attachments/assets/e2ca995b-2e61-4984-a179-3e17c1efc287" />
<img width="809" height="163" alt="Screenshot 2025-07-20 at 2 40 06 PM" src="https://github.com/user-attachments/assets/4d263da1-6080-4684-8051-a6ebe458717a" />
<img width="1035" height="314" alt="Screenshot 2025-07-20 at 2 40 33 PM" src="https://github.com/user-attachments/assets/51d47d62-4559-4c55-990e-bb9490e3eea3" />



---

## 🧩 Why This Matters to Employers

Most organizations still maintain some level of **on-prem Active Directory** and rely on **hybrid identity setups** to operate securely.

By completing this lab, I’ve proven that I can:
- Set up and manage **Active Directory infrastructure**
- Understand and configure **cloud sync** using Azure AD Connect
- Troubleshoot **sync issues and PowerShell module errors**
- Document and explain every step like a real-world IAM professional

This lab shows I can **bridge traditional identity systems with modern cloud IAM**, which is a core requirement for roles in identity governance, cloud security, and enterprise IT.

---

## 🏁 Lab Status

✅ **Lab Completed**  
🛑 **Azure VM stopped** to prevent ongoing billing  
♻️ Environment is saved for future use in advanced IAM labs (SSO, Conditional Access, Password Writeback)

---

## 🚀 What’s Next (Week 10 Preview)

In **Week 10**, I plan to build on this foundation by:

- Enabling **Password Writeback** so cloud password changes sync to on-prem AD
- Creating and applying **Conditional Access Policies** in Microsoft Entra
- Connecting **SSO-enabled cloud applications** (like Salesforce or Dropbox)
- Exploring **device join and registration**
- Testing **group-based licensing** and **sync filtering**

---
