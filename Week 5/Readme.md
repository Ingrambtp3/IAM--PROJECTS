# Week 5 – Automate Temporary Role Activation via Entra ID PIM + PowerShell

## 🧠 Scenario
In a real-world enterprise, giving employees standing admin access is risky. The organization wants to make sure users can only activate high-privilege roles (like Security Administrator) **temporarily**, and **only when needed** — a concept called **Just-In-Time (JIT) access**.

As the IAM engineer, I built a script using **Microsoft Graph** and **PowerShell** that lets admins activate eligible PIM roles with a simple command — reducing privilege exposure while increasing efficiency.

---

## 🎯 Objective
- Make PIM role activations easier and safer using automation  
- Allow custom durations (1hr, 2hrs, etc.)  
- Log every activation for audit and compliance  
- Build a script that can be reused across the org

---

## 🔧 Tools & Technologies
- PowerShell  
- Microsoft Graph PowerShell SDK  
- Azure Entra ID  
- Privileged Identity Management (PIM)

---

## 🪜 Step-by-Step Breakdown

### ✅ 1. Assigned a Test User as “Eligible”
- In Entra ID → PIM → Roles → **Security Administrator**
- Assigned my test user as **eligible**, not active
- Required **justification**, **MFA**, and limited to **1-hour activations**
  
---

### 🔗 2. Connected to Microsoft Graph
![Screenshot 2025-05-10 at 11 28 58 AM CONNECTED TO MICROSOFT GRAPH](https://github.com/user-attachments/assets/3790728b-6638-4a15-8e26-d02f61872642)

---

### 🧍🏽3.Retrieved the User Object ID 
![Screenshot 2025-05-10 at 11 30 56 AMUSERID](https://github.com/user-attachments/assets/e374bbd5-1fd2-4b12-bb53-515efe947fe5)

---


### 📋4. Checked Eligible Role Assignments 
![Screenshot 2025-05-10 at 5 44 47 PM](https://github.com/user-attachments/assets/39a96b72-5c88-4e0e-ba01-bd99d589f7ed)
This shows what roles the user is eligible to activate. In this scenario, it's the Security Admin role.

---

### 🚀5. Activated the Role Manually via Script
![Screenshot 2025-05-10 at 5 54 14 PM](https://github.com/user-attachments/assets/77f51d45-872b-41d1-8fa7-7f7ba3f640ba)
This activates the eligible role TEMPORARILY using Microsoft Graph.

---

###🛠️ BONUS: Enterprise Ready Script
I created a reusable script called Activate-PIMRole.ps1 

---



