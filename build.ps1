# Set Powershell to UTF-8
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Delete old documents
Get-ChildItem -Recurse -Include *.html -Path ./docs | Remove-Item
Get-ChildItem -Recurse -Directory -Path ./docs | Where-Object { $_.FullName -inotmatch "libs" } | Remove-Item -Force

# Find Working Directory
$workingDir = Get-Location

# Find all markdown files
Get-ChildItem -Recurse -Include *.md | Where-Object { $_.FullName -inotmatch "node_modules" } | ForEach-Object -Process {
    $dir = $_.DirectoryName.Replace($workingDir, "")
    If (!(test-path ./Docs$dir/)) {
        New-Item -ItemType Directory -Force -Path ./docs$dir/
    }

    # if BaseName is README, change to index
    $filename = $_.BaseName
    If ($filename -ieq "readme") {
        $filename = "index"
    }
    pandoc --ascii -s -c /Syllabus/libs/css/default.css -o ./docs$dir/$($filename).html $_.FullName
}

# Replace all .md links to .html links
Get-ChildItem -Recurse -Path ./docs -Include *.html | ForEach-Object -Process {
    (Get-Content -Path $_.FullName) | 
        ForEach-Object {
            $_ -replace "<a href=`"([^`"]*)README\.", "<a href=`"`$1index."
        } | 
        ForEach-Object {
            $_ -replace "<a href=`"([^`"]*)\.md", "<a href=`"`$1.html" 
        } | 
        Out-File $_.FullName
        
}
