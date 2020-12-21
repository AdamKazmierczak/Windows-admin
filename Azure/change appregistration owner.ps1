$appids = $(az ad sp list --query [].appId --all --output tsv)

 

foreach ($appid in $appids) {
    az ad sp owner list --id $appid --query [].displayName 

    az ad app 
    }


$objectid= Get-Content C:\temp\appregistered\marcing.txt

foreach ($lista in $objectid )
{

az ad app owner add --id $lista --owner-object-id d3875b36-5somexampleid-7576b3c1a95a
    #dd-AzureADApplicationOwner -ObjectId 88438f65-63c2-4762-ba74-34139a5225c0 -RefObjectId c9b8f91b-0840-4737-8095-17f9c4b16e27
    }
    