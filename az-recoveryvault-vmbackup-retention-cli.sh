!/bin/bash

LOCATION=$1
RESOURCEGROUP=$1 
RECOVERYSERVICEVAULT=$2
VM_NAME=$3
DATE=$4
AZBKPPOLICYNAME=$5
SUBSCRIPTION=$6



# Create recovery vault
az backup vault create --name $RESOURCEGROUP --name $RECOVERYSERVICEVAULT --location $LOCATION

#Create/enable default backup policy for a VM(the default policy is for 30days)
#az backup protection-for-vm --resource-group $RESOURCEGROUP --vault-name $RECOVERYSERVICEVAULT --vm $VM_NAME --policy-name DefaultPolicy

#Custom policy with the backup retention date format in UTC format dd-mm-yyyy
#az backup protection backup-now --resource-group $RGROUP --vault-name $RVAULT --vm $VM_NAME --retention $DATE

#usage of az show and parsing in json template
#az vm show -g policy{az-backup-vault-creation.json}

#source of the json template "https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-keyvault-parameter"

#create new backup policy with BackupManagementType and workload Type
#az backup policy create --name {azbackup} --resource-group $RESOURCEGROUP --vault-name $RECOVERYSERVICEVAULT --name $AZBKPPOLICYNAME [--subscription $SUBSCRIPTION]

#create backup vault creation via json file/template

#create az bkp policy create via jason file/template
az backup policy create --policy {az-bkp-daily-policy-deploy.json} --resource-group $RESOURCEGROUP --vault-name $RECOVERYSERVICEVAULT --name $AZBKPPOLICYNAME [--subscription $SUBSCRIPTION]
