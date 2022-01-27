$global:crow = 10 # Used for tracking the current row
$global:graph = @(@("+","+","C","P","U","+","+","+","+","%","+","+"),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@(" "," "," "," "," "," "," "," "," "," "),@("+","+","+","+","+","+","+","+","+","+","+","+"))
$cpuinfo = Get-CimInstance -ClassName Win32_Processor 

function updatedata { #Updates the rows
    for ($r = $global:crow;$r -lt 10;$r++){ #moves the rows one step down
        for ($i = 1; $i -le 10; $i++){
            $global:graph[$i][$r-1] = $global:graph[$i][$r]
        }
    }
        if ($global:cpu -ge 50){
            if($global:cpu -ge 70){
                if ($global:cpu -ge 80){ 
                    if ($global:cpu -ge 90){ # CPU 90-100%
                        $global:graph[1][9] = "P"
                        $global:graph[2][9] = "P"
                        $global:graph[3][9] = "P"
                        $global:graph[4][9] = "P"
                        $global:graph[5][9] = "P"
                        $global:graph[6][9] = "P"
                        $global:graph[7][9] = "P"
                        $global:graph[8][9] = "P"
                        $global:graph[9][9] = "P"
                        $global:graph[10][9] = "P"
                    }
                    else{ # CPU 80-89.9%
                        $global:graph[1][9] = " "
                        $global:graph[2][9] = " "
                        $global:graph[3][9] = "P"
                        $global:graph[4][9] = "P"
                        $global:graph[5][9] = "P"
                        $global:graph[6][9] = "P"
                        $global:graph[7][9] = "P"
                        $global:graph[8][9] = "P"
                        $global:graph[9][9] = "P"
                        $global:graph[10][9] = "P"
                    }
                }
                else{ # CPU 70-79.9%
                    $global:graph[1][9] = " "
                    $global:graph[2][9] = " "
                    $global:graph[3][9] = " "
                    $global:graph[4][9] = "P"
                    $global:graph[5][9] = "P"
                    $global:graph[6][9] = "P"
                    $global:graph[7][9] = "P"
                    $global:graph[8][9] = "P"
                    $global:graph[9][9] = "P"
                    $global:graph[10][9] = "P"
                }
            }
            else{ # CPU 60-69.9%
                if ($global:cpu -ge 60){
                    $global:graph[1][9] = " "
                    $global:graph[2][9] = " "
                    $global:graph[3][9] = " "
                    $global:graph[4][9] = " "
                    $global:graph[5][9] = "P"
                    $global:graph[6][9] = "P"
                    $global:graph[7][9] = "P"
                    $global:graph[8][9] = "P"
                    $global:graph[9][9] = "P"
                    $global:graph[10][9] = "P"
                }
                else{ # CPU 50-59.9%
                    $global:graph[1][9] = " "
                    $global:graph[2][9] = " "
                    $global:graph[3][9] = " "
                    $global:graph[4][9] = " "
                    $global:graph[5][9] = " "
                    $global:graph[6][9] = "P"
                    $global:graph[7][9] = "P"
                    $global:graph[8][9] = "P"
                    $global:graph[9][9] = "P"
                    $global:graph[10][9] = "P"
                }
            }
        }
        else{
            if ($global:cpu -ge 30){
                if ($global:cpu -ge 40){ # CPU 40-49.9%
                    $global:graph[1][9] = " "
                    $global:graph[2][9] = " "
                    $global:graph[3][9] = " "
                    $global:graph[4][9] = " "
                    $global:graph[5][9] = " "
                    $global:graph[6][9] = " "
                    $global:graph[7][9] = "P"
                    $global:graph[8][9] = "P"
                    $global:graph[9][9] = "P"
                    $global:graph[10][9] = "P"
                }
                else{ # CPU 30-39.9%
                    $global:graph[1][9] = " "
                    $global:graph[2][9] = " "
                    $global:graph[3][9] = " "
                    $global:graph[4][9] = " "
                    $global:graph[5][9] = " "
                    $global:graph[6][9] = " "
                    $global:graph[7][9] = " "
                    $global:graph[8][9] = "P"
                    $global:graph[9][9] = "P"
                    $global:graph[10][9] = "P"
                }
            }
            else{
                if($global:cpu -ge 20){ # CPU 20-24.9%
                    $global:graph[1][9] = " "
                    $global:graph[2][9] = " "
                    $global:graph[3][9] = " "
                    $global:graph[4][9] = " "
                    $global:graph[5][9] = " "
                    $global:graph[6][9] = " "
                    $global:graph[7][9] = " "
                    $global:graph[8][9] = " "
                    $global:graph[9][9] = "P"
                    $global:graph[10][9] = "P"
                }
                else{
                    if($global:cpu -ge 10){ # CPU 10-19.9%
                        $global:graph[1][9] = " "
                        $global:graph[2][9] = " "
                        $global:graph[3][9] = " "
                        $global:graph[4][9] = " "
                        $global:graph[5][9] = " "
                        $global:graph[6][9] = " "
                        $global:graph[7][9] = " "
                        $global:graph[8][9] = " "
                        $global:graph[9][9] = " "
                        $global:graph[10][9] = "P"
                    }
                    else{ # CPU 0-9.9%
                        $global:graph[1][9] = " "
                        $global:graph[2][9] = " "
                        $global:graph[3][9] = " "
                        $global:graph[4][9] = " "
                        $global:graph[5][9] = " "
                        $global:graph[6][9] = " "
                        $global:graph[7][9] = " "
                        $global:graph[8][9] = " "
                        $global:graph[9][9] = " "
                        $global:graph[10][9] = "."
                    }
                } 
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
        
    #Displays the Total CPU Utilization
    $global:cpu = [Math]::round(($countersamples | Where-Object {$_.path -match "processor\(_to"}).CookedValue)
    
    updatedata #update the graph data

    Clear-Host
    #Draws the Graph
    $CounterSamples | Group-Object { Split-Path $_.Path } | Where-Object {$_.Group[1].InstanceName -notmatch "^Idle|_Total|System$"} | Sort-Object -Property {$_.Group[1].CookedValue} -Descending | Select-Object -First 6 | Format-Table @{Name="ProcessId";Expression={$_.Group[0].CookedValue}},@{Name="ProcessorUsage";Expression={[System.Math]::Round($_.Group[1].CookedValue/1/$env:NUMBER_OF_PROCESSORS,2)}},@{Name="ProcessName";Expression={$_.Group[1].InstanceName}}
    #Lines 1-12
    Write-Host $global:graph[0][0,1] -NoNewline;Write-Host "" $global:graph[0][2,3,4] "" -ForegroundColor Blue -NoNewline; Write-Host $global:graph[0][5] ""-NoNewline;     
    if (($global:cpu.tostring()).length -eq 2) {
        $global:graph[0][7] = ($global:cpu.tostring()).substring(0,1)
        $global:graph[0][8] = ($global:cpu.tostring()).substring(1,1)
        write-host "+ " -NoNewline
        write-host $global:graph[0][7,8,9] "" -ForegroundColor blue -NoNewline
    }
    elseif (($global:cpu.tostring()).length -eq 1) {
        write-host "+ + " -NoNewline
        write-host $global:cpu.tostring() "% " -ForegroundColor blue -NoNewline
    }
    elseif (($global:cpu.tostring()).length -eq 3) {
        $global:graph[0][6] = ($global:cpu.tostring()).substring(0,1)
        $global:graph[0][7] = ($global:cpu.tostring()).substring(1,1)
        $global:graph[0][8] = ($global:cpu.tostring()).substring(2,1)
        write-host $global:graph[0][6,7,8,9] ""-ForegroundColor blue -NoNewline
    }
    Write-Host "+ +   " $cpuinfo.name
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[1] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[2] "" -ForegroundColor Blue -NoNewline; Write-Host "+    Processes  Threads"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[3] "" -ForegroundColor Blue -NoNewline; Write-Host "+       " -NoNewline; Write-Host ($processinfo).count "     " ($processinfo.Threads).count -ForegroundColor Blue
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[4] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[5] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[6] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[7] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[8] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[9] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[10] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host $global:graph[11]

    start-Sleep -Seconds 1 # How often it updates in seconds
}
