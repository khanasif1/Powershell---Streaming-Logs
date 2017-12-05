#Get-Content "C:\Dev\PWC.VSO\AU DigiTech FSA\D\V1.0\PWC.AU.FSA.AuditSherpa\PWC.AU.FSA.Automation\bin\Logs\Info\1.log" -WAIT

$file="C:\Dev\PWC.VSO\AU DigiTech FSA\D\V1.0\PWC.AU.FSA.AuditSherpa\PWC.AU.FSA.Automation\bin\Logs\Info\1.log"
Get-Content $file -Wait | ForEach-Object -Begin {
  $counter = 1
  $lines = @(Get-Content $file).Count
} -Process {
  if ($counter++ -gt $lines) {
   if($_.ToString().Contains("ERROR")){
       Write-host $_.ToString() -foregroundcolor "red"
   }else{
        Write-host $_.ToString() -foregroundcolor "green"
   }    
  }
}