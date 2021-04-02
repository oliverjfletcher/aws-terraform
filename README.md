# Infrastructure as Code

Collection of Terraform templates defined with the [AWS Terraform provider](https://github.com/terraform-providers/terraform-provider-aws), below outlines the versions used for each service. Templates define the required Amazon Web Services services to deploy the **Development** and **Production** environment for the below services. 

**Change Log**

|**Version**     |**Changes**             				    |
|----------------|------------------------------------------|
|v0.01           |Initial commit with baseline requirements |
|v0.02           |Update of KMS and S3 Bucket Policy to enable encryption of CloudTrail logs, and GitHub Action workflow testing |


**Service Provider Versions**

|**Service**                 |**Version**              |
|------------------------|----------------------------------------------------------------------------|
|**Terraform Foundation**           |[3.22.0](https://github.com/hashicorp/terraform-provider-aws/releases/tag/v3.22.0)   |
|**Web Application**           |[3.22.0](https://github.com/hashicorp/terraform-provider-aws/releases/tag/v3.22.0)   |


Detailed designs of each of the services can be found in their respective solution designs.

**Clone the repository:**

```
git clone https://github.com/oliverjfletcher/aws-terraform.git
cd /{version}/terraform/{environment}/{service}
```

## Table of Contents

1. [aws-services](#aws-services)
1. [terraform-resources](#terraform-resources)
1. [terraform-service-accounts](#terraform-service-accounts)
1. [terraform-taxonomy](#terraform-taxonomy)
1. [terraform-operations](#terraform-operations)

### aws-services

Below outlines the Amazon Web Services services that were used to implement each of the required services for the AWS Terraform Demo.

##### Terraform Foundation

- [CloudTrail](https://docs.aws.amazon.com/cloudtrail/index.html)
- [DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html)
- [IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)
- [Key Management Service](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html)
- [S3](https://docs.aws.amazon.com/AmazonS3/latest/dev/Welcome.html)

##### Web Application

- [Virtual Private Cloud](https://docs.aws.amazon.com/vpc/index.html)
- [Virtual Private Cloud Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html)
- [Route Table](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)
- [Internet Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)
- [NAT Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)
- [Security Groups](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)
- [ELB](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
- [EC2](https://docs.aws.amazon.com/ec2/index.html)
- [Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
- [CloudWatch](https://aws.amazon.com/cloudwatch/getting-started/)
- [Key Management Service](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html)
- [IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)

<br>

### terraform-resources

Below outlines the Terraform resources that were used to implement each of the required services for the AWS Demo.

##### Terraform Foundation

- [CloudTrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail)
- [DynamoDB](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table)
- [IAM](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)
- [Key Management Service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key)
- [S3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)

##### Web Application

- [Virtual Private Cloud](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
- [Virtual Private Cloud Subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)
- [Route Table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)
- [Internet Gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)
- [NAT Gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)
- [Security Groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
- [ELB](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb)
- [EC2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
- [Auto Scaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group)
- [CloudWatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group)
- [IAM](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)
- [Key Management Service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key)

### terraform-service-account

As Terraform will require access to the AWS Organization, a [IAM User](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users.html) has been provisioned to act as a service account for the provisioning of the Terraform resources. The service account will be created in the Terraform Foundation AWS account and will be assigned the sts:AssumeRole action to enable the service account to provision services in the Web Application AWS account. 

<br>

**Table 1.** *Terraform Service Account*

|**Service Account Name** |**Service**          |**Environment**        |**Account**            |
|-------------------------|---------------------|-----------------------|-----------------------|
|terraform                |Terraform Foundation |Development            |NULL                   |
|terraform                |Web Application      |Development            |NULL                   |

<br>

### terraform-taxonomy

Below outlines the Terraform taxonomy and how environments, services and resources folders have been structured. As shown below, each environment has been separated into it's own folder to enable independent management and state of each environment. Further to this each service that will be deployed will be segregated into it's own folder so that state and configuration can be managed separately. There are instances, where services will also be further segregated into sub-services.The main folder will house the main.tf, variables.tf and the tfvars file for resource and environment variables. The main folder will also house a files folder for the use of storing files for Lambda to be copied into each environment.

**Terraform Taxonomy: File System Tree**
```
.    
├── env
│   ├── service
│   │   └── sub-service
│   │       ├── main
│   │       │   │
│   │       │   ├── files
│   │       │   ├── main.tf
│   │       │   ├── outputs.tf
│   │       │   ├── dev.tfvars
│   │       │   └── variables.tf
│   │       └── modules
│   │           │
│   │           ├── service
│   │           └── service
│   ├── service
│   │   ├── main
│   │   │   ├── files
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── dev.tfvars
│   │   │   └── variables.tf
│   │   │
│   │   └── modules
│   │       ├── service
│   │       └── service

```
<br>

### terraform-operations

**Terraform Variables:** [tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files) files have been defined to make configuration changes to AWS resources effectively without having to changes to multiple variables throughout templates. Each tfvars file is defined within the main folder within the service folder. Global variables will also be defined within the variables.tf file in the main folder. The Global variables file is used to define variables that are standard values across the environment or service, and by definition should not require regular or any change at all, such as; project, location etc.

**Terraform CI/CD:** [GitHub Actions](https://learn.hashicorp.com/tutorials/terraform/github-actions?in=terraform/automation) has been configured with the Terraform templates to enable GitOps for the services that have been defined for the Terraform templates. To enable this, Terraform Cloud has been configured with a Workspace to to manage the services to be defined for each of the Production and Development environments. The below outlines the Environment Variables that have been added for each of the Workspaces, which enables secure storing of the required credentials for the Terraform Service Account (IAM User). Further to this, to enable Github Actions to interface with the AWS API, keys for AWS have been created. Both the key ID and access key secret has been added into the GitHub secrets store.

**Table 2.** *GitHub Secrets*

|**Name**         |**Value** |
|-----------------|----------|            
|AWS_ACCESS_KEY_ID|NULL      |
|AWS_SECRET_ACCESS_KEY|NULL  |
|AWS_ACCESS_KEY_ID|NULL      |
|AWS_SECRET_ACCESS_KEY|NULL  |

<br>

**Terraform State:** Terraform [State](https://www.terraform.io/docs/state/index.html) for the web application solution has been configured to be stored within Amazon Web Service S3 buckets. The below table outlines the applicable bucket where the Terraform state is stored. The service account has also been provided s3 bucket read and write permission do it can manage the state file stored in the below buckets. The Terraform state has also been replicated between regions to ensure availability.

**Table 2.** *Terraform State S3 Buckets*

|**Bucket Name**  |**Service**     |**Environment** |**URL**           |**Region**        |
|-----------------|----------------|----------------|------------------|------------------|           
|useds3b000       |Web Application |Dev             |[useds3b000](https://s3.console.aws.amazon.com/s3/buckets/useds3b000)| us-west-1 
|useds3b001 |Web Application |Dev |[useds3b001](https://s3.console.aws.amazon.com/s3/buckets/useds3b001)| us-west-2


<br>