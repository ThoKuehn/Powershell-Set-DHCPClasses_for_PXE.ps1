<#
.SYNOPSIS
    Script example to sideload MSIX Bundles.

.DESCRIPTION
    The script is an example to install msix bundles  
.PARAMETER PXE_Servername

    FQDN of the PXE server to be addressed.



.EXAMPLES

    Add-AppxProvisionedPackage -Online -PackagePath "C:\Program Files (x86)\xxxx.msixbundle" -DependencyPackagePath "C:\Program Files (x86)\xxxx\Microsoft.VCLibs.x64.14.00.appx" -SkipLicense -LogPath "c:\logs\test\xxxxx.txt"
    Add-AppxProvisionedPackage -Online -PackagePath "C:\Program Files (x86)\xxxx.msixbundle" -DependencyPackagePath "C:\Program Files (x86)\xxxx\Microsoft.VCLibs.x64.14.00.appx","C:\Program Files (x86)\xxxx\Microsoft.NET.Native.Runtime.2.2.appx","C:\Program Files (x86)\xxxx\Microsoft.NET.Native.Framework.2.2.appx","C:\Program Files (x86)\xxxx\Microsoft.UI.Xaml.2.3.appx" -SkipLicense -LogPath "c:\logs\test\xxxx.txt"
.NOTES

       Autor: ThomasKühn 
       last edited: 12.03.2021
       
       Version: 0.1.0 initial Version

         
#>






Add-AppxProvisionedPackage -Online -PackagePath "C:\Program Files (x86)\xxxx.msixbundle" -DependencyPackagePath "C:\Program Files (x86)\xxxxxxMicrosoft.VCLibs.x64.14.00.appx", -SkipLicense -LogPath "c:\logs\test\DTMS_installlog.txt"



