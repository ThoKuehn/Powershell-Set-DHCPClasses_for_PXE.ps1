#Requires –Version 0.4
<#
.SYNOPSIS
    Skript zum automatisierten konfigurieren der für einen PXE-Boot notwendigen Optionen.

.DESCRIPTION
    Das Skript legt alle drei für die komplette PXE-Konforme Konfiguration eines DHCP Servers notwendigen Richtlinien an.
    Die Richtlinien werden mit den notwendigen Werten befüllt.
    Alle Richtlinien werden auf alle Bereiche des DHCP Servers verteielt. Eine Scope spezifiche Konfiguration ist nicht möglich. 

.PARAMETER PXE_Servername

    Name des Pxe Servers der angesprochen werden soll.



.EXAMPLES

    .\Set-DHCPClasses_for_PXE -PXE_Servername "DHCP-SRV-01"
       
.NOTES

       Autor: ThomasKühn 
       zuletzt bearbeitet: 03.03.2021
       Version: 0.1.0

         
#>



# Create the vendor classes
function Set-DHCPClasses_for_PXE{

Param(

[Parameter(Mandatory=$true, HelpMessage="FQDN des antwortenden PXE Servers eingeben.")]
[String]$PXE_Servername



)

$VendorClass1 = @{
Name = "PXEClient (UEFI x64)"
Description = "PXEClient:Arch:00007"
Type = "Vendor"
Data = "PXEClient:Arch:00007"
}
Add-DhcpServerv4Class @VendorClass1

# Since option 60 doesn't exist by default, we need to create it
netsh dhcp server add optiondef 60 PXEClient String 0 comment="PXE support"

#Create the new DHCPv4 policy.  Make sure you insert the name you want to use, along with the IP ADDRESS of the scope
Add-DhcpServerv4Policy -Name "PXEClient (UEFI x64)" -Condition OR -VendorClass EQ,"PXEClient (UEFI x64)*"

# Now create the options associated with the policy above.  Make sure your Policy Name below matches what you set on line 15
set-DhcpServerv4OptionValue -PolicyName "PXEClient (UEFI x64)" -OptionID 60 -Value PXEClient 
Set-DhcpServerv4OptionValue -PolicyName "PXEClient (UEFI x64)" -OptionId 67 "boot\x64\wdsmgfw.efi" 
Set-DhcpServerv4OptionValue -PolicyName "PXEClient (UEFI x64)" -OptionId 66 -Value "$PXE_Servername"



$VendorClass2 = @{
Name = "PXEClient (BIOS x86 & x64)"
Description = "PXEClient:Arch:00000"
Type = "Vendor"
Data = "PXEClient:Arch:00000"
}
Add-DhcpServerv4Class @VendorClass2

# Since option 60 doesn't exist by default, we need to create it
netsh dhcp server add optiondef 60 PXEClient String 0 comment="PXE support"

#Create the new DHCPv4 policy.  Make sure you insert the name you want to use, along with the IP ADDRESS of the scope
Add-DhcpServerv4Policy -Name "PXEClient (BIOS x86 & x64)" -Condition OR -VendorClass EQ,"PXEClient (BIOS x86 & x64)*"

# Now create the options associated with the policy above.  Make sure your Policy Name below matches what you set on line 15
set-DhcpServerv4OptionValue -PolicyName "PXEClient (BIOS x86 & x64)" -OptionID 60 -Value PXEClient 
Set-DhcpServerv4OptionValue -PolicyName "PXEClient (BIOS x86 & x64)" -OptionId 67 "boot\x64\wdsnbp.com" 
Set-DhcpServerv4OptionValue -PolicyName "PXEClient (BIOS x86 & x64)" -OptionId 66 -Value "$PXE_Servername"




$VendorClass3 = @{
Name = "PXEClient (UEFI x86)"
Description = "PXEClient:Arch:00006"
Type = "Vendor"
Data = "PXEClient:Arch:00006"
}
Add-DhcpServerv4Class @VendorClass3

# Since option 60 doesn't exist by default, we need to create it
netsh dhcp server add optiondef 60 PXEClient String 0 comment="PXE support"

#Create the new DHCPv4 policy.  Make sure you insert the name you want to use, along with the IP ADDRESS of the scope
Add-DhcpServerv4Policy -Name "PXEClient (UEFI x86)" -Condition OR -VendorClass EQ,"PXEClient (UEFI x86)*"

# Now create the options associated with the policy above.  Make sure your Policy Name below matches what you set on line 15
set-DhcpServerv4OptionValue -PolicyName "PXEClient (UEFI x86)" -OptionID 60 -Value PXEClient 
Set-DhcpServerv4OptionValue -PolicyName "PXEClient (UEFI x86)" -OptionId 67 "boot\x86\wdsmgfw.efi" 
Set-DhcpServerv4OptionValue -PolicyName "PXEClient (UEFI x86)" -OptionId 66 -Value "$PXE_Servername"

}

