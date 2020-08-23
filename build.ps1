# Set Powershell to UTF-8
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Delete old documents
Get-ChildItem -Recurse -Include *.html -Path ./docs | Remove-Item
Get-ChildItem -Recurse -Directory -Path ./docs | Where-Object {$_.FullName -inotmatch "libs"} | Remove-Item -Force

# Find Working Directory
$workingDir = Get-Location

# Find all markdown files
Get-ChildItem -Recurse -Include *.md | ForEach-Object -Process {
    $dir = $_.DirectoryName.Replace($workingDir, "")
    If (!(test-path ./Docs$dir/)) {
        New-Item -ItemType Directory -Force -Path ./docs$dir/
    }

    pandoc --ascii -s -c /libs/css/default.css -o ./docs$dir/$($_.BaseName).html $_.FullName
}

# Replace all .md links to .html links
Get-ChildItem -Recurse -Path ./docs -Include *.html | ForEach-Object -Process {
    (Get-Content -Path $_.FullName) -replace "<a href=`"(.*)\.md", "<a href=`"`$1.html" | Out-File $_.FullName
}
