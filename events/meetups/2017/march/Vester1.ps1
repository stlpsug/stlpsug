# Investigating Vester
# Brian Bunke @ St. Louis PSUG, 2017/03/16
# https://youtu.be/_rcSq9eRu5U

# A quick intro to infrastructure validation in Pester

Describe 'This is a group of tests' {
    It '1 is less than 5' {
        1 | Should BeLessThan 5
    }

    It '1-5 are less than five' {
        1..5 | Should BeLessThan 5
    }

    # Pester is a native tool, so we can leverage ForEach
    1..5 | ForEach-Object {
        It "$_ < 5 ForEach" {
            $_ | Should BeLessThan 5
        }
    }
} #describe

# Ok, let's get a little more real world
Describe 'Demo files should exist' {
    It "Vester0.ps1 didn't disappear" {
        '.\Vester0.ps1' | Should Exist
    }
}

# Implementing a basic "idempotent" test (provides the same outcome each time)
# Again, Pester is native, so let's use a Try/Catch block
Describe "If a file doesn't exist, make it" {
    It 'Ensure Vester0.ps1 is present' {
        Try {
            '.\Vester0.ps1' | Should Exist
        } Catch {
            Write-Host 'This is the catch block' -ForegroundColor Yellow
            New-Item -Name Vester0.ps1 -ItemType File
        }
    }
}

# Wait...isn't that how DSC works?
