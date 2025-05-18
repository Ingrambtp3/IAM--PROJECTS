# 📁 Week 6 – Audit & Auto-Cleanup of Active PIM Role Assignments

---

## 🧠 Scenario: Compliance Catch-up

Your organization uses Microsoft Entra ID PIM (Privileged Identity Management) to grant just-in-time access to privileged roles like **Security Administrator**. However, during a routine audit, it was discovered that **some users still had active role assignments** beyond their approved duration — a potential security risk.

As the IAM engineer, I was tasked with automating the **audit and cleanup process** using PowerShell and Microsoft Graph API. This ensures access is revoked if users retain elevated access longer than our defined threshold.

---

## 🎯 Goal

- Detect all currently **active PIM role assignments**
- Identify assignments that **exceed a set duration** (e.g., 1 hour)
- Export flagged assignments to a **CSV log**
- *(Optional)* Remove or deactivate flagged assignments automatically

---

## 🧰 Tools & Services Used

- Microsoft Entra ID PIM
- Microsoft Graph API (beta)
- PowerShell
- CSV reporting for audit trail

---

## 🚀 Step-by-Step Guide

---

### ✅ Step 1: Connect to Microsoft Graph
![week 6 step 1 ](https://github.com/user-attachments/assets/5223dc5f-4299-45d8-a380-5aa7e4019d19)

---

### ✅ Step 2: Retrieve Active Role Assignments 
![week  6 step 2 ](https://github.com/user-attachments/assets/46d25031-cf32-49ac-8b39-ade133c4fe37)

---

### ✅ Step 3: Filter for Long-Running Active Roles
![Week 6 step 3](https://github.com/user-attachments/assets/467b38be-e914-4b8b-960b-efaee439a212)

---

### ✅ Step 4: Export Flagged Assignments to CSV
![Screenshot 2025-05-18 at 3 10 36 PM](https://github.com/user-attachments/assets/9179ba31-4aa3-474d-bed0-5b11e6196fc4)
As you can see, I did not get any data. This is because I have no active assignments that have exceeded their time limit.
Therefore, to test my script I created Mock Data in  step 7 of this lab.

---

### ✅ Step 5: Auto-Remove the Role
![Screenshot 2025-05-18 at 3 15 43 PM](https://github.com/user-attachments/assets/cf35a416-c191-4c8b-a23e-d270733093a8)

---

### ✅ Step 6: View the Exported CSV (MAC)
![Screenshot 2025-05-18 at 3 17 11 PM](https://github.com/user-attachments/assets/65097a8b-7285-4411-88ef-9ed46e6bdf80)

---

### 🧪 Step 7:Testing with Mock Data (No Real Flags Yet)
Since there were no real assignments flagged yet. (I just activated a test user for < 1 hour) I decided to utilize ChatGPT to generate mock data for testing the audit and export logic, ensuring the script worked even when no real violations existed. 
![Screenshot 2025-05-18 at 2 49 56 PM](https://github.com/user-attachments/assets/945dd4cf-a3a5-411b-8224-75fe4184870a)

---

### 📌 What I learned 
- How to audit privileged role usage across Entra ID
- How to detect access overages that go past approved duration
- The importance of enforcing least privilege and cleanup
- How to simulate IAM scenarios using powershell for testing

---


