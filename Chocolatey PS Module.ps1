<#Author       : Dean Cefola
# Creation Date: 02-23-2021
# Usage        : PS Gallery / Chocolatey Setup

#********************************************************************************
# Date                         Version      Changes
#------------------------------------------------------------------------
# 02/23/2021                     1.0        Initial Version
#
#*********************************************************************************
#
#>


####################################
#    Check PSGallery Repository    #
####################################
$PSRepo = Get-PSRepository -Name PSGallery -ErrorAction SilentlyContinue
if ($PSRepo -eq $fale){    
    write-host 'Add PSGallery Repository'
    Register-PSRepository -Default
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted -Verbose    
}
else {
    write-host 'Set PSGallery Repository as Trusted'
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted -Verbose    
}


############################
#    Install Chocolatey    #
############################
Install-Module `
    -Name chocolatey `
    -RequiredVersion 0.0.71 `
    -Force `
    -AllowClobber `
    -Repository PSGallery `
    -Verbose 
Import-Module -Name chocolatey