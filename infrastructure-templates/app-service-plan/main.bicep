@description('The location where the server farm will be created.')
param location string = resourceGroup().location
@description('The name of the server farm.')
param hostingPlanName string

var resourceTags = {
  Kind: 'Managed-Service'
}

resource hosting 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: hostingPlanName
  location: location
  kind: 'linux'
  tags: resourceTags
  sku: {
    tier: 'Free'
    name: 'F1'
  }
  properties: {
    reserved: true
    targetWorkerCount: 1
  }
}

output hostingPlanId string = hosting.id
