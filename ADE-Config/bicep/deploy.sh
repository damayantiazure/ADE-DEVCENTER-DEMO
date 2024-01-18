
RG="devcenter-rg"

#Get the deploying users id for RBAC assignments
#DEPLOYINGUSERID=$(az ad signed-in-user show --query id -o tsv)
DEPLOYINGUSERID='6e4c3017-00f7-440d-ac5c-695cf98dd060'

#Create resource group
az group create -n $RG -l westeurope

#Deploy the common infrastructure
DCNAME=$(az deployment group create -g $RG -f ADE-Config/bicep/common.bicep -p nameseed=devbox devboxProjectUser=$DEPLOYINGUSERID --query 'properties.outputs.devcenterName.value' -o tsv)

#Deploy Microsoft Dev Box Infrastructure
az deployment group create -g $RG -f ADE-Config/bicep/devbox.bicep -p devcenterName=$DCNAME

#Configure and Deploy Microsoft Dev Box Infrastructure
#PAT="nupzp45oenzytelvjvo6aitucmwznqgtg2u7qu6hee6byd2ele7a"
PAT='https://abndevcenterkeyvault.vault.azure.net/secrets/adopat'
REPO='https://dev.azure.com/damayantibhuyan/customerPOCs/_git/ade-demo'
az deployment group create -g $RG -f ADE-Config/bicep/ade.bicep -p devcenterName=$DCNAME catalogRepoUri=$REPO catalogRepoPat=$PAT adeProjectUser=$DEPLOYINGUSERID