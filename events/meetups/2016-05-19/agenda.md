# STLPSUG: May 19, 2016

## Presentation: PowerShell Functions
Micah Battin, [PowerShell Functions]()

+ Functions
+ Parameters
+ Advanced Functions
    + Begin, Process, End
    + Parameter Attributes
    + Parameter Validation and Typing

## Links

+ [PowerShell Best Practices and Style Guide](https://github.com/PoshCode/PowerShellPracticeAndStyle)
+ Don Jones' [Learn PowerShell in a Month of Lunches](http://www.amazon.com/Learn-Windows-PowerShell-Month-Lunches/dp/1617291080/)
+ PowerShell [Streams](https://msdn.microsoft.com/en-us/library/system.management.automation.psdatastreams(v=vs.85).aspx) (where warnings, debug messages, errors, output, etc go)
+ [Manipulating PowerShell Object Types (Adding Property Aliases)](https://www.petri.com/using-powershell-get-service-cmdlet-with-the-computername-parameter)
```powershell
Update-TypeData -TypeName Microsoft.ActiveDirectory.Management.ADComputer -MemberType AliasProperty -MemberName Computername -Value Name -Force
```