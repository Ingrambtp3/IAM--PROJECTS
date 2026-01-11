# Conditional Access & MFA Enforcement – Azure Entra ID

## 1. Problem🧐

Organizations that rely solely on username and password authentication are vulnerable to credential-based attacks such as phishing, password reuse, and brute force attempts. Without enforced multi-factor authentication (MFA) and conditional access controls, unauthorized access can occur even when credentials are valid.

## 2. Objective💡

The objective of this implementation was to strengthen identity security by enforcing MFA through Conditional Access policies in Azure Entra ID, ensuring users authenticate with additional verification factors and reducing the risk of account compromise.

## 3. Solution Overview✅

Azure Entra ID Conditional Access policies were configured to require MFA for targeted users during sign-in. Identity roles were reviewed and assigned to ensure appropriate access control, and authentication behavior was validated through sign-in logs to confirm policy enforcement.

## 4. Implementation Summary📋

- Configured Conditional Access policies in Azure Entra ID to require MFA
- Enforced MFA for user authentication during sign-in
- Reviewed and assigned IAM roles based on access requirements
- Validated authentication enforcement using Entra ID sign-in logs

## 5. Validation & Evidence🕵️‍♂️

Policy enforcement was validated by reviewing sign-in logs within Azure Entra ID. Successful authentication attempts confirmed MFA prompts were triggered as expected and Conditional Access policies were applied correctly.

Screenshots included in this repository demonstrate:
- Conditional Access policy configuration
- MFA enforcement settings
- User sign-in logs showing policy application
- Role assignments within Entra ID

## 6. Security Impact🔐

This implementation reduces the likelihood of unauthorized access by ensuring stolen or compromised credentials alone are insufficient for authentication. Enforcing MFA through Conditional Access strengthens the organization’s identity security posture, improves audit visibility, and aligns with zero trust security principles.

## Before vs After Risk Comparison💻

**Before:**
- Authentication relied primarily on single-factor credentials
- Increased risk of credential-based attacks
- Limited visibility into authentication enforcement

**After:**
- MFA enforced for targeted users via Conditional Access
- Reduced risk of account takeover
- Improved auditability through sign-in logs and policy enforcement
## 🔹 Screenshots & Configurations  
📸 **Screenshots:**  
![Screenshot 2025-03-29 at 1 26 51 PM](https://github.com/user-attachments/assets/deeb462a-9ac4-48ab-b4b1-927223e120fe)
![Screenshot 2025-03-29 at 1 28 39 PM](https://github.com/user-attachments/assets/5d3cd708-6f07-4775-a1eb-e1aa6acaec60)
![Screenshot 2025-03-29 at 1 33 24 PM](https://github.com/user-attachments/assets/e1d5feae-061f-42ee-97f3-6a48ec08f6bf)
![Screenshot 2025-03-29 at 1 38 06 PM](https://github.com/user-attachments/assets/72be1617-b3dc-461b-ab48-f8e3f60f2106)
![Screenshot 2025-03-29 at 1 50 54 PM](https://github.com/user-attachments/assets/62ea46b1-155c-465c-b424-05309cfccd00)
![Screenshot 2025-03-29 at 2 08 56 PM](https://github.com/user-attachments/assets/27c159f8-3405-4f73-a1b9-1255b065b4f3)
![Screenshot 2025-03-29 at 1 48 06 PM](https://github.com/user-attachments/assets/835e7bb7-1075-473f-b7b9-0b2f2fe6ff97)
![Screenshot 2025-03-29 at 2 15 58 PM](https://github.com/user-attachments/assets/1018a6e8-df97-4348-9c61-7ede5dfc7f56)
💻 
