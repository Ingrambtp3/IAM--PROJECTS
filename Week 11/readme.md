# 🔐 Keycloak IAM Lifecycle (Joiner–Mover–Leaver) — ByteKage Labs  

## 🎯 Objective  
Build a complete **Identity and Access Management (IAM)** lifecycle using **Keycloak** running in a **Docker container**, simulating the **Joiner → Mover → Leaver (JML)** process with:  
- Role-Based Access Control (RBAC)  
- Multi-Factor Authentication (MFA)  
- Single Sign-On (OIDC)  
- Event Auditing and Logging  

---

## 🧩 What I Did  

1. **Set Up Keycloak in Docker**  
   - Created a working folder (`ByteKage Labs/JML-Keycloak`) and started Keycloak using:  
     ```bash
     docker run --name keycloak-jml -p 8080:8080 \
     -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=<YourStrongPassword> \
     -v "$HOME/Desktop/ByteKage Labs/JML-Keycloak":/artifacts \
     quay.io/keycloak/keycloak:24.0 start-dev
     ```
   - Accessed the admin console at [http://localhost:8080](http://localhost:8080).

2. **Created a Realm (Tenant)**  
   - Added a new realm named **ByteKageLab-Realm** to isolate users, roles, and apps.  
   - This represents a secure tenant boundary for identity management.

3. **Configured Roles and Groups (RBAC)**  
   - Created roles: `Manager` and `Employee`.  
   - Created groups: `HelpDesk` and `HR`.  
   - Mapped:
     - `HelpDesk` → `Manager`  
     - `HR` → `Employee`

4. **Created Joiner (New User)**  
   - Added **Barry Allen** as a new user.  
   - Assigned him to the **HelpDesk** group (Manager privileges).  
   - Enabled MFA setup and forced password change on first login.

5. **Enabled MFA (TOTP)**  
   - Configured the realm’s OTP policy.  
   - On first login, Barry was prompted to scan a QR code via Authenticator app.  
   - MFA ensured strong authentication aligned with Zero Trust principles.

6. **Configured Single Sign-On (OIDC)**  
   - Created an OIDC client (`bytekage-app`) for SSO testing.  
   - Configured:
     - **Root URL:** `http://localhost:8080`  
     - **Redirect URIs:** `http://localhost:8080/*`
   - Tested successful login and application listing in user console.

7. **Troubleshot “Page Not Found” Error**  
   - Initial SSO test failed due to incorrect Root URL.  
   - Fixed the issue by updating the Root URL and redirect URIs.  
   - Validated successful login redirection afterward.

8. **Simulated Mover (Department Transfer)**  
   - Moved Barry from **HelpDesk** → **HR**.  
   - Verified his role changed automatically from **Manager → Employee**.  
   - This tested dynamic access changes during internal transfers.

9. **Simulated Leaver (Offboarding)**  
   - Disabled Barry’s account under the user settings.  
   - Attempted login — access denied as expected.  
   - Later testing showed login failures were due to not re-enabling the account — an accurate IAM safeguard.

10. **Enabled Audit and Event Logging**  
    - Under Realm Settings → Events, enabled:  
      - `Save Events`  
      - `Admin Events`  
      - `Include Representation`
    - Captured both admin and user events for compliance and traceability.

---

## ✅ Value This Adds to a Company  

- 🔄 **Lifecycle Automation:** Demonstrates end-to-end user lifecycle control (Joiner → Mover → Leaver).  
- 🔐 **Strong Authentication:** MFA and password rotation simulate real-world Zero Trust enforcement.  
- 🧠 **Governance-Ready IAM:** Includes auditing, group-based roles, and compliance logging.  
- ⚙️ **Troubleshooting Insight:** Shows understanding of misconfigurations and how to remediate them.

---

## 🧠 Key Concepts  

| Term | Definition |
|------|-------------|
| **Keycloak** | Open-source IAM platform for SSO, MFA, and RBAC. |
| **Docker** | Containerization tool used to isolate Keycloak environment. |
| **JML Lifecycle** | Joiner–Mover–Leaver — framework for user identity management. |
| **OIDC (OpenID Connect)** | Protocol for federated identity and SSO. |
| **RBAC** | Role-Based Access Control — access granted based on roles. |
| **MFA (TOTP)** | Adds a second layer of authentication for stronger security. |

---

## ⚠️ Troubleshooting Notes  

| Issue | Cause | Fix |
|-------|--------|-----|
| **SSO “Page Not Found” Error** | Incorrect Root URL / Redirect URI | Updated both to `http://localhost:8080/*` |
| **Barry Login Failed** | Account was disabled after Leaver test | Re-enabled account for testing |
| **Logs Missing** | Events not saved in config | Enabled both User & Admin Events |

---

## 🧩 Why JML is Critical for Enterprises  

- 🏢 **Joiner:** Ensures new hires are onboarded securely with correct permissions.  
- 🔁 **Mover:** Prevents *privilege creep* when users change departments.  
- 🚫 **Leaver:** Revokes all access immediately, reducing insider threat risk.  

**If done correctly:**  
- Access adjusts automatically through groups and policies.  
- Compliance and audit readiness are built-in.  
- Human error and manual misconfigurations are minimized.  

**If done poorly:**  
- Dormant accounts become breach vectors.  
- Stale permissions violate least privilege principles.  
- Missing logs cause audit failures.  

---

## 🗂️ Lab Environment  

- **macOS (Host)** running **Docker Desktop 4.x**  
- **Keycloak 24.0** containerized environment  
- **Chrome Browser** for Admin and User console access  
- **Local folder**: `~/Desktop/ByteKage Labs/JML-Keycloak/` for storing artifacts and logs  

---


## 📸 Screenshots  

All project screenshots — including realm creation, RBAC setup, MFA enforcement, SSO configuration, and audit logging — are available in the folder below:

👉 [View All Screenshots](https://github.com/Ingrambtp3/IAM--PROJECTS/tree/main/Week%2011%20Keycloak%20JML/screenshots)

Each image follows the full Joiner → Mover → Leaver workflow:
- Realm & Role Setup  
- User Creation & MFA  
- SSO Configuration  
- Account Deactivation & Auditing  

If you’re walking through this lab, open each image in order to visually follow the lifecycle process from start to finish.
---

## 🧠 Lessons Learned  

- IAM is more than logins — it’s **identity governance**.  
- Proper JML automation prevents **human error and privilege creep**.  
- Misconfigurations (like a bad redirect URI) are realistic enterprise problems.  
- Full auditing gives **visibility, compliance, and control**.  

> “Access should evolve with the user — never stay behind with their old role.”

---

## 👨‍💻 Author  

**Allon Ingram**  
*ByteKage Labs — Building Secure IAM Workflows for the Future*  
🌐 [https://github.com/Ingrambtp3/IAM--PROJECTS](https://github.com/Ingrambtp3/IAM--PROJECTS)
