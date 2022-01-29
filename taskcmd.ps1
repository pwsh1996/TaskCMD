$global:crow = 10 # Used for tracking the current row
$global:graph = @(@("+","+","C","P","U","+","+","+","+","%","+","+"),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@("+","+","+","+","+","+","+","+","+","+","+","+"))
$cpuinfo = Get-CimInstance -ClassName Win32_Processor 
#Adding Unicode Characters
$a = @(
    " ",            #Empty
    [char]0x2582,   #1/4 block 0x(unicode hex value)
    [char]0x2584,   #1/2 block
    [char]0x2586    #3/4 block
)
$b = @(
    [char]0x255a,  #0 boarder bottom left
    [char]0x2554,  #1 boarder top left
    [char]0x2557,  #2 boarder top right
    [char]0x255d,  #3 boarder bottom right
    [char]0x2551,  #4 boarder vertical
    [char]0x2550   #5 boarder horizontal
)
$block = [string]([char]0x2588)

function updatedata { #Updates the rows

    for ($r = $global:crow;$r -lt 10;$r++){ #moves the rows one step down
        for ($i = 1; $i -le 10; $i++){
            $global:graph[$i][$r-1] = $global:graph[$i][$r]
        }
    }

    for ($i = 1; $i -le 10; $i++){ #Updates the 10th row
        if ($i -le $whole){
            $global:graph[($i - 11)*(-1)][9] = $block
        }
        elseif ($i -eq ($whole + 1)){
            $global:graph[($i - 11)*(-1)][9] = $a[$last]
        }
        else{
            $global:graph[($i - 11)*(-1)][9] = " "
        }
    }
  
    if  ($global:crow -gt 1){ #updates the current row until it gets to 1
        $global:crow--
    }
}

While ($true) {
        
    #Gets the inital data
    $CounterSamples = Get-Counter '\Process(*)\ID Process','\Process(*)\% Processor Time','\Processor(_total)\% Processor Time' | Select-Object -Expand CounterSamples
    
    $processinfo = Get-Process #gets the processes

    $hands = 0
        
    #Displays the Total CPU Utilization
    $global:cpu = [Math]::round(($countersamples | Where-Object {$_.path -match "processor\(_to"}).CookedValue)

    $whole = [Math]::Floor($global:cpu/10) #number of whole blocks
    $last = [math]::Floor((($global:cpu * 10) % 100) / 25) #the size of the small block

    updatedata #update the graph data

    foreach ($g in $processinfo){
        $hands += ($g.handles)
    }

    Clear-Host
    #Draws the Graph
    $CounterSamples | Group-Object { Split-Path $_.Path } | Where-Object {$_.Group[1].InstanceName -notmatch "^Idle|_Total|System$"} | Sort-Object -Property {$_.Group[1].CookedValue} -Descending | Select-Object -First 6 | Format-Table @{Name="ProcessId";Expression={$_.Group[0].CookedValue}},@{Name="ProcessorUsage";Expression={[System.Math]::Round($_.Group[1].CookedValue/1/$env:NUMBER_OF_PROCESSORS,2)}},@{Name="ProcessName";Expression={$_.Group[1].InstanceName}}
    #Lines 1-12
    Write-Host $b[1]$b[5] -NoNewline;Write-Host "" $global:graph[0][2,3,4] "" -ForegroundColor Blue -NoNewline; Write-Host $b[5] ""-NoNewline;     
    if (($global:cpu.tostring()).length -eq 2) {
        $global:graph[0][7] = ($global:cpu.tostring()).substring(0,1)
        $global:graph[0][8] = ($global:cpu.tostring()).substring(1,1)
        write-host $b[5] "" -NoNewline
        write-host $global:graph[0][7,8,9] "" -ForegroundColor blue -NoNewline
    }
    elseif (($global:cpu.tostring()).length -eq 1) {
        write-host $b[5]$b[5]"" -NoNewline
        write-host $global:cpu.tostring() "% " -ForegroundColor blue -NoNewline
    }
    elseif (($global:cpu.tostring()).length -eq 3) {
        $global:graph[0][6] = ($global:cpu.tostring()).substring(0,1)
        $global:graph[0][7] = ($global:cpu.tostring()).substring(1,1)
        $global:graph[0][8] = ($global:cpu.tostring()).substring(2,1)
        write-host $global:graph[0][6,7,8,9] ""-ForegroundColor blue -NoNewline
    }
    Write-Host $b[5]$b[2]"  " $cpuinfo.name
    Write-Host $b[4] -NoNewline; Write-Host "" $global:graph[1] "" -ForegroundColor Blue -NoNewline; Write-Host $b[4]
    Write-Host $b[4] -NoNewline; Write-Host "" $global:graph[2] "" -ForegroundColor Blue -NoNewline; Write-Host $b[4]"   Processes  Threads   Handles"
    Write-Host $b[4] -NoNewline; Write-Host "" $global:graph[3] "" -ForegroundColor Blue -NoNewline; Write-Host $b[4]"      " -NoNewline; Write-Host ($processinfo).count "     " ($processinfo.Threads).count "  " $hands -ForegroundColor Blue 
    Write-Host $b[4] -NoNewline; Write-Host "" $global:graph[4] "" -ForegroundColor Blue -NoNewline; Write-Host $b[4]
    Write-Host $b[4] -NoNewline; Write-Host "" $global:graph[5] "" -ForegroundColor Blue -NoNewline; Write-Host $b[4]
    Write-Host $b[4] -NoNewline; Write-Host "" $global:graph[6] "" -ForegroundColor Blue -NoNewline; Write-Host $b[4]
    Write-Host $b[4] -NoNewline; Write-Host "" $global:graph[7] "" -ForegroundColor Blue -NoNewline; Write-Host $b[4]
    Write-Host $b[4] -NoNewline; Write-Host "" $global:graph[8] "" -ForegroundColor Blue -NoNewline; Write-Host $b[4]
    Write-Host $b[4] -NoNewline; Write-Host "" $global:graph[9] "" -ForegroundColor Blue -NoNewline; Write-Host $b[4]
    Write-Host $b[4] -NoNewline; Write-Host "" $global:graph[10] "" -ForegroundColor Blue -NoNewline; Write-Host $b[4]
    Write-Host $b[0] $b[5] $b[5]$b[5]$b[5]$b[5]$b[5]$b[5]$b[5]$b[5]$b[5]$b[3]

    start-Sleep -Seconds 1 # How often it updates in seconds
}
