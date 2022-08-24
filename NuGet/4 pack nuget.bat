@echo off

CD %~dp0

echo.
echo - Get version...
for /f %%i in ('getVer.exe SharedAssemblyInfo.cs') do set version=%%i
echo Version: %version%

echo.
echo.
echo - Pack NuGets...
echo.
nuget.exe pack OTG.NinjaNye.SearchExtensions.nuspec -Version %version% -OutputDirectory Pkg

pause