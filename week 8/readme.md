# 🔐 SAML SSO Lab – Auth0 (IdP) → Microsoft Entra ID (SP)

This lab demonstrates how to configure **SAML 2.0 Single Sign-On** using:
- ✅ **Auth0** as the Identity Provider (IdP)
- ✅ **Microsoft Entra ID** as the Service Provider (SP)
- ✅ An **IdP-initiated login flow** that ends on a custom GitHub Pages landing page

---

## 🧪 Lab Objective

Simulate a real-world SAML SSO integration where:
- A user logs in using **Auth0**
- Auth0 issues a signed **SAML assertion**
- Microsoft Entra ID validates the assertion and authenticates the user
- The user is redirected to a **custom landing page** confirming successful SSO

---

## 🔄 Flow Overview

1. 🧍‍♂️ User initiates login at a SAML endpoint hosted by Auth0  
2. 🔐 Auth0 authenticates the user  
3. 📄 Auth0 sends a signed SAML token to Microsoft Entra ID  
4. ✅ Entra ID validates the assertion  
5. 🏁 User is redirected to a GitHub-hosted success page

---

## 🔧 Configuration Summary

| Component              | Value / Description                                 |
|------------------------|-----------------------------------------------------|
| **ACS URL (Reply URL)**     | `https://login.microsoftonline.com/{tenant_id}/saml2` |
| **Entity ID**               | `urn:auth0:{your-tenant}:{app-id}`              |
| **NameID Format**           | `urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress` |
| **X.509 Certificate**       | Exported from Auth0 and uploaded to Entra ID    |
| **Landing Page**            | [GitHub Pages](https://your-username.github.io/your-repo/) |

---

## 📸 Screenshots

### 1. Auth0 Login Screen  
*(User authenticates with Auth0 before assertion is sent)*  
![Auth0 Login](https://github.com/user-attachments/assets/fdeece26-5d70-47e4-9d1c-be6e4d05eb6f)

---

### 2. Entra Consumes Assertion  
*(SAML token sent to Entra for verification)* 
This is a Dummy Token btw. 🤫
![Dummy Token Verification](https://github.com/user-attachments/assets/02f5d5e4-b8e0-4e94-853a-87d5ad2cad4e)

---

### 3. Redirect to GitHub Success Page  
*(User lands here after successful SSO login)*  
After successful login, the SAML assertion was accepted by Microsoft Entra ID, and the user was redirected to the configured landing page hosted on GitHub Pages.

However, since GitHub Pages doesn’t allow viewing certain content when redirected from another domain (due to cross-origin restrictions and missing cookies), the actual page may not render directly on first load.
![Screenshot 2025-06-20 at 7 12 19 PM](https://github.com/user-attachments/assets/a61e3ea5-7e24-4667-8b87-6e0e912e729f)

---

## 🧠 What I Learned

- How to configure **SAML IdP-initiated SSO**
- How to connect **Auth0 and Entra ID** using SAML 2.0
- How to export/import **X.509 certificates** for secure trust
- How to redirect users to a **custom success page**
- How to explain, document, and demonstrate IAM concepts clearly

---

## 🚫 Live Login Disabled

> 🔒 This lab is for demo purposes only.  
> To protect resources, the live Auth0 login endpoint has been disabled for public access.

---

## 🏁 Next Lab Ideas

- Add SP-initiated SAML login support
- Compare with OIDC-based login via Auth0
- Explore JIT user provisioning into Entra ID
- Add MFA or conditional access to Entra as SP

---

© ByteKage – IAM Labs Series

