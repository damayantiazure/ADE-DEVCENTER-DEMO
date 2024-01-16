az login


az extension add --name devcenter --upgrade
az provider register --namespace Microsoft.DevCenter

MY_AZURE_ID=$(az ad signed-in-user show --query id -o tsv)
AZURE_SUBSCRIPTION_ID=$(az account show --query id --output tsv)
AZURE_TENANT_ID=$(az account show --query tenantId --output tsv)

#environment variables:

LOCATION="westeurope"
AZURE_RESOURCE_GROUP="ade-rg"
AZURE_DEVCENTER="devcenter-abn"
AZURE_PROJECT="devcenterproject1"
AZURE_KEYVAULT="devcenter-ade-kv"

#Create a resource group
az group create --name $AZURE_RESOURCE_GROUP --location $LOCATION

#Create a new dev center
az devcenter admin devcenter create --name $AZURE_DEVCENTER --identity-type SystemAssigned --resource-group $AZURE_RESOURCE_GROUP --location $LOCATION

id = 
principalId


AZURE_DEVCENTER_ID=<id>
AZURE_DEVCENTER_PRINCIPAL_ID=<identity.principalId>


