@description('Create a new web app on Linux')
param webappName string
@description('The location of the web app. Defaults to the resource group location.')
param location string = resourceGroup().location
@description('The id of the service plan to use for the web app.')
param serverFarmId string
@description('The instrumentation key of the application insight.')
param instrumentationKey string

resource webapp 'Microsoft.Web/sites@2016-08-01' = {
  name: webappName
  location: location
  properties: {
    httpsOnly: true
    clientAffinityEnabled: false
    serverFarmId: serverFarmId
    siteConfig: {
      linuxFxVersion: 'DOCKER|nginx:alpine'
      appSettings: [
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
        {          
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: instrumentationKey
        }
        {
          name: 'ApplicationInsightsAgent_EXTENSION_VERSION'
          value: '~2'
        }
        {
          name: 'XDT_MicrosoftApplicationInsights_Mode'
          value: 'default'
        }
      ]      
    }
  }
}
