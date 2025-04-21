# Vulnerability Management Program Implementation

In this project, we simulate the implementation of a comprehensive vulnerability management program, from inception to completion.

_**Inception State:**_ the organization has no existing policy or vulnerability management practices in place.

_**Completion State:**_ a formal policy is enacted, stakeholder buy-in is secured, and a full cycle of organization-wide vulnerability remediation is successfully completed.

---

<img width="1000" alt="image" src="https://github.com/user-attachments/assets/cfc5dbcf-3fcb-4a71-9c13-2a49f8bab3e6">

# Technology Utilized
- Tenable (enterprise vulnerability management platform)
- Azure Virtual Machines (Nessus scan engine + scan targets)
- PowerShell & BASH (remediation scripts)

---


# Table of Contents

- [Vulnerability Management Policy Draft Creation](#step-1-vulnerability-management-policy-draft-creation)
- [Mock Meeting: Policy Buy-In (Stakeholders)](#step-2-mock-meeting-policy-buy-in-stakeholders)
- [Policy Finalization and Senior Leadership Sign-Off](#step-3-policy-finalization-and-senior-leadership-sign-off)
- [Mock Meeting: Initial Scan Permission (Server Team)](#step-4-mock-meeting-initial-scan-permission-server-team)
- [Initial Scan of Server Team Assets](#step-5-initial-scan-of-server-team-assets)
- [Vulnerability Assessment and Prioritization](#step-6-vulnerability-assessment-and-prioritization)
- [Distributing Remediations to Remediation Teams](#step-7-distributing-remediations-to-remediation-teams)
- [Mock Meeting: Post-Initial Discovery Scan (Server Team)](#step-8-mock-meeting-post-initial-discovery-scan-server-team)
- [Mock CAB Meeting: Implementing Remediations](#step-9-mock-cab-meeting-implementing-remediations)
- [Remediation Round 1: Outdated Wireshark Removal](#remediation-round-1-outdated-wireshark-removal)
- [Remediation Round 2: Insecure Protocols & Ciphers](#remediation-round-2-insecure-protocols--ciphers)
- [Remediation Round 3: Guest Account Group Membership](#remediation-round-3-guest-account-group-membership)
- [Remediation Round 4: Windows OS Updates](#remediation-round-4-windows-os-updates)
- [First Cycle Remediation Effort Summary](#first-cycle-remediation-effort-summary)

---

### Step 1) Vulnerability Management Policy Draft Creation

This phase focuses on drafting a Vulnerability Management Policy as a starting point for stakeholder engagement. The initial draft outlines scope, responsibilities, and remediation timelines, and may be adjusted based on feedback from relevant departments to ensure practical implementation before final approval by upper management.  

[Draft Policy](https://docs.google.com/document/d/1lbgCsKVRODyvieJ-ueD4kSV9zX_69Eh59Cbgjr83vy0/edit?usp=sharing)

---

### Step 2) Mock Meeting: Policy Buy-In (Stakeholders)

In this phase, a meeting with the server team introduces the draft Vulnerability Management Policy and assesses their capability to meet remediation timelines. Feedback leads to adjustments, like extending the critical remediation window from 48 hours to one week, ensuring collaborative implementation.

<details>
  <summary>💬 Policy Discussion Transcript - Dialogue between Cyber Analyst and Server Team Manager (click to expand)</summary>
<br>

🟢 **[JOSH_CA]**: Hey, morning Jimmy! How's everything been recently? I know everyone's been busy these last few weeks.

🔵 **[JIMMY_ST]**: Good morning, Josh. Yeah, it's been a bit hectic, but we're hanging in there. Thanks for asking.

🔵 **[JIMMY_ST]**: I had a chance to read through the policy draft. Overall, it makes sense. However, with our current staffing, we can't meet the aggressive remediation timelines — especially that 48-hour window for critical vulnerabilities.

🟢 **[JOSH_CA]**: Yeah, I totally understand. It is a bit aggressive, especially to start. Perhaps we can extend the critical window to one week? Might be a good compromise for now — and then we can reserve the 48-hour window for truly severe zero-day vulnerabilities.

🔵 **[JIMMY_ST]**: That sounds reasonable. We appreciate the flexibility. Can we also have a bit of leeway in the beginning, as we work through getting used to the remediation and patching process — just for the first few months?

🟢 **[JOSH_CA]**: Absolutely. After the policy is finalized, we’ll officially start the program. But we’re planning to give all departments about six months to adjust and get comfortable with the new process. Does that sound fair?

🔵 **[JIMMY_ST]**: Thanks, Josh. We’ll do our best. I appreciate you including us in the decision-making process — it really helps to feel like we're part of the solution.

🟢 **[JOSH_CA]**: Yeah, of course. We're all in this together. Thanks for working with us.

🔵 **[JIMMY_ST]**: No problem. Thanks for the short meeting.

🟢 **[JOSH_CA]**: Yeah, those are my favorite kind. Bye now.

🔵 **[JIMMY_ST]**: See you later.

</details>


---

### Step 3) Policy Finalization and Senior Leadership Sign-Off

After gathering feedback from the server team, the policy is revised, addressing aggressive remediation timelines. With final approval from upper management, the policy now guides the program, ensuring compliance and reference for pushback resolution.  

[Finalized Policy](https://docs.google.com/document/d/1H2EYSe7exDnsTOqPK43kdtalUBCY6uMND-IU4m-B0Ow/edit?usp=sharing)

<div style="text-align: center;">
    <img src="https://github.com/user-attachments/assets/6d608ff5-09b9-4b67-abea-330310a77e71" alt="image" width="400">
</div>

---

### Step 4) Mock Meeting: Initial Scan Permission (Server Team)

The cybersecurity team collaborates with the server team to initiate scheduled credential scans. A compromise is reached to scan a single server first, monitoring resource impact, and using just-in-time Active Directory credentials for secure, controlled access.  

<details>
  <summary>💬 Vulnerability Scanning Discussion - Dialogue between Cyber Analyst and Server Team Manager (click to expand)</summary>

<br>

🟢 **[JOSH_CA]**: Morning, Jimmy.

🔵 **[JIMMY_ST]**: Good morning. I heard you're ready to conduct some scans?

🟢 **[JOSH_CA]**: Yep! Now that our vulnerability management policy is in place, I wanted to get started on scheduled credential scans of your environment.

🔵 **[JIMMY_ST]**: Sounds good to me. What's involved? How can we help?

🟢 **[JOSH_CA]**: We're planning to schedule weekly scans of the server infrastructure. We estimate it’ll take about 4 to 6 hours to scan all 200 assets.  
We’ll need some administrative credentials that allow the scan engine to remotely log into the targets to better assess them.

🔵 **[JIMMY_ST]**: Whoa whoa, hold on there.  
What does scanning actually entail? I’m a bit worried about resource utilization.  
Also, you want admin credentials to all 200 machines? That doesn’t sound safe.

🟢 **[JOSH_CA]**: Yeah, those are valid concerns.  
The scan engine sends various traffic to the servers to check for vulnerabilities.  
That includes looking into the registry, detecting outdated software, or spotting insecure protocols or cipher suites — stuff like that.  
That’s why credentials are required.

🔵 **[JIMMY_ST]**: I see. Well, as long as it doesn’t bring the servers offline, I guess we should be okay.

🟢 **[JOSH_CA]**: Absolutely. Let’s just scan a single server first and monitor the resource usage.

🔵 **[JIMMY_ST]**: Not a bad idea.

🟢 **[JOSH_CA]**: Great. Also, for the credentials — could you set up something in Active Directory for us?  
Like AD credentials we can keep disabled until scanning time, then enable during the scan, and disable or deprovision after?  
Kind of a just-in-time access approach.

🔵 **[JIMMY_ST]**: That sounds good. I’ll ask Susan to get started on the automation for the account provisioning.

🟢 **[JOSH_CA]**: Awesome. Okay, talk soon.

🔵 **[JIMMY_ST]**: Yeah, that sounds good. I’ll get back to you once the credentials are set up.

🟢 **[JOSH_CA]**: See you later.

🔵 **[JIMMY_ST]**: See you later.

</details>


---

### Step 5) Initial Scan of Server Team Assets

In this phase, an insecure Windows Server is provisioned to simulate the server team's environment. After creating vulnerabilities, an authenticated scan is performed, and the results are exported for future remediation steps.  

<img width="635" alt="image" src="https://github.com/user-attachments/assets/973d562c-7a14-4eac-b811-bb3a1c9ba5ee" style="border: 2px solid black;">


[Scan 1 - Initial Scan](https://drive.google.com/file/d/1L7gsmb0cz3phX-QUldgOvc3_w_Ico4WM/view?usp=sharing)

---

### Step 6) Vulnerability Assessment and Prioritization

We assessed vulnerabilities and established a remediation prioritization strategy based on ease of remediation and impact. The following priorities were set:

1. Third Party Software Removal (Wireshark)
2. Windows OS Secure Configuration (Protocols & Ciphers)
3. Windows OS Secure Configuration (Guest Account Group Membership)
4. Windows OS Updates

---

### Step 7) Distributing Remediations to Remediation Teams

The server team received remediation scripts and scan reports to address key vulnerabilities. This streamlined their efforts and prepared them for a follow-up review.  

<img width="635" alt="image" src="https://github.com/user-attachments/assets/646ce2ad-8e59-41ff-b45c-2a19137dee88">

[Remediation Email](https://github.com/massandr/Vulnerabily-management-program/blob/main/remediation-email.md)

---

### Step 8) Mock Meeting: Post-Initial Discovery Scan (Server Team)

The server team reviewed vulnerability scan results, identifying outdated software, insecure accounts, and deprecated protocols. The remediation packages were prepared for submission to the Change Control Board (CAB). 

<details>
  <summary>💬 Vulnerability Scan Debrief - Dialogue between Cyber Analyst and Server Team Manager (click to expand)</summary>

<br>

🟢 **[JOSH_CA]**: Morning, Jimmy. How are you doing?

🔵 **[JIMMY_ST]**: Not bad for a Monday. And yourself?

🟢 **[JOSH_CA]**: I'm still alive, so I can’t complain.  
But before we get into the vulnerabilities — how did the actual scan go on your end?  
Any outages or overutilization?

🔵 **[JIMMY_ST]**: The scan went well. We were monitoring them, and aside from all the open connections, we wouldn’t have even known a scan was taking place.

🟢 **[JOSH_CA]**: Yeah, that’s good news. I kind of expected that.  
We’ll keep monitoring going forward, but I don’t expect any resource issues.  
Do you mind if I dive into the vulnerability findings?

🔵 **[JIMMY_ST]**: Yeah, absolutely.

🟢 **[JOSH_CA]**: Cool. I’m going to share my screen real quick.  
So basically, the majority of these vulnerabilities are coming from **Wireshark** being installed — and it’s super out of date.  
You can see a bunch of those here.

🟢 **[JOSH_CA]**: One interesting thing I found — the local **Guest** account on the servers actually belongs to a group,  
and that group is the **local administrators** group. Not sure why that is.  
Also, some findings like the **Microsoft Edge (Chromium)** one might get resolved by Windows Updates.

🟢 **[JOSH_CA]**: We can probably ignore the **self-signed certificate** issue — it's just the computer’s default cert.  
But these **medium-strength cipher suites** and the **TLS 1.0 / 1.1** protocols — they’re deprecated.  
We should definitely take time to remediate those.

🟢 **[JOSH_CA]**: So overall, we're looking at:  
- Removing outdated Wireshark  
- Fixing deprecated protocols and cipher suites  
- Disabling or removing the Guest account from the admin group

🔵 **[JIMMY_ST]**: Very interesting.  
The good news is — I suspect most of our servers will have the same vulnerabilities.  
Hopefully that makes remediation easier.

🟢 **[JOSH_CA]**: Yeah, that’s actually great — kind of like a uniform loadout.  
Do you foresee any issues remediating anything specific, like the cipher suites or the insecure protocols?

🔵 **[JIMMY_ST]**: I highly doubt it.  
We’ll run it through the next Change Control Board.  
Uninstalling Wireshark and fixing the Guest account shouldn’t be a problem — they’re not supposed to be on servers anyway.  
I’ll check with our CIS admins just to be sure.

🟢 **[JOSH_CA]**: That’s good news.  
I’ll go ahead and build some remediation packages to make your life easier when it’s time to fix them.

🔵 **[JIMMY_ST]**: Yeah, that sounds great.  
Oh — do you have anything in place to fix the Windows Update-related vulnerabilities? Like patch management?

🟢 **[JOSH_CA]**: Oh yes, not worried about that.  
Windows Updates should be handled automatically by next week — we have patch management in place.

🔵 **[JIMMY_ST]**: Okay, excellent.

🟢 **[JOSH_CA]**: All right — I’ll get started on researching the best way to remediate these findings.  
I’ll get back to you before the next Change Control Board.

🔵 **[JIMMY_ST]**: Sounds good. Talk to you soon.

🟢 **[JOSH_CA]**: Cool cool. Talk to you soon.

</details>


---

### Step 9) Mock CAB Meeting: Implementing Remediations

The Change Control Board (CAB) reviewed and approved the plan to remove insecure protocols and cipher suites. The plan included a rollback script and a tiered deployment approach.  

<details>
  <summary><a href="#">💬 CAP Meeting Recap - Multi-Team Dialogue on Remediation Strategy (click to expand)</a></summary>

<br>

🟡 **[JOHNNY_CAB]**: Okay, next up on the list are a couple of vulnerability remediations for the server team.  
Number one: removal of insecure protocols.  
Number two: removal of insecure cipher suites.  
Looks like Josh from Risk is working in conjunction with Jimmy from Infrastructure.  

🟡 **[JOHNNY_CAB]**: Jimmy, do you want to walk us through the technical aspects of the change being implemented?

🔵 **[JIMMY_ST]**: Normally I would, but do you mind giving this one to Josh?  
He actually built the solution for us — we’re still getting used to the process.

🟢 **[JOSH_CA]**: Uh, yeah — I can explain these.  
Basically, insecure cipher suites and protocols mean the system is capable of negotiating deprecated algorithms.  
If it connects to another server that only supports old protocols, it might end up using them.

🟢 **[JOSH_CA]**: These settings are managed through the Windows Registry.  
We wrote a PowerShell script that disables the insecure stuff and enables the secure, modern protocols and ciphers.  
It’s a really straightforward fix.

🔴 **[JACK_SYSENG]**: Yeah, that sounds good — but what if something goes wrong?  
Do we have a rollback plan in place? Did you even think about that?

🟢 **[JOSH_CA]**: Yes, absolutely.  
We’re using a **tiered deployment model**: pilot group, pre-prod, then production.  
And every remediation script has a built-in automated rollback function.

🟢 **[JOSH_CA]**: So if anything breaks, the script will revert the registry changes and restore the original state.

🔴 **[JACK_SYSENG]**: That sounds good.  
If it’s just registry updates, I’m not too concerned. Seems clean.

🟢 **[JOSH_CA]**: Yep, exactly. Super controlled.
Any other questions?

🟡 **[JOHNNY_CAB]**: Okay, that wraps things up for this week’s CAP meeting.  
Thanks everyone — see you all next week.

</details>

---
### Step 10 ) Remediation Effort

#### Remediation Round 1: Outdated Wireshark Removal

The server team used a PowerShell script to remove outdated Wireshark. A follow-up scan confirmed successful remediation.  
[Wireshark Removal Script](https://github.com/joshmadakor1/lognpacific-public/blob/main/automation/remediation-wireshark-uninstall.ps1)  

<img width="634" alt="image" src="https://github.com/user-attachments/assets/7b4f9ab2-d230-4458-ac0f-c0ff070ae79a">

[Scan 2 - Third Party Software Removal](https://drive.google.com/file/d/1UiwPPTtuSZKk02hiMyXf31pXUIeC5EWt/view?usp=drive_link)


#### Remediation Round 2: Insecure Protocols & Ciphers

The server team used PowerShell scripts to remediate insecure protocols and cipher suites. A follow-up scan verified successful remediation, and the results were saved for reference.  
[PowerShell: Insecure Protocols Remediation](https://github.com/joshmadakor1/lognpacific-public/blob/main/automation/toggle-protocols.ps1)
[PowerShell: Insecure Ciphers Remediation](https://github.com/joshmadakor1/lognpacific-public/blob/main/automation/toggle-cipher-suites.ps1)

<img width="630" alt="image" src="https://github.com/user-attachments/assets/0e96120d-8ec9-4f76-8e42-79c752200010">

[Scan 3 - Ciphersuites and Protocols](https://drive.google.com/file/d/1Qc6-ezQvwReCGUZNtnva0kCZo_-zW-Sm/view?usp=drive_link)


#### Remediation Round 3: Guest Account Group Membership

The server team removed the guest account from the administrator group. A new scan confirmed remediation, and the results were exported for comparison.  
[PowerShell: Guest Account Group Membership Remediation](https://github.com/joshmadakor1/lognpacific-public/blob/main/automation/toggle-guest-local-administrators.ps1)  

<img width="627" alt="image" src="https://github.com/user-attachments/assets/870a3eac-3398-44fe-91c0-96f3c2578df4">

[Scan 4 - Guest Account Group Removal](https://drive.google.com/file/d/1jVgikjfrV1YjOcL3QRT_oUB0Y82w22V7/view?usp=drive_link)


#### Remediation Round 4: Windows OS Updates

Windows updates were re-enabled and applied until the system was fully up to date. A final scan verified the changes  

<img width="627" alt="image" src="https://github.com/user-attachments/assets/870a3eac-3398-44fe-91c0-96f3c2578df4">

[Scan 5 - Post Windows Updates](https://drive.google.com/file/d/1tmDjeHl5uiGitRwWy8kFRi33q-nGi1Zt/view?usp=drive_link)

---

### First Cycle Remediation Effort Summary

The remediation process reduced total vulnerabilities by 80%, from 30 to 6. Critical vulnerabilities were resolved by the second scan (100%), and high vulnerabilities dropped by 90%. Mediums were reduced by 76%. In an actual production environment, asset criticality would further guide future remediation efforts.  

<img width="1920" alt="image" src="https://github.com/user-attachments/assets/51f0aae8-7f36-4d90-b29f-5257e57155f9">

[Remediation Data](https://docs.google.com/spreadsheets/d/1FTtFfZYmFsNLU6pm8nTzsKyKE-d2ftXzX_DPwcnFNfA/edit?gid=0#gid=0)

---

### On-going Vulnerability Management (Maintenance Mode)

After completing the initial remediation cycle, the vulnerability management program transitions into **Maintenance Mode**. This phase ensures that vulnerabilities continue to be managed proactively, keeping systems secure over time. Regular scans, continuous monitoring, and timely remediation are crucial components of this phase. (See [Finalized Policy](https://docs.google.com/document/d/1rvueLX_71pOR8ldN9zVW9r_zLzDQxVsnSUtNar8ftdg/edit?usp=drive_link) for scanning and remediation cadence requirements.)

Key activities in Maintenance Mode include:
- **Scheduled Vulnerability Scans**: Perform regular scans (e.g., weekly or monthly) to detect new vulnerabilities as systems evolve.
- **Patch Management**: Continuously apply security patches and updates, ensuring no critical vulnerabilities remain unpatched.
- **Remediation Follow-ups**: Address newly identified vulnerabilities promptly, prioritizing based on risk and impact.
- **Policy Review and Updates**: Periodically review the Vulnerability Management Policy to ensure it aligns with the latest security best practices and organizational needs.
- **Audit and Compliance**: Conduct internal audits to ensure compliance with the vulnerability management policy and external regulations.
- **Ongoing Communication with Stakeholders**: Maintain open communication with teams responsible for remediation, ensuring efficient coordination.

By maintaining an active vulnerability management process, organizations can stay ahead of emerging threats and ensure long-term security resilience.
