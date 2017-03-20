# Investigating Vester
# Brian Bunke @ St. Louis PSUG, 2017/03/16
# https://youtu.be/_rcSq9eRu5U

# Get started with Vester
# http://www.brianbunke.com/blog/2017/03/07/introducing-vester/

# Your vCenter server
$vCenter = 'your.vcenter.com'

Install-Module Vester
Import-Module Vester
# Module requirements "Pester" & "VMware.VimAutomation.Core" automatically load into the session

# Do you care about Distributed Switches?
# PowerCLI doesn't do implicit module loading yet, so manually import any other needed modules
Import-Module VMware.VimAutomation.Vds

Connect-VIServer $vCenter

# Help is available:
Get-Help about_Vester
Get-Help New-VesterConfig
Get-Help Invoke-Vester

New-VesterConfig
# Upon completion, Config.json now exists in the module's \Config folder

# By default, run all included *.Vester.ps1 tests using the newly created config
Invoke-Vester

# If you'd like to to investigate any failed tests, and what they mean,
# you can open them up in an editor for more information

### You've been warned: This is where you start modifying your environment!
# Would you like to execute all of those changes?
Invoke-Vester -Remediate -WhatIf
Invoke-Vester -Remediate
Invoke-Vester
