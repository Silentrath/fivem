﻿mkdir -Force out

foreach ($file in (Get-Item natives_stash\*.lua)) {
    .\lua53 codegen.lua $file.FullName | out-file -encoding ascii "out\natives_$(($file.BaseName -replace "gta_", '').ToLower()).lua"
}

.\lua53 codegen.lua | out-file -encoding ascii "out\natives_server.lua"