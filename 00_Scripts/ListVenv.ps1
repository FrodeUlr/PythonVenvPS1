$path = $env:PRIV_PYTHON_LOC
$directories = Get-ChildItem -Path $path -Directory
$indexes = @()
$names = @()
$versions = @()

for($i = 0; $i -lt $directories.Count; $i++) {
    $y = $i + 1
    $content = Get-Content -Path "$($directories[$i].FullName)\pyvenv.cfg"
    $content | Select-String -Pattern "version" | ForEach-Object {
        $version = $_.ToString().Split('=')[1].Trim()
    }
    $indexes += $y
    $names += $directories[$i].Name
    $versions += $version
}

$tableobject = foreach($i in 0..($indexes.Count - 1)) {
    [PSCustomObject]@{
        'Index' = $indexes[$i]
        'Name' = $names[$i]
        'Python Version' = $versions[$i]
    }
}

$tableobject | Format-Table -Property 'Index', 'Name', 'Python Version' -AutoSize
