# Azure Terraform Demo Project
This project demonstrates key Terraform concepts for Azure infrastructure management using a structured approach. It provisions a complete environment with networking, storage, and compute resources.

## **Project Structure** 
```text
.
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── locals.tf
├── provider.tf
├── backend.tf
├── environments
│ ├── dev.tfvars
│ ├── prod.tfvars
│ └── staging.tfvars
└── modules
  ├── networking
  ├── storage
  └── compute
```
## **Prerequisites**
- Terraform v1.0.0 or newer
- Azure CLI installed and configured
- Azure subscription

## **Getting Started**
- Clone this repository
- Authenticate with Azure: `az login`
- Initialize Terraform: `terraform init`
- Create a workspace (optional): `terraform workspace new dev`
- Plan your infrastructure: `terraform plan -var-file=environments/dev.tfvars`
- Apply the configuration: `terraform apply -var-file=environments/dev.tfvars`
- Destroy when done: `terraform destroy -var-file=environments/dev.tfvars`

## **Terraform Commands Demonstrated**
- `terraform init`: Initialize working directory
- `terraform plan`: Preview changes
- `terraform apply`: Apply changes
- `terraform destroy`: Destroy infrastructure
- `terraform import`: Import existing resources
- `terraform state list`: List resources in state
- `terraform state show`: Show resource details
- `terraform validate`: Validate configuration
- `terraform fmt`: Format configuration files

## **State Management**
This project demonstrates state management using an Azure Storage account backend. For local development, you can use the local state file, but for team environments, the Azure backend provides state locking and collaboration features.

## **Workspaces**
The project supports multiple environments through Terraform workspaces. Use:
```bash
terraform workspace new dev|staging|prod
terraform workspace select dev|staging|prod
```

## **Variable Files**
Environment-specific variables are stored in the environments directory:
- `dev.tfvars`: Development environment
- `staging.tfvars`: Staging environment
- `prod.tfvars`: Production environment