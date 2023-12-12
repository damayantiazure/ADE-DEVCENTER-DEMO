@description('The name of the log analytics workspace')
param logAnalyticsName string
@description('Specifies the name of the key vault.')
param keyVaultName string
param location string = resourceGroup().location
module loganalytics '../log-analytics-workspace/main.bicep' = {
  name: logAnalyticsName
  params: {
    logAnalyticsName: logAnalyticsName
    location: location
  }
}
module keyvault '../key-vault/main.bicep' = {
  name: keyVaultName
  params: {
    keyVaultName: keyVaultName
    location: location
  }
}
