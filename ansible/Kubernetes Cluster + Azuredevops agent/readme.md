I am assuming you do have host file created and added vm's which you want to manage on there.

Please before you run script run in your Linux vm 

sudo apt-get update  and restart vm

Bellow configuration have been tested and run on Ubuntu 18.04.3 LTS

First

Install on your ansible node

ansible-galaxy install yohanb.azure_devops_agent

as default it will be installed in folder.

/home/userlinux/.ansible/roles/yohanb.azure_devops_agent

Please check if you have folder structure inside your ansible folder such as 

\Roles\basic\tasks\

Please copy file main.yml to the folder roles\basic\tasks\

additionaly copy copy playbook.yml to your ansible folder. 

I Please consider changing playbook.yml  within your subscription configuration in example like bellow.


https://dev.azure.com/powelcomponentregistry/_git/powelcomponentregistry?path=%2FAzureDevopsCI%2Fmain.yml&version=GBmaster

" 
---
-  hosts: all
   become: true
   roles:
    - basic
   vars:
    - az_devops_agent_role: build
    - az_devops_accountname: adka@powel.com
    - az_devops_accesstoken: hjnghm2cegr6bymo2trfcgxekcaw474xafjznnaps4ljzel4rptq
    - az_devops_agent_name: "{{ ansible_hostname }}"
    - az_devops_server_url: "https://dev.azure.com/powelanalytics"
    - az_devops_agent_pool_name: "Default"
    - az_devops_deployment_group_name: "Default"
    - az_devops_deployment_group_tags: null
    - az_devops_project_name: null
    - az_devops_agent_user: "az_devops_agent"
    - az_devops_agent_folder: "/home/{{ az_devops_agent_user }}/agent/"
    - az_devops_work_folder: "/home/{{ az_devops_agent_user }}/agent/_work"
    - az_devops_add_missing_folder: "/etc/systemd/system"
    - az_devops_add_missing_folder2: "/usr/lib/systemd/system"
    - az_devops_agent_version: 2.160.0
    - az_devops_agent_replace_existing: true
    - az_devops_agent_package_url: "https://vstsagentpackage.azureedge.net/agent/2.160.0/vsts-agent-linux-x64-2.160.0.tar.gz"
    - az_devops_accountname2: root


"
After saving file run it with

sudo ansible-playbook -K playbook.yml

Bellow you will find more info on the vars.

Variable settings

az_devops_accountname

The name of your Azure DevOps account, i.e. ttps://dev.azure.com/YOUR_ACCOUNT_NAME

az_devops_accesstoken

The Personal Access Token (PAT) used to authenticate to your account. See here for details on how to generate this value. 
https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-linux?view=azure-devops&viewFallbackFrom=vsts

Note: Think about using Ansible Vault to secure this value.

az_devops_project_name
__
The name of the Azure DevOps project in which to register the agent (only used for deployment groups).

az_devops_agent_version

Version of the installed agent package. Should be periodically updated to the latest version (see here)

az_devops_agent_user

Name of the user used to run and configure the service.

az_devops_agent_name

Name of the agent shown in Azure DevOps (defaults to the name of the host.).

az_devops_server_url

Url for your Azure DevOps account.

az_devops_agent_folder

Folder location for all the agent specific files (note: important that the service user needs execution permissions on all the files in this folder).

az_devops_work_folder

Folder location for all the work specific files (i.e. pulled source code and build results).

az_devops_agent_pool_name

Pool name in which the Azure DevOps agent is added.

az_devops_agent_role

Use either build or deployment. Build role allows the use of the agent as a build server in pipeline build or releases. Deployment role allows the use of the agent in a deployment group.

az_devops_deployment_group_tags

Use in conjuction with the deployment agent role. Allows the use of tags to identify the agent (ex: QA, Staging, Prod, etc.)

az_devops_deployment_group_name

Use in conjuction with the deployment agent role. The name of the deployment group in which to add the agent.

az_devops_agent_replace_existing

Adds the --replace argument to the configuration script for the scenario where you need to replace an exiting agent with a new host.