$disallowedPrograms = @("notepad.exe", "mspaint.exe")

# Registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer\DisallowRun"

# Create the registry keys if they don't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Create the registry values for each disallowed program
foreach ($index in 1..$disallowedPrograms.Count) {
    $valueName = $index.ToString()
    $programName = $disallowedPrograms[$index - 1]
    $valueData = $programName

    New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType String -Force
}
