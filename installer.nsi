/*
Builds alternate 64bit installer (NSIS-based) that can install silently (no winzip self-extractor)
Notes: Hard-codes the install dir to "$PROGRAMFILES64\Ghostgum" when silent (cli flag is /S)
To do: read the /D from the cli to get new install location during silent install.
To update: Download 64bit self-extracting zip from GSview (http://www.ghostgum.com.au). Rename exe -> zip and unzip to bit64_WZSE0.TMP
*/

Unicode True
OutFile "gsv50w64_auto.exe"

!include LogicLib.nsh

Section -Prerequisites
  SetOutPath "$TEMP\gsv50w64_tmp"
  FILE /r bit64_WZSE0.TMP\*.*
  
  ${If} ${Silent}
    ExecWait '"$OUTDIR\setup.exe" "$PROGRAMFILES64\Ghostgum"'
  ${Else}
    ExecWait "$OUTDIR\setup.exe"
  ${EndIf}
  
  SetOutPath "$TEMP"
  RMDir "$TEMP\gsv50w64_tmp"
  
SectionEnd
