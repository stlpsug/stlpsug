properties {
  $Version = $null
}

Task Lint -Description 'Check scripts for style' {
  Write-Host "Run PS Script Analyzer"
}

Task Test -Description 'Run unit tests' { 
  Write-Host "Run Pester"
}

Task Package -Description 'Package the module' { 
  Write-Host "Package the module"
  Write-Host "Package version $Version"
}

Task Deploy -Description 'Deploy to the Gallery' -Depends Package { 
  Write-Host "Deploy the package"
}

Task Default -Depends Lint,Test
