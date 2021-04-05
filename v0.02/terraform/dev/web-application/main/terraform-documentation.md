# Usage

<!--- BEGIN_TF_DOCS --->
AWS Terraform Demo

## Requirements

No requirements.

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| auto_scaling | ../modules/auto-scaling |  |
| cloudwatch | ../modules/cloudwatch |  |
| elb | ../modules/elb |  |
| flow_log | ../modules/flow-log |  |
| iam | ../modules/iam |  |
| internet_gateway | ../modules/internet-gateway |  |
| kms | ../modules/kms |  |
| launch_configuration | ../modules/launch-configuration |  |
| nat_gateway | ../modules/nat-gateway |  |
| route_table | ../modules/route-table |  |
| security_group | ../modules/security-group |  |
| subnet | ../modules/subnet |  |
| vpc | ../modules/vpc |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_scaling\_adjustment | Auto Scaling scaling adjustment | `string` | n/a | yes |
| auto\_scaling\_adjustment\_type | Auto Scaling adjustment type | `string` | n/a | yes |
| auto\_scaling\_group\_force\_delete | Auto Scaling force delete | `string` | n/a | yes |
| auto\_scaling\_group\_health\_check\_grace | Auto Scaling check grace period | `string` | n/a | yes |
| auto\_scaling\_group\_health\_check\_type | Auto Scaling check type | `string` | n/a | yes |
| auto\_scaling\_group\_max\_size | Auto Scaling Max Size | `string` | n/a | yes |
| auto\_scaling\_group\_min\_size | Auto Scaling Min Size | `string` | n/a | yes |
| auto\_scaling\_group\_name | Auto Scaling Name | `string` | n/a | yes |
| auto\_scaling\_group\_termination\_policies | Auto Scaling termination policy | `string` | n/a | yes |
| auto\_scaling\_policy\_name | Auto Scaling policy name | `string` | n/a | yes |
| aws\_region\_001 | Definition of London AWS Region | `string` | n/a | yes |
| cloudwatch\_alarm\_comparison | CloudWatch Alarm comparison metric | `string` | n/a | yes |
| cloudwatch\_alarm\_name | CloudWatch Alarm name | `string` | n/a | yes |
| cloudwatch\_alarm\_period | CloudWatch Alarm period | `string` | n/a | yes |
| cloudwatch\_alarm\_statistic | CloudWatch Alarm statistic | `string` | n/a | yes |
| cloudwatch\_alarm\_threshold | CloudWatch Alarm threshold | `string` | n/a | yes |
| cloudwatch\_evaluation\_periods | CloudWatch Alarm evaluation period | `string` | n/a | yes |
| cloudwatch\_log\_group\_name | Cloudwatch Log Group Name | `string` | n/a | yes |
| cloudwatch\_log\_group\_retention | Cloudwatch Log Group Retention | `number` | n/a | yes |
| cloudwatch\_metric\_name | CloudWatch Alarm metric name | `string` | n/a | yes |
| cloudwatch\_namespace | CloudWatch Alarm namespace | `string` | n/a | yes |
| elb\_name | ELB Name | `string` | n/a | yes |
| elb\_target\_group\_name | ELB Target group name | `string` | n/a | yes |
| elb\_type | ELB type | `string` | n/a | yes |
| enable\_deletion\_protection | Enable deletion protection for ELB | `bool` | n/a | yes |
| enable\_dns\_hostnames | Enable DNS for hots in VPC | `bool` | n/a | yes |
| enable\_dns\_support | Enable DNS for VPC | `bool` | n/a | yes |
| flow\_logs\_name | VPC Flow Logs Name for Tag | `string` | n/a | yes |
| health\_check\_enabled | Health Check enable | `string` | n/a | yes |
| health\_check\_interval | Health Check Interval | `string` | n/a | yes |
| health\_check\_matcher | Health Check Matcher | `string` | n/a | yes |
| health\_check\_path | Health Check Path | `string` | n/a | yes |
| health\_check\_port | Health Check Port | `string` | n/a | yes |
| health\_check\_protocol | Health Check Protocol | `string` | n/a | yes |
| health\_check\_timeout | Health Check Timeout | `string` | n/a | yes |
| http\_protocol | HTTP Protocol | `string` | n/a | yes |
| iam\_flow\_logs\_assume\_role | VPC Flow Logs Assume IAM Role Name | `string` | n/a | yes |
| iam\_flow\_logs\_policy | VPC Flow Logs Assume IAM Policy Name | `string` | n/a | yes |
| internet\_cidr | Internet CIDR | `string` | n/a | yes |
| internet\_gateway\_name | Internet Gateway Name | `string` | n/a | yes |
| kms\_deletion\_window\_in\_days | Deletion time for key | `string` | n/a | yes |
| kms\_description | KMS key description | `string` | n/a | yes |
| kms\_enable\_key\_rotation | Enable KMS key rotation | `bool` | n/a | yes |
| launch\_configuration\_image\_id | Launch Configuration image ID | `string` | n/a | yes |
| launch\_configuration\_instance\_type | Launch Configuration instance type | `string` | n/a | yes |
| launch\_configuration\_key\_name | Launch Configuration key name | `string` | n/a | yes |
| launch\_configuration\_monitoring | Launch Configuration instance monitoring | `bool` | n/a | yes |
| launch\_configuration\_name | Launch Configuration Name | `string` | n/a | yes |
| launch\_configuration\_public\_ip\_address | Launch Configuration instance monitoring | `bool` | n/a | yes |
| map\_public\_ip\_on\_launch | Map public IP to instances on launch | `bool` | n/a | yes |
| nat\_gw\_name\_000 | NAT Gateway Name | `string` | n/a | yes |
| nat\_gw\_name\_001 | NAT Gateway Name | `string` | n/a | yes |
| port\_http | HTTP port | `number` | n/a | yes |
| port\_https | HTTPS port | `number` | n/a | yes |
| port\_ssh | SSH port | `number` | n/a | yes |
| service\_account\_role | arn for AWS IAM service account for Terraform | `string` | n/a | yes |
| sg\_description\_000 | Security group description | `string` | n/a | yes |
| sg\_description\_001 | Security group description | `string` | n/a | yes |
| sg\_description\_002 | Security group description | `string` | n/a | yes |
| sg\_egress | Security egress rule type | `string` | n/a | yes |
| sg\_ingress | Security ingress rule type | `string` | n/a | yes |
| sg\_name\_000 | Security Group name | `string` | n/a | yes |
| sg\_name\_001 | Security Group name | `string` | n/a | yes |
| sg\_name\_002 | Security Group name | `string` | n/a | yes |
| standard\_tags | Standards tags to be used for all AWS Resources | `map(any)` | n/a | yes |
| sts\_duration | Definition of AWS Security Token Service ID | `string` | n/a | yes |
| subnet\_prv\_0\_az | Subnet Availability Zone | `string` | n/a | yes |
| subnet\_prv\_0\_cidr | Subnet CIDR | `string` | n/a | yes |
| subnet\_prv\_0\_name | Subnet Name | `string` | n/a | yes |
| subnet\_prv\_1\_az | Subnet Availability Zone | `string` | n/a | yes |
| subnet\_prv\_1\_cidr | Subnet CIDR | `string` | n/a | yes |
| subnet\_prv\_1\_name | Subnet Name | `string` | n/a | yes |
| subnet\_prv\_2\_az | Subnet Availability Zone | `string` | n/a | yes |
| subnet\_prv\_2\_cidr | Subnet CIDR | `string` | n/a | yes |
| subnet\_prv\_2\_name | Subnet Name | `string` | n/a | yes |
| subnet\_pub\_0\_az | Subnet Availability Zone | `string` | n/a | yes |
| subnet\_pub\_0\_cidr | Subnet CIDR | `string` | n/a | yes |
| subnet\_pub\_0\_name | Subnet Name | `string` | n/a | yes |
| subnet\_pub\_1\_az | Subnet Availability Zone | `string` | n/a | yes |
| subnet\_pub\_1\_cidr | Subnet CIDR | `string` | n/a | yes |
| subnet\_pub\_1\_name | Subnet Name | `string` | n/a | yes |
| subnet\_pub\_2\_az | Subnet Availability Zone | `string` | n/a | yes |
| subnet\_pub\_2\_cidr | Subnet CIDR | `string` | n/a | yes |
| subnet\_pub\_2\_name | Subnet Name | `string` | n/a | yes |
| tcp\_protocol | TCP Protocol | `string` | n/a | yes |
| traffic\_type | Traffic to be captured by VPC Flow Logs | `string` | n/a | yes |
| vpc\_cidr | VPC CIDR | `string` | n/a | yes |
| vpc\_enabled | EIP VPC enabled | `bool` | n/a | yes |
| vpc\_name | VPC Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| auto\_scaling\_group\_name\_0 | n/a |
| auto\_scaling\_policy\_arn\_0 | n/a |
| cloudwatch\_log\_group\_arn | ARN for CloudWatch Log Group for VPC Flow Logs |
| elb\_target\_group\_arn | n/a |
| elb\_target\_group\_id | n/a |
| flow\_logs\_cloudwatch\_role | ARN for IAM Role for VPC Flow Logs |
| internet\_gateway\_id | Subnet ID |
| kms\_key\_arn | ARN for KMS Key for CloudWatch Log Group |
| launch\_configuration\_name | n/a |
| nat\_gw\_0\_id | n/a |
| nat\_gw\_1\_id | n/a |
| security\_group\_ec2\_id | n/a |
| security\_group\_elb\_id | n/a |
| subnet\_private\_0\_id | Subnet ID |
| subnet\_private\_1\_id | Subnet ID |
| subnet\_private\_2\_id | Subnet ID |
| subnet\_public\_0\_id | Subnet ID |
| subnet\_public\_1\_id | Subnet ID |
| subnet\_public\_2\_id | Subnet ID |
| vpc\_id | VPC ID |

<!--- END_TF_DOCS --->

