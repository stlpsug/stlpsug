# Investigating Vester
# Brian Bunke @ St. Louis PSUG, 2017/03/16
# https://youtu.be/_rcSq9eRu5U

# Narrowing your options
# http://www.brianbunke.com/blog/2017/03/08/vester-2-vest-harder/

# Reduce the scope within your vCenter environment
# When you see the datacenter/cluster/etc. * values, 'y' to change those defaults
New-VesterConfig -OutputFolder .\OneHost
# e.g. a brownfield deploy with multiple clusters

# Multiple config files are useful in a few different scenarios:
#   You maintain multiple vCenter servers
#     Vester is currently designed for configs/vCenters to be 1:1
#   Dev vs. Prod environments in the same vCenter
#   You just have a group of VMs that are more or less important
Invoke-Vester -Config .\OneHost\Config.json

# Narrowing the test suite
$Vests   = "$((Get-Module Vester -ListAvailable).ModuleBase)\Tests"
$Cluster = gci "$Vests\Cluster"
$ESXi    = gci "$Vests\Host"
$VM      = gci "$Vests\VM"

# Manually editing a config
# You can open Config.json in a text editor and manually edit as needed
# 'null' will permanently skip a test
Invoke-Vester -Config .\OneHost\Config.json -Test $Cluster

# Advanced Pester options
$PassThru = Invoke-Vester -Test $Cluster -PassThru
$PassThru
$PassThru.TestResult
Invoke-Vester -Test $ESXi -XMLOutputFile .\results.xml

# Troubleshooting!
Invoke-Vester -Test $VM -Verbose
