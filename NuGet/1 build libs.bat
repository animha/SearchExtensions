@echo off

CD %~dp0

echo Set params...
set verb=/verbosity:minimal

set msbuild="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"

set c1_proj=..\NinjaNye.SearchExtensions\NinjaNye.SearchExtensions.csproj

set c_rel=Releases

set c_out=..\NuGet\%c_rel%

set t_20=Configuration=Release;TargetFramework=net20
set t_30=Configuration=Release;TargetFramework=net30
set t_35=Configuration=Release;TargetFramework=net35;TargetFrameworkProfile=client
set t_40=Configuration=Release;TargetFramework=net40;TargetFrameworkProfile=client
set t_45=Configuration=Release;TargetFramework=net45
set t_46=Configuration=Release;TargetFramework=net46
set t_47=Configuration=Release;TargetFramework=net47
set t_netstandard10=Configuration=Release;TargetFramework=netstandard1.0
set t_netstandard13=Configuration=Release;TargetFramework=netstandard1.3
set t_netstandard2=Configuration=Release;TargetFramework=netstandard2.0


set t_mono_20=%t_20%;DefineConstants=MONO
set t_mono_35=%t_35%;DefineConstants=MONO
set t_mono_40=%t_40%;DefineConstants=MONO
set t_mono_45=%t_45%;DefineConstants=MONO


echo.
echo.
echo - BUILD OTG.NinjaNye.SearchExtensions (minimum version: Framework 4.5)...
echo.
%msbuild% %c1_proj% /t:rebuild /p:%t_45%;OutputPath=%c_out%\OTG.NinjaNye.SearchExtensions\NET45 %verb%
%msbuild% %c1_proj% /t:rebuild /p:%t_netstandard10%;OutputPath=%c_out%\OTG.NinjaNye.SearchExtensions\netstandard10 %verb%

pause