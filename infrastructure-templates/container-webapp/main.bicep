@description('Create a new web app on Linux')
param webappName string
@description('The location where the server farm will be created.')
param location string = resourceGroup().location

var hostingPlanName = '${webappName}-plan'
var logAnalyticsName = '${webappName}-la'
var appInsightName = '${webappName}-appinsight'

module logAnalytics '../log-analytics-workspace/main.bicep' = {
  name: logAnalyticsName
  params: {
    logAnalyticsName: logAnalyticsName
    location: location
  }
}

module appInsights '../application-insights/main.bicep' = {
  name: appInsightName
  params: {
    appInsightName: appInsightName
    laWorkspaceId: logAnalytics.outputs.laWorkspaceId
    location: location
  }
}

module serverFarm '../app-service-plan/main.bicep' = {
  name: hostingPlanName
  params: {
    hostingPlanName: hostingPlanName
    location: location
  }
}

module webApp '../app-service/main.bicep' = {
  name: webappName
  params: {
    webappName: webappName
    location: location    
    instrumentationKey: appInsights.outputs.InstrumentationKey
    serverFarmId: serverFarm.outputs.hostingPlanId
  }
}
