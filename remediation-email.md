**Subject:** Vulnerability Remediation Scripts for Testing and Deployment

**Hi [Team],**

Based on our initial vulnerability scan and assessment, we have created a set of scripts to help you tackle the initial remediation efforts. These scripts target key vulnerabilities and can be easily integrated into your deployment platform (e.g., SCCM). Please test them before deploying to production.

### Vulnerabilities and Remediations:
1. [**Third-Party Software Removal (Wireshark)**](https://github.com/massandr/Vulnerabily-management-program/blob/main/remediation-wireshark-uninstall.ps1)
2. [**Windows OS Secure Configuration (Insecure Protocols)**](https://github.com/massandr/Vulnerabily-management-program/blob/main/toggle-protocols.ps1)
3. [**Windows OS Secure Configuration (Insecure Ciphersuites)**](https://github.com/massandr/Vulnerabily-management-program/blob/main/toggle-cipher-suites.ps1)
4. [**Windows OS Secure Configuration (Guest Account Group Membership)**](https://github.com/massandr/Vulnerabily-management-program/blob/main/toggle-guest-local-administrators.ps1)
5. [**Windows OS Secure Configuration (WinVerifyTrust Signature Validation CVE-2013-3900 Mitigation)**](https://github.com/massandr/Vulnerabily-management-program/blob/main/remediation-cve2013-3900.ps1)

Let me know if you have any questions or need any adjustments!

Best regards,

**[AM], Security Analyst**<br/>
**Governance, Risk, and Compliance**
