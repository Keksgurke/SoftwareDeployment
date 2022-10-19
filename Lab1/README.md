# Lab 1

Command:
```
$templateFile = "azuredeploy.json"
$parameterFile= "azuredeploy.parameters.json"
New-AzResourceGroup `
  -Name myResourceGroupDev `
  -Location "East US"
New-AzResourceGroupDeployment `
  -Name devenvironment `
  -ResourceGroupName myResourceGroupDev `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile
```

Creates:
Node.JS Webapp
Storage Account
