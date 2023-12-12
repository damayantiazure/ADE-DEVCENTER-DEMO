# Modules for Infrastructure Templates

## Deplying via Azure CLI

Once you created the catalog and synced it - you can use Azure CLI to deploy the environment.

> Note: We are using ```--%``` to indicate that the rest of the command is a JSON string. This is needed because the parameters are a JSON string and we need to pass it as is to the command.

```bash	
az devcenter dev environment create --dev-center-name  NebulaDevCenter --project-name SalesOrderManagement --catalog-name Catalog1  --environment-definition-name LogAnalyticsWorkspace --environment-name LARGP001 --environment-type Pre-Production --user-id 015f84bd-2d24-43d8-a03a-32349d1e2148 --% --parameters "{\"logAnalyticsName\":\"moiha2023\"}"

```

### Explanation of the parameters

- dev-center-name: The name of the Dev Center
- project-name: The name of the project
- catalog-name: The name of the catalog - as synced into the Dev Center
- environment-definition-name: The name of the environment definition - this would be the folder name where the template is hosted/located.
- environment-name: The name of the environment - this is the name of the environment that will be created. This is also the suffix that gets created as new resource group.
- environment-type: The type of the environment - this is the type of the environment that will be created. 
- user-id: The user id of the user that will be the owner of the environment.
- parameters: The parameters that will be passed to the template. This is a JSON string that contains the parameters that will be passed to the template. The parameters are defined in the template.json file.