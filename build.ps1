# Set Powershell to UTF-8
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Delete old documents
Get-ChildItem -Recurse -Include *.html -Path ./docs | Remove-Item
Get-ChildItem -Recurse -Directory -Path ./docs | Where-Object { $_.FullName -inotmatch "libs" } | Remove-Item -Force

# Find Working Directory
$workingDir = Get-Location

# Find all markdown files
Get-ChildItem -Recurse -Include *.md -Path ./src | Where-Object { $_.FullName -inotmatch "node_modules" } | ForEach-Object -Process {
    $dir = $_.DirectoryName.Replace($workingDir, "").Replace('\src', "")
    If (!(test-path ./Docs$dir/)) {
        New-Item -ItemType Directory -Force -Path ./docs$dir/
    }

    # if BaseName is README, change to index
    $filename = $_.BaseName
    If ($filename -ieq "readme") {
        $filename = "index"
    }
    pandoc --ascii -s -c /Syllabus/libs/css/default.css -F mermaid-filter.cmd -o ./docs$dir/$($filename).html $_.FullName
}

# Find reveal markdown files
# Get-ChildItem -Recurse -Include *.revealmd | Where-Object { $_.FullName -inotmatch "node_modules" } | ForEach-Object -Process {
#     $dir = $_.DirectoryName.Replace($workingDir, "")
#     If (!(test-path ./Docs$dir/)) {
#         New-Item -ItemType Directory -Force -Path ./docs$dir/
#     }
#     $filename = $_.BaseName
#     # pandoc --ascii -s -f markdown -t revealjs -o ./docs$dir/$($filename).html $_.FullName -V revealjs-url=https://unpkg.com/reveal.js@4.0.2/
#     # pandoc --ascii -s -f markdown -t revealjs -o ./docs$dir/$($filename).html $_.FullName -V revealjs-url=https://unpkg.com/browse/reveal-md@4.1.3/
#     # reveal-md $_.FullName --static ./docs$dir/$filename
# }
reveal-md ./src --static ./docs/temp --template ./templates/reveal-template.html --glob '**/*.revealmd' 
Get-ChildItem -Recurse -Path ./docs/temp | Where-Object {
    $_.FullName -inotmatch "css" -and $_.FullName -inotmatch "dist" -and $_.FullName -inotmatch "plugin"
} |
ForEach-Object {
    (Get-Content -Path $_.FullName) | ForEach-Object {
        $_ -replace "\.\\\.\.", "\Syllabus\libs\js\reveal"
    } |
    Out-File $_.FullName

    $destination = "./docs/" + ($_.FullName -replace "^.*\\([^\\]+\\[^\\]+)$", '$1')
    $destination = $destination.Replace(".revealmd", ".html")
    Move-Item -Path $_.FullName -Destination $destination
}

Remove-Item -Path ./docs/temp -Recurse -Force

# Replace all .md links to .html links
Get-ChildItem -Recurse -Path ./docs -Include *.html | ForEach-Object -Process {
    (Get-Content -Path $_.FullName) | 
        ForEach-Object {
            $_ -replace "<a href=`"([^`"]*)README\.", "<a href=`"`$1index."
        } | 
        ForEach-Object {
            $_ -replace "<a href=`"([^`"]*)\.(?:reveal)?md", "<a href=`"`$1.html" 
        } | 
        Out-File $_.FullName
}
