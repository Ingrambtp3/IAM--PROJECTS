# 🔐 Week 10 – Hybrid Identity Access Governance Lab

## 🎯 Objective  
Simulate a real-world hybrid identity environment where cloud application access is governed automatically based on a user's on-prem group membership using Azure AD Connect, Microsoft Entra ID, and ServiceNow.

---

## 🧩 What I Did  

1. **Created On-Prem AD Security Groups**  
   - Made role-based groups in Active Directory (e.g., `Finance Users`, `HR Admins`, `IT Support`).

2. **Synced Groups to Microsoft Entra ID**  
   - Used Azure AD Connect to sync the on-prem groups to Microsoft Entra ID.  
   - Verified the group source was `Windows Server AD`.

3. **Assigned ServiceNow to Groups**  
   - In Microsoft Entra ID → Enterprise Applications → ServiceNow  
   - Assigned the synced groups to the app (no manual user assignment).

4. **Tested Automatic Access Provisioning**  
   - Created test users in on-prem AD.  
   - Added each user to one of the synced groups.  
   - Triggered Azure AD Connect sync.  
   - Verified users appeared in Entra ID and were automatically assigned to ServiceNow.

---

## ✅ Value This Adds to a Company  

- 🔄 **Automated Onboarding** – New hires get access to apps instantly based on their group (no manual steps).  
- 🔒 **Least Privilege** – Access is role-based and tied to AD security groups.  
- 🏢 **Hybrid Cloud Ready** – Shows I can manage identities across on-prem + cloud environments using native tools.

---

## 🧠 Key Concepts  

| Term | Definition |
|------|------------|
| **Azure AD Connect** | Tool used to sync on-prem AD users/groups to Microsoft Entra ID. |
| **Entra ID** | Microsoft’s cloud identity platform (formerly Azure AD). |
| **Enterprise Applications** | Apps like Microsoft 365 or ServiceNow that can be assigned to users or groups. |
| **RBAC** | Role-Based Access Control – controlling access based on user roles/groups. |

---

## 📸 Screenshots  
<img width="468" height="267" alt="Screenshot 2025-08-02 at 3 09 39 PM" src="https://github.com/user-attachments/assets/772e34b5-f706-41e9-b493-19a09fb6b4f4" />
<img width="637" height="504" alt="Screenshot 2025-08-02 at 3 12 27 PM" src="https://github.com/user-attachments/assets/fbcf346d-3b86-4c40-b0c7-90122962059d" />
<img width="856" height="392" alt="Screenshot 2025-08-02 at 3 13 12 PM" src="https://github.com/user-attachments/assets/ca4f78c4-d130-491b-b00b-6624b2e7fe58" />
<img width="1362" height="318" alt="Screenshot 2025-08-02 at 3 14 43 PM" src="https://github.com/user-attachments/assets/66fab17a-4339-4ca0-985a-2c85d81904dd" />
<img width="691" height="580" alt="Screenshot 2025-08-02 at 2 51 19 PM" src="https://github.com/user-attachments/assets/52f2b8a1-c75c-49c4-8af8-b1e5ea91cb85" />
<img width="763" height="205" alt="Screenshot 2025-08-02 at 2 53 04 PM" src="https://github.com/user-attachments/assets/82db497d-7e4e-494b-bb9d-1d63081f5754" />
<img width="1371" height="301" alt="Screenshot 2025-08-02 at 3 22 35 PM" src="https://github.com/user-attachments/assets/1bdc419d-4b5e-408f-ae23-57a3092b7266" />
<img width="1081" height="485" alt="Screenshot 2025-08-02 at 2 55 38 PM" src="https://github.com/user-attachments/assets/1d031c26-d91b-4dbe-85e5-c66cf34c33c6" />

---

## 🗂️ Lab Environment  

- **Windows Server 2019 VM** (Domain Controller)  
- **Azure AD Connect installed on separate VM**  
- **Azure subscription** with Entra ID & ServiceNow test app  

---



