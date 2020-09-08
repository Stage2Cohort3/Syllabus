# Set Powershell to UTF-8
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Delete old documents
Get-ChildItem -Recurse -Include *.html -Path ./docs | Remove-Item
Get-ChildItem -Recurse -Directory -Path ./docs | Where-Object { $_.FullName -inotmatch "libs" } | Remove-Item -Recurse -Force

# Find Working Directory
$workingDir = Get-Location
##################################################################
# Pandoc all markdown files
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
##################################################################
# Reveal-md all reveal markdown files
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

##################################################################

# Move all other file types
Get-ChildItem -Recurse -Path ./src -Exclude *.md, *.revealmd -File | ForEach-Object -Process {
    $dir = $_.DirectoryName.Replace($workingDir, "").Replace('\src', "")
    If (!(test-path ./Docs$dir/)) {
        New-Item -ItemType Directory -Force -Path ./docs$dir/
    }
    
    Copy-Item -Path $_.FullName -Destination ./docs$dir/$($_.Name)
}

##################################################################
# Replace all .md links to .html links in HTML files
Get-ChildItem -Recurse -Path ./docs -Include *.html | ForEach-Object -Process {
    (Get-Content -Path $_.FullName) | 
        ForEach-Object {
            $_ -replace "<a href=`"([^`"]*)README\.", "<a href=`"`$1index."
        } | 
        ForEach-Object {
            $_ -replace "<a href=`"([^`"]*)\.(?:reveal)?md", "<a href=`"`$1.html" 
        } | 
        Out-File $_.FullName -Encoding utf8
}
