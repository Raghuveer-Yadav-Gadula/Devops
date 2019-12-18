!/bin/bash

LOCATION=$1
RGROUP=$1 
RVAULT=$2
VM_NAME=$3
DATE=$4


# Create recovery vault
az backup vault create --name $RGROUP --name $RVAULT --location $LOCATION

#Create/enable default backup policy for a VM(the default policy is for 30days)
az backup protection-for-vm --resource-group $RGROUP --vault-name $RVAULT --vm $VM_NAME --policy-name DefaultPolicy

#Custom policy with the backup retention date format in UTC format dd-mm-yyyy
az backup protection backup-now --resource-group $RGROUP --vault-name $RVAULT --vm $VM_NAME --retention $DATE