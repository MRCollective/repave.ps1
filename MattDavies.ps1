Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\repave.psm1" -Force
Invoke-Repave {

    # Windows Explorer
    Set-AdvancedWindowsExplorerOptions

    # IIS
    Install-IIS
    Install-ChocolateyPackage UrlRewrite
    Install-WebDeploy35
    
    # Git
    Install-Git
    
    # Visual Studio
    #Install-VisualStudio2013 "Professional" "WebTools" {
    #    Install-VS2013Extension "http://visualstudiogallery.msdn.microsoft.com/6a2ae0fa-bd4e-4712-9170-abe92c63c05c/file/109467/20/MattDavies.TortoiseGitToolbar.vsix"
    #    Install-VS2013Extension "http://visualstudiogallery.msdn.microsoft.com/71a4e9bd-f660-448f-bd92-f5a65d39b7f0/file/52593/29/chutzpah.visualstudio.vsix"
    #    Install-VS2013Extension "http://visualstudiogallery.msdn.microsoft.com/f8741f04-bae4-4900-81c7-7c9bfb9ed1fe/file/66979/24/Chutzpah.VS2012.vsix"
    #}
    #Install-ChocolateyPackage ReSharper
    #Restore-ReSharperExtensions "packages.config"
    
    # Utils
    Install-ChocolateyPackage fiddler4
    Install-ChocolateyPackage sysinternals
    Install-ChocolateyPackage 7zip
    Install-ChocolateyPackage AdobeReader
    Install-ChocolateyPackage notepadplusplus
    Install-ChocolateyPackage vlc
    Write-Warning "Install Cisco AnyConnect, Photoshop`r`n"
    
    # Internet
    Install-ChocolateyPackage GoogleChrome
    Install-ChocolateyPackage Firefox -RunIfInstalled { Write-Warning "Set Firefox to not auto-update if using for Selenium testing`r`n" }
    Install-ChocolateyPackage Skype
    
    # Final warnings
    if ($update -eq "false") {
        Write-Warning "Check device manager for missing drivers; check graphics drivers; check laptop special buttons work`r`n"
        Write-Warning "Install printers"
        Write-Warning "Configure power options`r`n"
        Write-Warning "Run Windows Update`r`n"
    }
}
