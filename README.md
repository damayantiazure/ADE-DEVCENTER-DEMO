# Azure Deployment Environment Demo

This repository contains some "curated" ```Bicep``` templates to demonstrate that platform engineering team 
can publish them into the catalog Azure Deployment Envrionment for developers to consume.

## Explanation

Each folder inside ```infrastructure-templates``` folder contains a ```Bicep``` file, and if they are meant
to be published as a catalog item, they are accompaied by a ```manifest.yaml``` file.

> Note: The bicep file in this repo **must** be named ```main.bicep``` because the workflow tries to compile them to ARM templates with the assumed name.

## How to use

The ```infrastructure-templates``` folder is the root folder for the catalog items. Each folder inside it is a catalog item.
Once they are commited to GitHub the workflow will detects if there are changes made into any Bicep files, if there are, it will compile them to ARM templates and publish them to the catalog.


## How to contribute

Feel free to add more templates to this repository. The workflow will automatically detect the changes and publish them to the catalog.