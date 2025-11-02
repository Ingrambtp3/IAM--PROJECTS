# 🛡️Week 12 — Okta ⇄ Salesforce JML (Joiner–Mover–Leaver) with SSO + Provisioning🛡️

**Goal:** Prove real-world identity lifecycle governance by integrating Okta (IdP) with Salesforce (SP) for both **SAML SSO** (login) and **SCIM/OAuth provisioning** (automated create/update/deactivate).

## Why this matters🕵🏾
- **Security:** Automatic deprovisioning closes access gaps the moment someone leaves.
- **Compliance:** Traceable events (who changed what, when) support audits.
- **Operational efficiency:** No manual account creation; HR/IT data changes flow through.

## Architecture (high-level)🧠
- **Auth:** Okta → Salesforce via **SAML** (users login with Okta).
- **Provisioning:** Okta → Salesforce via **SCIM over OAuth** (Okta creates/updates/deactivates users).
- **Source of truth:** Okta user profile (Title, Department, etc.) mapped to Salesforce fields.

## ✨Prerequisites✨
- Okta admin tenant (`integrator-******.okta.com`)
- Salesforce org (Prod or Sandbox) with admin user:
  - **API Enabled**
  - **Security Token**
- Salesforce Connected App with OAuth scopes:
  - `api`
  - `refresh_token, offline_access`
- Okta OIN app: **Salesforce.com** (SAML + SCIM capable)

## Setup Summary⚡️

### 1) Configure SSO (SAML)💻
- Add **Salesforce.com** in Okta, configure SAML.
- In Salesforce, import Okta metadata and enable SSO.
- **Proof:** `screenshots/02-sso-config-complete.png`
<img width="1410" height="602" alt="02-sso-config-complete" src="https://github.com/user-attachments/assets/c3468d36-ab95-412c-a37b-f98c16e1fb97" />
<img width="1204" height="227" alt="02 5-oktaadminconsole-salesforce-active" src="https://github.com/user-attachments/assets/9d502d5c-d819-4948-9f3b-b224d6e5424b" />

### 2) Enable Provisioning (SCIM + OAuth)🤝
- Okta app → **Provisioning** tab shows **Integration / To App / To Okta**.
- **Integration:** Authenticate with Salesforce OAuth (Consumer Key/Secret, admin creds).
- **To App:** Enable **Create**, **Update**, **Deactivate**.
- **Proof:** `screenshots/03-provisioning-tabs-visible.png`, `04-api-authenticated.png`, `05-to-app-settings.png`
<img width="1064" height="590" alt="03-provisioning-tabs-visible" src="https://github.com/user-attachments/assets/b5c78a52-9ac5-47d4-b8aa-9761eb9eb19f" />
<img width="755" height="589" alt="04-api-authenticated" src="https://github.com/user-attachments/assets/56a566ae-3454-433e-890f-8ade3cc62703" />
<img width="772" height="579" alt="05-to-app-settings" src="https://github.com/user-attachments/assets/289a70fd-214e-46c3-98c2-17199f382864" />

## 🔄Lifecycle Demonstration🔄

### Joiner (Create)
- In Okta: Directory → People → Add Person (e.g., `jane.doe@bytekagelab.local`).
- Assign **Salesforce.com** app with **Profile = Standard User**.
- **Result:** User appears Active in Salesforce.
- **Proof:** `screenshots/06-joiner-assignment.png`, `07-salesforce-user-created.png`
<img width="906" height="468" alt="06-joiner-assignment" src="https://github.com/user-attachments/assets/d49b035c-f21e-4f27-a0fe-c7b742b6dd8a" />
<img width="1293" height="431" alt="07-salesforce-usercreated" src="https://github.com/user-attachments/assets/fc5c5bdf-0f23-44f3-bd07-4ee248f5e5c8" />

### Mover (Update)
- In Okta: Edit user **Title = Manager**, **Department = IT** (example).
- **Result:** Salesforce user record updates automatically within ~1–2 minutes.
- **Proof:** `screenshots/08-mover-okta-update.png`, `09-mover-salesforce-updated.png`
<img width="903" height="354" alt="08-mover-okta-update" src="https://github.com/user-attachments/assets/3f5ff788-2efa-477d-8137-f5bf11b0eb6c" />
<img width="926" height="375" alt="09-mover-salesforce-pdated" src="https://github.com/user-attachments/assets/f1ac5642-c677-4306-a72d-3e0c18db2dd8" />

*(Optional)* Promote by changing Salesforce **Profile** from Okta app assignment (e.g., Standard User → System Administrator).  
**Proof:** Salesforce profile reflects new value.

### Leaver (Deactivate)
- In Okta: **More Actions → Deactivate User**.
- **Result:** Salesforce marks the user **Inactive**.
- **Proof:** `screenshots/10-leaver-okta-deactivate.png`, `11-leaver-salesforce-inactive.png`
<img width="1310" height="473" alt="10-leaver-okta-deactivated" src="https://github.com/user-attachments/assets/fe628cc1-4629-44ab-b778-eadaf6904dbe" />
<img width="899" height="115" alt="11-leaver-salesforce-inactive" src="https://github.com/user-attachments/assets/96abf08d-abf9-4551-bcd2-c4a85d337025" />
<img width="1312" height="641" alt="12-okta-auditlogs" src="https://github.com/user-attachments/assets/323be166-f570-4024-a623-6bed649044b3" />

### Important Resource for SAML/SSO Setup 
<img width="1246" height="282" alt="13-resource-for-sso-setup" src="https://github.com/user-attachments/assets/117edd0d-e143-41a2-ae43-6b89737dfc9b" />

## Attribute Mapping (common fields)
| Okta Profile | Salesforce Field |
|---|---|
| `userName` / `email` | **Username** / **Email** |
| `givenName` | **First Name** |
| `familyName` | **Last Name** |
| `title` | **Title** |
| `department` | **Department** |
| (Assignment) | **Profile** (e.g., Standard User) |

> If an attribute doesn't update in Salesforce, check **Okta App → Provisioning → Mappings → Refresh App Schema**, then ensure the field is mapped **Okta → Salesforce** and set to **Apply on update**.

## Troubleshooting Notes✅
- **“Could not verify admin credentials”**  
  - Verify Environment URL (`login.salesforce.com` vs `test.salesforce.com`)  
  - Use **password + security token** concatenated (no spaces)  
  - Ensure OAuth scopes include `api`, `refresh_token`  
- **Provisioning tab missing**  
  - Install the **Salesforce.com** app with provisioning (SCIM) capability, not SSO-only.  
  - In new Okta UI, enable provisioning under **General → App Settings** if hidden.
- **Updates delayed**  
  - Check **Provisioning → Tasks** and **System Log** in Okta.  
  - Expect 30–120s for pushes.

## 🔒Security Considerations🔒
- Use a **dedicated integration user** in Salesforce (least privilege + API Enabled).  
- Protect the **Consumer Secret**; rotate periodically.  
- Enforce MFA for admins; allow OAuth flow for the integration user as permitted.


## 🧠Lessons Learned🧠
- SSO and Provisioning are **separate planes**: SAML proves who you are; SCIM controls what you can access.  
- The **Okta app variant matters** (SSO-only vs Provisioning). In the new UI, provisioning may appear only after SSO is configured.  
- Attribute mapping is the glue—refresh schema and explicitly map fields you care about (Title, Department).  
- Deactivation from Okta is the fastest, most reliable way to revoke Salesforce access on exit.

## Outcome
- ✅ Seamless Okta → Salesforce SSO  
- ✅ Automated user lifecycle (Create / Update / Deactivate)  
- ✅ Audit trail via Okta System Log
