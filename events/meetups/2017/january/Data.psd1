@{
    AllNodes = @(
         # All nodes
        @{
            NodeName                  = '*'
            DomainName                = 'matrix.local'

            # Networking
            Lability_SwitchName       = 'Matrix','RealWorld'
            DefaultGateway            = '10.0.0.254'
            PrefixLength              = 24
            AddressFamily             = 'IPv4'
            DnsServerAddress          = '10.0.0.1'
            DnsConnectionSuffix       = 'matrix.local'

            # DSC related
            PSDscAllowPlainTextPassword = $true
            # Remove 'It is not recommended to use domain credential for node X' messages
            PSDscAllowDomainUser      = $true 

        }

        # DC01
        @{
            # Basic details
            NodeName                  = 'DC01'
            Lability_ProcessorCount   = 2
            Role                      = 'DC'
            Lability_Media            = '2016_x64_Standard_Core_EN_Eval'

            # Networking
            IPAddress                 = '10.0.0.1'
            DnsServerAddress          = '127.0.0.1'

            # Lability extras
            Lability_CustomBootstrap  = @'

'@
        }

        # WEB01
        @{
            # Basic details
            NodeName                  = 'WEB01'
            Role                      = 'Client'
            Nginx                     = 'Running'
            Media                     = '2016_x64_Standard_Core_EN_Eval'

            # Lability extras
            Lability_CustomBootStrap = @'
                net user Administrator /active:yes     ## Enable local administrator account
                Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force
                Enable-PSRemoting -SkipNetworkProfileCheck -Force
'@
        }

        # WEB02
        @{
            # Basic details
            NodeName                  = 'WEB02'
            Role                      = 'Client'
            Nginx                     = 'Stopped'
            Media                     = '2016_x64_Standard_Core_EN_Eval'

            # Lability extras
            Lability_CustomBootStrap = @'
                net user Administrator /active:yes     ## Enable local administrator account
                Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force
                Enable-PSRemoting -SkipNetworkProfileCheck -Force
'@
        }

        # WEB03
        @{
            # Basic details
            NodeName                  = 'WEB03'
            Role                      = 'Client'
            Media                     = '2016_x64_Standard_Core_EN_Eval'

            # Lability extras
            Lability_CustomBootStrap = @'
                net user Administrator /active:yes     ## Enable local administrator account
                Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force
                Enable-PSRemoting -SkipNetworkProfileCheck -Force
'@
        }

        # Client
        @{
            # Basic details
            NodeName                  = 'Client'
            Role                      = 'Client'
            Media                     = 'WIN10_x64_Enterprise_EN_Eval'

            # Lability extras
            Lability_CustomBootStrap = @'
                net user Administrator /active:yes     ## Enable local administrator account
                Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force
                Enable-PSRemoting -SkipNetworkProfileCheck -Force
'@
        }
    )
    
    NonNodeData = @{
        OrganisationName = 'Matrix'

        Lability = @{
            # Prefix all of our VMs with 'LAB-' in Hyper-V
            EnvironmentPrefix         = 'Matrix-'

            Network = @(
                @{
                    Name              = 'Matrix'
                    Type              = 'Internal'
                },
                @{
                    Name              = 'RealWorld'
                    Type              = 'External'
                    NetadapterName    = 'Wi-Fi'
                    AllowManagementOS = $true
                }
            )

            DSCResource = @(
                @{ Name = 'xComputerManagement'; MinimumVersion = '1.3.0.0'; Provider = 'PSGallery' }
                @{ Name = 'xNetworking'; MinimumVersion = '2.7.0.0' }
                @{ Name = 'xActiveDirectory'; MinimumVersion = '2.9.0.0' }
                @{ Name = 'xDnsServer'; MinimumVersion = '1.5.0.0' }
                @{ Name = 'xDhcpServer'; MinimumVersion = '1.3.0.0' }
                @{ Name = 'cChoco'; MinimumVersion = '2.3.0.0' }
            )

            Media = @()

        }
    }
}