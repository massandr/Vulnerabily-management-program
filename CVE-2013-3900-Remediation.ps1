<#
.SYNOPSIS
    CVE-2013-3900 Remediation Script - Enables the EnableCertPaddingCheck registry key to mitigate certificate parsing vulnerability.

.DESCRIPTION
    This script sets the 'EnableCertPaddingCheck' registry key to 1 under both 32-bit and 64-bit registry paths.
    It mitigates CVE-2013-3900 by enabling strict certificate padding checks as per Microsoft guidance.

.NOTES
    Author  : AM
    Date    : 2025-03-03
    Version : 1.0

.LINK
    https://msrc.microsoft.com/update-guide/en-US/vulnerability/CVE-2013-3900

#>

Write-Output "===== CVE-2013-3900 Remediation Script Started ====="

# Define registry paths for 32-bit and 64-bit
$registryPaths = @(
    'HKLM:\Software\Microsoft\Cryptography\Wintrust\Config',
    'HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config'
)

foreach ($path in $registryPaths) {
    try {
        # Create the registry path if it doesn't exist
        if (-not (Test-Path -Path $path)) {
            New-Item -Path $path -Force | Out-Null
            Write-Output "Created registry path: $path"
        }

        # Set EnableCertPaddingCheck to 1
        New-ItemProperty -Path $path -Name 'EnableCertPaddingCheck' -Value 1 -PropertyType 'DWORD' -Force | Out-Null
        Write-Output "Set 'EnableCertPaddingCheck' to 1 at: $path"
    }
    catch {
        Write-Warning "Failed to update registry at: $path. Error: $_"
    }
}

Write-Output "===== CVE-2013-3900 Remediation Completed Successfully ====="
