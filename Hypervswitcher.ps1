#Preparing components and primary variables of this script

Add-Type -assembly System.Windows.Forms
$ServiceName = "vmms"
$myservice = Get-Service -Name $ServiceName

#Functions to Enable/Disable HyperV in onClick actions must stay here

  function Enable-HyperV {
  Set-Service -Name vmms -StartupType auto
  bcdedit /set hypervisorlaunchtype auto
  [System.Windows.Forms.MessageBox]::Show("HyperV is activated, we will restart your computer","Success",[System.Windows.Forms.MessageBoxButtons]::OK)
  Restart-Computer
  }

function Disable-HyperV {
  Set-Service -Name vmms -StartupType disabled
  bcdedit /set hypervisorlaunchtype off
  [System.Windows.Forms.MessageBox]::Show("HyperV is now disabled, we will restart your computer","Success",[System.Windows.Forms.MessageBoxButtons]::OK)
  Restart-Computer
  }


#Now creating the window

$main_form = New-Object System.Windows.Forms.Form

$main_form.Text ='HyperV Switcher'

$main_form.Width = 320

$main_form.Height = 200

#Position and Size window parameters

$main_form.AutoScale = $true
$main_form.AutoSize = $true
$main_form.FormBorderStyle = "FixedDialog"
$main_form.StartPosition = "CenterScreen"


$ButtonEnable = New-Object System.Windows.Forms.Button
$ButtonEnable.Text = "Enable HyperV"
$ButtonEnable.Location = New-Object System.Drawing.Size(70,15)

$ButtonEnable.Size = New-Object System.Drawing.Size(150,50)
$buttonEnable.Enabled = $false
$ButtonEnable.Add_Click({Enable-HyperV})
$main_form.Controls.Add($ButtonEnable)

$ButtonDisable = New-Object System.Windows.Forms.Button
$ButtonDisable.Text = "Disable HyperV"
$ButtonDisable.Location = New-Object System.Drawing.Size(70,80)

$ButtonDisable.Size = New-Object System.Drawing.Size(150,50)
$buttonDisable.Enabled = $false
$ButtonDisable.Add_Click({Disable-HyperV})
$main_form.Controls.Add($ButtonDisable)

#Scanning the actual status of vmms service and activate correct button, if there is something "incompatible" all buttons stays inactive

  if ($myservice.StartType -eq 'disabled')
  {
  $buttonDisable.Enabled = $false
  $buttonEnable.Enabled = $true
  $main_form.refresh()
  }
  else
  {
  $buttonDisable.Enabled = $true
  $buttonEnable.Enabled = $false
  $main_form.refresh()
  }
$main_form.ShowDialog()