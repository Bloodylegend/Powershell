$hybridanalysis = $null
$hybridanalysis = Invoke-RestMethod 'https://www.hybrid-analysis.com/feed?json' 
$hybridanalysis = $hybridanalysis | ConvertFrom-Json
$x = 0
$hash = @()

# GET all sha 1 hashes threat score 100
do{
    if($hybridanalysis.data[$x].threatscore -eq 100){
        $hash+= $hybridanalysis.data[$x].sha1
     }
    $x++
}while($x -le $hybridanalysis.count)
