# Terraform linode infrastructure readme
Here are the terraform files needed to build the mbaza-product infrastructure on linodes
## Folder structure
.
├── modules                     # 
│   ├── infrastructure          # Contains the configuration of the infrastructure server
│   │   ├── maint.tf            # File where the image is created
│   │   ├── output.tf           # Stores the IP and node id as outputs
│   │   ├── providers.tf        # Define the cloud provider
│   │   ├── security.tf         # Firewall configuration
│   │   ├── dns.tf              # DNS configuration (in progres)
│   │   └── variables.tf        # Default values of the infrastructure variables
├── profiles                    # 
│   └── template.tfvars         # Variables templates used to buidl the infrastructure
├── main.tf                     # file to call the modules
├── providers.tf                # Define the cloud provider
├── dns-main.tf                 # DNS main domain configuration (in progress)
└── variables.tf                # Stores the template of variables

## Main terraform command
To initialise the ressources
```
terraform init
```
To deploy the ressources
```
terraform apply -var-file="./profiles/template.tfvars"
```
To destroy all resources
```
terraform taint
```

## To DO
* Finish the dns configuration
* Separate the volumes with the image
* Github runner configuration
* Use bucket to store terraform configuration
* Use the pipeline to build the terraform files