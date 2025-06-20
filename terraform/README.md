# User Portal Infrastructure

This folder hosts the  IaC to host the User portal in GCP. 

### Folder structure
* `modules` - Contains base modules for creating GCP resources
* `global` - This folder contains globl GCP resources (i.e. iam or Cloud DNS) 
* `asia-east1` - This folder contains base infrastructure resources that are deployed on the GCP asia-east1 region 




### How to run
To initialize and run terraform, please run: 
```bash
 cd ./global
 terraform init --backend-config backend/dev.tfvars --reconfigure
 terraform plan --var-file vars/dev.tfvars
```