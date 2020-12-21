# Clone the repo
git clone git@github.com:gsoft-inc/ansible-role-eventstore-example.git
# Go to the folder containing this example
cd ./ansible-role-eventstore-example/cluster-terraform-azure


# From the root of the repo, go to the Terraform folder
cd ./terraform
# Login to your Azure account (make sure to check your subscription)
az login
# Initialize Terraform modules
terraform init
# Provision the infrastructure
terraform apply