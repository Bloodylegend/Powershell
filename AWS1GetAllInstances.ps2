#Get a list of all regions
$regionList = Get-AWSRegion
#loop throught the regions
foreach($r in $regionList){
    Write-Host $R.Name  -ForegroundColor Green
    $i = (Get-EC2Instance -region $r.Region)
    if($i -ne $null){
        $x = 0
        do{
        $instance = $i[$x].Instances[0]
        Write-Host ($instance.InstanceId + " " + $instance.PublicIpAddress + " "  + $instance.State.name.Value) -ForegroundColor Yellow
        $x++
        }
        while($x -lt (Get-EC2Instance -Region $r.Region).Instances.Count)
    }
}
