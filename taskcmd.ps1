$global:crow = 10 # Used for tracking the current row
$global:graph = @(@("+","+","C","P","U","+","+","+","+","%","+","+"),@(" "," "," "," "," "," "," "," "," "," "),@("+"," "," "," "," "," "," "," "," "," "," ","+"),@("+"," "," "," "," "," "," "," "," "," "," ","+"),@("+"," "," "," "," "," "," "," "," "," "," ","+"),@("+"," "," "," "," "," "," "," "," "," "," ","+"),@("+"," "," "," "," "," "," "," "," "," "," ","+"),@("+"," "," "," "," "," "," "," "," "," "," ","+"),@("+"," "," "," "," "," "," "," "," "," "," ","+"),@("+"," "," "," "," "," "," "," "," "," "," ","+"),@("+"," "," "," "," "," "," "," "," "," "," ","+"),@("+","+","+","+","+","+","+","+","+","+","+","+"))
$cpuinfo = Get-CimInstance -ClassName Win32_Processor 

function updaterow10 { #Updates the 10th row
    Process {
        if ($global:cpu -ge 50){
            if($global:cpu -ge 70){
                if ($global:cpu -ge 80){ 
                    if ($global:cpu -ge 90){ # CPU 90-100%
                        $global:graph[1][9] = "P"
                        $global:graph[2][10] = "P"
                        $global:graph[3][10] = "P"
                        $global:graph[4][10] = "P"
                        $global:graph[5][10] = "P"
                        $global:graph[6][10] = "P"
                        $global:graph[7][10] = "P"
                        $global:graph[8][10] = "P"
                        $global:graph[9][10] = "P"
                        $global:graph[10][10] = "P"
                    }
                    else{ # CPU 80-89.9%
                        $global:graph[1][9] = " "
                        $global:graph[2][10] = " "
                        $global:graph[3][10] = "P"
                        $global:graph[4][10] = "P"
                        $global:graph[5][10] = "P"
                        $global:graph[6][10] = "P"
                        $global:graph[7][10] = "P"
                        $global:graph[8][10] = "P"
                        $global:graph[9][10] = "P"
                        $global:graph[10][10] = "P"
                    }
                }
                else{ # CPU 70-79.9%
                    $global:graph[1][9] = " "
                    $global:graph[2][10] = " "
                    $global:graph[3][10] = " "
                    $global:graph[4][10] = "P"
                    $global:graph[5][10] = "P"
                    $global:graph[6][10] = "P"
                    $global:graph[7][10] = "P"
                    $global:graph[8][10] = "P"
                    $global:graph[9][10] = "P"
                    $global:graph[10][10] = "P"
                }
            }
            else{ # CPU 60-69.9%
                if ($global:cpu -ge 60){
                    $global:graph[1][9] = " "
                    $global:graph[2][10] = " "
                    $global:graph[3][10] = " "
                    $global:graph[4][10] = " "
                    $global:graph[5][10] = "P"
                    $global:graph[6][10] = "P"
                    $global:graph[7][10] = "P"
                    $global:graph[8][10] = "P"
                    $global:graph[9][10] = "P"
                    $global:graph[10][10] = "P"
                }
                else{ # CPU 50-59.9%
                    $global:graph[1][9] = " "
                    $global:graph[2][10] = " "
                    $global:graph[3][10] = " "
                    $global:graph[4][10] = " "
                    $global:graph[5][10] = " "
                    $global:graph[6][10] = "P"
                    $global:graph[7][10] = "P"
                    $global:graph[8][10] = "P"
                    $global:graph[9][10] = "P"
                    $global:graph[10][10] = "P"
                }
            }
        }
        else{
            if ($global:cpu -ge 30){
                if ($global:cpu -ge 40){ # CPU 40-49.9%
                    $global:graph[1][9] = " "
                    $global:graph[2][10] = " "
                    $global:graph[3][10] = " "
                    $global:graph[4][10] = " "
                    $global:graph[5][10] = " "
                    $global:graph[6][10] = " "
                    $global:graph[7][10] = "P"
                    $global:graph[8][10] = "P"
                    $global:graph[9][10] = "P"
                    $global:graph[10][10] = "P"
                }
                else{ # CPU 30-39.9%
                    $global:graph[1][9] = " "
                    $global:graph[2][10] = " "
                    $global:graph[3][10] = " "
                    $global:graph[4][10] = " "
                    $global:graph[5][10] = " "
                    $global:graph[6][10] = " "
                    $global:graph[7][10] = " "
                    $global:graph[8][10] = "P"
                    $global:graph[9][10] = "P"
                    $global:graph[10][10] = "P"
                }
            }
            else{
                if($global:cpu -ge 20){ # CPU 20-24.9%
                    $global:graph[1][9] = " "
                    $global:graph[2][10] = " "
                    $global:graph[3][10] = " "
                    $global:graph[4][10] = " "
                    $global:graph[5][10] = " "
                    $global:graph[6][10] = " "
                    $global:graph[7][10] = " "
                    $global:graph[8][10] = " "
                    $global:graph[9][10] = "P"
                    $global:graph[10][10] = "P"
                }
                else{
                    if($global:cpu -ge 10){ # CPU 10-19.9%
                        $global:graph[1][9] = " "
                        $global:graph[2][10] = " "
                        $global:graph[3][10] = " "
                        $global:graph[4][10] = " "
                        $global:graph[5][10] = " "
                        $global:graph[6][10] = " "
                        $global:graph[7][10] = " "
                        $global:graph[8][10] = " "
                        $global:graph[9][10] = " "
                        $global:graph[10][10] = "P"
                    }
                    else{ # CPU 0-9.9%
                        $global:graph[1][9] = " "
                        $global:graph[2][10] = " "
                        $global:graph[3][10] = " "
                        $global:graph[4][10] = " "
                        $global:graph[5][10] = " "
                        $global:graph[6][10] = " "
                        $global:graph[7][10] = " "
                        $global:graph[8][10] = " "
                        $global:graph[9][10] = " "
                        $global:graph[10][10] = "."
                    }
                } 
            }
        }
    }
}

function copyRow10ToRow9 { # Copies Row 10 to Row 9
    $global:graph[1][8] = $global:graph[1][9]
    $global:graph[2][9] = $global:graph[2][10]
    $global:graph[3][9] = $global:graph[3][10]
    $global:graph[4][9] = $global:graph[4][10]
    $global:graph[5][9] = $global:graph[5][10]
    $global:graph[6][9] = $global:graph[6][10]
    $global:graph[7][9] = $global:graph[7][10]
    $global:graph[8][9] = $global:graph[8][10]
    $global:graph[9][9] = $global:graph[9][10]
    $global:graph[10][9] = $global:graph[10][10]
}
function copyRow9ToRow8 { # Copies Row 9 to Row 8
    $global:graph[1][7] = $global:graph[1][8]
    $global:graph[2][8] = $global:graph[2][9]
    $global:graph[3][8] = $global:graph[3][9]
    $global:graph[4][8] = $global:graph[4][9]
    $global:graph[5][8] = $global:graph[5][9]
    $global:graph[6][8] = $global:graph[6][9]
    $global:graph[7][8] = $global:graph[7][9]
    $global:graph[8][8] = $global:graph[8][9]
    $global:graph[9][8] = $global:graph[9][9]
    $global:graph[10][8] = $global:graph[10][9]
}
function copyRow8ToRow7 { # Copies Row 8 to Row 7
    $global:graph[1][6] = $global:graph[1][7]
    $global:graph[2][7] = $global:graph[2][8]
    $global:graph[3][7] = $global:graph[3][8]
    $global:graph[4][7] = $global:graph[4][8]
    $global:graph[5][7] = $global:graph[5][8]
    $global:graph[6][7] = $global:graph[6][8]
    $global:graph[7][7] = $global:graph[7][8]
    $global:graph[8][7] = $global:graph[8][8]
    $global:graph[9][7] = $global:graph[9][8]
    $global:graph[10][7] = $global:graph[10][8]
}
function copyRow7ToRow6 { # Copies Row 7 to Row 6
    $global:graph[1][5] = $global:graph[1][6]
    $global:graph[2][6] = $global:graph[2][7]
    $global:graph[3][6] = $global:graph[3][7]
    $global:graph[4][6] = $global:graph[4][7]
    $global:graph[5][6] = $global:graph[5][7]
    $global:graph[6][6] = $global:graph[6][7]
    $global:graph[7][6] = $global:graph[7][7]
    $global:graph[8][6] = $global:graph[8][7]
    $global:graph[9][6] = $global:graph[9][7]
    $global:graph[10][6] = $global:graph[10][7]
}
function copyRow6ToRow5 { # Copies Row 6 to Row 5
    $global:graph[1][4] = $global:graph[1][5]
    $global:graph[2][5] = $global:graph[2][6]
    $global:graph[3][5] = $global:graph[3][6]
    $global:graph[4][5] = $global:graph[4][6]
    $global:graph[5][5] = $global:graph[5][6]
    $global:graph[6][5] = $global:graph[6][6]
    $global:graph[7][5] = $global:graph[7][6]
    $global:graph[8][5] = $global:graph[8][6]
    $global:graph[9][5] = $global:graph[9][6]
    $global:graph[10][5] = $global:graph[10][6]
}
function copyRow5ToRow4 { # Copies Row 5 to Row 4
    $global:graph[1][3] = $global:graph[1][4]
    $global:graph[2][4] = $global:graph[2][5]
    $global:graph[3][4] = $global:graph[3][5]
    $global:graph[4][4] = $global:graph[4][5]
    $global:graph[5][4] = $global:graph[5][5]
    $global:graph[6][4] = $global:graph[6][5]
    $global:graph[7][4] = $global:graph[7][5]
    $global:graph[8][4] = $global:graph[8][5]
    $global:graph[9][4] = $global:graph[9][5]
    $global:graph[10][4] = $global:graph[10][5]
}
function copyRow4ToRow3 { # Copies Row 4 to Row 3
    $global:graph[1][2] = $global:graph[1][3]
    $global:graph[2][3] = $global:graph[2][4]
    $global:graph[3][3] = $global:graph[3][4]
    $global:graph[4][3] = $global:graph[4][4]
    $global:graph[5][3] = $global:graph[5][4]
    $global:graph[6][3] = $global:graph[6][4]
    $global:graph[7][3] = $global:graph[7][4]
    $global:graph[8][3] = $global:graph[8][4]
    $global:graph[9][3] = $global:graph[9][4]
    $global:graph[10][3] = $global:graph[10][4]
}
function copyRow3ToRow2 { # Copies Row 3 to Row 2
    $global:graph[1][1] = $global:graph[1][2]
    $global:graph[2][2] = $global:graph[2][3]
    $global:graph[3][2] = $global:graph[3][3]
    $global:graph[4][2] = $global:graph[4][3]
    $global:graph[5][2] = $global:graph[5][3]
    $global:graph[6][2] = $global:graph[6][3]
    $global:graph[7][2] = $global:graph[7][3]
    $global:graph[8][2] = $global:graph[8][3]
    $global:graph[9][2] = $global:graph[9][3]
    $global:graph[10][2] = $global:graph[10][3]
}
function copyRow2ToRow1 { # Copies Row 2 to Row 1
    $global:graph[1][0] = $global:graph[1][1]
    $global:graph[2][1] = $global:graph[2][2]
    $global:graph[3][1] = $global:graph[3][2]
    $global:graph[4][1] = $global:graph[4][2]
    $global:graph[5][1] = $global:graph[5][2]
    $global:graph[6][1] = $global:graph[6][2]
    $global:graph[7][1] = $global:graph[7][2]
    $global:graph[8][1] = $global:graph[8][2]
    $global:graph[9][1] = $global:graph[9][2]
    $global:graph[10][1] = $global:graph[10][2]
}

While ($true) {
        
    #Gets the inital data
    $CounterSamples = Get-Counter '\Process(*)\ID Process','\Process(*)\% Processor Time','\Processor(_total)\% Processor Time' | Select-Object -Expand CounterSamples
    
    $processinfo = Get-Process #gets the processes
        
    #Displays the Total CPU Utilization
    $global:cpu = [Math]::round(($countersamples | Where-Object {$_.path -match "processor\(_to"}).CookedValue)
    
    #update the graph data
    if ($global:crow -eq 10){

        updaterow10
        $global:crow = 9

    }
    elseif ($global:crow -eq 9) {

        copyRow10ToRow9
        updaterow10
        $global:crow = 8

    }
    elseif ($global:crow -eq 8) {
        
        copyRow9ToRow8
        copyRow10ToRow9
        updaterow10
        $global:crow = 7

    }
    elseif ($global:crow -eq 7) {

        copyRow8ToRow7
        copyRow9ToRow8
        copyRow10ToRow9
        updaterow10
        $global:crow = 6

    }
    elseif ($global:crow -eq 6) {

        copyRow7ToRow6
        copyRow8ToRow7
        copyRow9ToRow8
        copyRow10ToRow9
        updaterow10
        $global:crow = 5

    }
    elseif ($global:crow -eq 5) {

        copyRow6ToRow5
        copyRow7ToRow6
        copyRow8ToRow7
        copyRow9ToRow8
        copyRow10ToRow9
        updaterow10
        $global:crow = 4

    }
    elseif ($global:crow -eq 4) {

        copyRow5ToRow4
        copyRow6ToRow5
        copyRow7ToRow6
        copyRow8ToRow7
        copyRow9ToRow8
        copyRow10ToRow9
        updaterow10
        $global:crow = 3

    }
    elseif ($global:crow -eq 3) {
        
        copyRow4ToRow3
        copyRow5ToRow4
        copyRow6ToRow5
        copyRow7ToRow6
        copyRow8ToRow7
        copyRow9ToRow8
        copyRow10ToRow9
        updaterow10 
        $global:crow = 2

    }
    elseif ($global:crow -eq 2) {
        
        copyRow3ToRow2
        copyRow4ToRow3
        copyRow5ToRow4
        copyRow6ToRow5
        copyRow7ToRow6
        copyRow8ToRow7
        copyRow9ToRow8
        copyRow10ToRow9
        updaterow10
        $global:crow = 1

    }
    elseif ($global:crow -eq 1) {

        copyRow2ToRow1
        copyRow3ToRow2
        copyRow4ToRow3
        copyRow5ToRow4
        copyRow6ToRow5
        copyRow7ToRow6
        copyRow8ToRow7
        copyRow9ToRow8
        copyRow10ToRow9
        updaterow10

    }
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
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[2][1,2,3,4,5,6,7,8,9,10] "" -ForegroundColor Blue -NoNewline; Write-Host "+    Processes  Threads"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[3][1,2,3,4,5,6,7,8,9,10] "" -ForegroundColor Blue -NoNewline; Write-Host "+       " -NoNewline; Write-Host ($processinfo).count "     " ($processinfo.Threads).count -ForegroundColor Blue
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[4][1,2,3,4,5,6,7,8,9,10] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[5][1,2,3,4,5,6,7,8,9,10] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[6][1,2,3,4,5,6,7,8,9,10] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[7][1,2,3,4,5,6,7,8,9,10] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[8][1,2,3,4,5,6,7,8,9,10] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[9][1,2,3,4,5,6,7,8,9,10] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host "+" -NoNewline; Write-Host "" $global:graph[10][1,2,3,4,5,6,7,8,9,10] "" -ForegroundColor Blue -NoNewline; Write-Host "+"
    Write-Host $global:graph[11]  

    start-Sleep -Seconds 1 # How often it updates in seconds
}
