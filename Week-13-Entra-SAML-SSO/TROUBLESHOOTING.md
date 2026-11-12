# 🧯 SSO & MFA Troubleshooting Playbook (Microsoft Entra ID)

A thought process first, then quick-reference tables. The goal is to always know the **next place to look**, even before knowing the answer.

---

## 1. The 5-Step Thought Process

| Step | Question to ask | Why it matters |
|---|---|---|
| **1. Scope it** | One user, one group, or everyone? One app or all apps? Did it ever work? When did it start? | One user points to that user's account, MFA, or assignment. Everyone points to configuration, a certificate, or an outage. |
| **2. Find which side broke** | Did it fail **before** Entra, **at** Entra, or **after** Entra? | Tells you which logs and which team own the problem. |
| **3. Read the evidence** | Sign-in logs (status, **AADSTS code**, Conditional Access tab, authentication details), audit logs, app-side logs | Evidence before guessing. |
| **4. Ask what changed** | Certificate rotated? New Conditional Access policy? User moved groups? Password reset? Vendor update? | Most outages trace back to a recent change. |
| **5. Fix, verify, document, prevent** | Smallest fix → test → write it down → add monitoring or an alert | Shows the operational maturity employers look for. |

### Finding which side broke

| Where it breaks | What you see | Where to look |
|---|---|---|
| **Before Entra** | App error, **no sign-in event** in Entra | App configuration, app logs, vendor |
| **At Entra** | Microsoft error page with an **AADSTS code**, failure in sign-in logs | Sign-in log → Basic info, Conditional Access, Authentication details |
| **After Entra** | Sign-in log says **Success**, but the app errors or says "user not found" | NameID or claims, certificate on the SP, the user's account inside the app |

### If you don't know the answer in an interview
> "I haven't seen that exact error, but here's how I'd approach it. First I'd scope it: one user or everyone. Then I'd check the sign-in logs for that user and app to see whether it failed before Entra, at Entra with an AADSTS code, or after Entra on the app side. Then I'd check what changed recently, like a certificate rotation, a new Conditional Access policy, or a group change. Once I fixed it, I'd document it and add monitoring so it doesn't happen again."

---

## 2. SAML SSO Failures

| Symptom | Likely cause | Fix |
|---|---|---|
| **AADSTS50011** reply URL mismatch | Reply (ACS) URL in Entra ≠ what the app sends | Make the Reply URL match exactly (check `http` vs `https` and trailing slashes) |
| **AADSTS700016** application not found | Identifier (Entity ID) mismatch, or the app is in the wrong tenant | Match the Identifier on both sides; confirm the tenant |
| **AADSTS50105** user not assigned | `Assignment required = Yes` and the user isn't assigned | Assign the user or their group (check that the membership is direct; nested groups don't count) |
| Sign-in **Success** in Entra, but the app says "user not found" | NameID value or format doesn't match how the app identifies users | Fix the NameID source attribute or format; check the user exists in the app (or use SCIM) |
| App says **signature invalid** for everyone, suddenly | Signing certificate rotated or expired; the SP still has the old one | Give the vendor the active certificate or metadata; plan rotations ahead |
| Assertion rejected as **expired / not yet valid** | Clock skew between IdP and SP | Check the SP server's time sync |
| Works from My Apps but not from the app's URL (or the reverse) | IdP- vs SP-initiated difference: Sign-on URL or relay state settings | Check the Sign-on URL; test both paths |
| Certificate download grayed out in Entra | The app certificate isn't generated until Basic SAML Configuration is saved | Save the basic configuration first |

## 3. OIDC / App Registration Failures

| Symptom | Likely cause | Fix |
|---|---|---|
| **AADSTS65001** consent required | The permission hasn't been consented to | Grant admin consent, or use the admin consent workflow |
| **AADSTS7000215** invalid client secret | Wrong secret value (often the secret **ID** was copied instead of the **value**) | Create a new secret and copy the value |
| **AADSTS7000222** client secret expired | The secret hit its expiry date | Rotate it; track expirations with a Graph report; prefer certificates or managed identities |
| Redirect URI error | Redirect URI not registered on the app registration | Add the exact URI under Authentication |

## 4. Sign-In & MFA Failures

| Code / symptom | Meaning | First move |
|---|---|---|
| **AADSTS50126** | Invalid username or password | Confirm the UPN; reset the password if needed; for hybrid users, check that sync is current |
| **AADSTS50053** | Account locked (Smart Lockout) or sign-in blocked | Check for password spray in the sign-in logs before unlocking |
| **AADSTS50057** | Account disabled | Is this a leaver? Confirm with HR before re-enabling |
| **AADSTS50034** | User doesn't exist in the directory | Typo, wrong tenant, or not synced from AD (check the sync scope) |
| **AADSTS50055** | Password expired | Reset the password, or have the user use SSPR |
| **AADSTS50076 / 50074** | MFA required | Normal if the user completes MFA; if they can't, check their registered methods |
| **AADSTS50079** | User must register for MFA | Walk them through registration (Authenticator) |
| **AADSTS500121** | MFA failed: denied, timed out, or wrong number | If the user didn't start it, treat it as a possible **MFA fatigue attack** and reset the password |
| **AADSTS53003** | Blocked by Conditional Access | Sign-in log → **Conditional Access tab** shows which policy and why |
| **AADSTS53000** | Device not in the required state (compliant or joined) | Check device compliance in Intune |

### MFA scenarios to talk through
- **"I'm not being prompted for MFA."** Check whether security defaults, per-user MFA, or Conditional Access is the enforcement method. Look at the Conditional Access tab in the sign-in log (Not Applied? excluded group? trusted location?).
- **"I'm prompted too often."** Check sign-in frequency and session controls, and browser cookies or private windows.
- **"I lost my phone."** Verify identity through an approved process, issue a **Temporary Access Pass**, re-register, and remove the old device's methods.
- **"I got MFA prompts I didn't start."** The attacker likely has the password. Deny the prompts, reset the password, revoke sessions, check the sign-in logs for the source IP, and move toward **number matching** and **phishing-resistant MFA** (FIDO2, Windows Hello for Business).

---

## 5. Logs Cheat Sheet

| Log | Answers | Location |
|---|---|---|
| **Sign-in logs** | Who signed in to what, from where, success or failure, AADSTS code, MFA, Conditional Access result | Entra ID → Monitoring → Sign-in logs (or the app's Activity → Sign-in logs) |
| **Audit logs** | Who **changed** what: app settings, certificates, assignments, roles | Entra ID → Monitoring → Audit logs |
| **Provisioning logs** | SCIM create, update, and disable results | Enterprise app → Provisioning logs |
| **App-side logs** | What the SP did with the assertion | Vendor admin console |

Free-tier sign-in logs are kept for a short window (about 7 days). Export to a SIEM such as Sentinel or Splunk for retention and correlation.

---

© ByteKage – IAM Labs Series
