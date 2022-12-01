# HyperV-Switcher
Usefull tool (I think), to Enable/Disable HyperV

This tool only Enables/Disables VMMS service and change hypervisor status in bcdedit. To use VMWare in real hypervisor mode or other third-party virtualisation tool YOU DON'T NEED to remove HyperV. This tool just ENABLE or DISABLE HyperV to keep the possibility of temporarly using third party tools or when you need it

#HOW TO USE IT

IN ADMIN

Before you need to Unrestrict Execution Policy of Powershell
> Set-ExecutionPolicy Unrestricted

And now you can start the script

> .\Hypervswitcher.ps1
