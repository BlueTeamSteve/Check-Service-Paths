#Pull list of services from registry

$svclist = Get-ChildItem HKLM:\SYSTEM\CurrentControlSet\services | ForEach-Object {Get-ItemProperty $_.PsPath}

#Ignore anything after .exe, filter for vulnerabile services
ForEach ($svc in $svclist) {
    $svcpath = $svc.ImagePath -split ".exe"
    if(($svcpath[0] -like "* *") -and ($svcpath[0] -notlike '"*') -and ($svcpath[0] -notlike "\*")) {
        $svc | fl -Property DisplayName,ImagePath,PsPath
    }

#Check service permissions (Full Control or Modify is BAD!!)



}