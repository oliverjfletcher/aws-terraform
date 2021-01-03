/**
 * AWS Terraform Demo
 */
######################################################################
# Output Account ID which Terraform is authorized
######################################################################
data "aws_caller_identity" "current" {}
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
######################################################################
# Define KMS for encrypting VPC Flow logs CloudWatch Group
######################################################################
resource "aws_kms_key" "cloudwatch_key" {
  deletion_window_in_days = var.kms_deletion_window_in_days
  enable_key_rotation     = var.kms_enable_key_rotation
  tags                    = var.standard_tags
  description             = var.kms_description
  policy                  = <<POLICY
{
	"Version": "2012-10-17",
	"Id": "key-default-1",
	"Statement": [{
			"Sid": "Enable IAM User Permissions",
			"Effect": "Allow",
			"Principal": {
				"AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
			},
			"Action": [
				"kms:Create*",
				"kms:Describe*",
				"kms:Enable*",
				"kms:List*",
				"kms:Put*",
				"kms:Update*",
				"kms:Revoke*",
				"kms:Disable*",
				"kms:Get*",
				"kms:Delete*",
				"kms:ScheduleKeyDeletion",
				"kms:CancelKeyDeletion"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Principal": {
				"Service": "logs.${var.aws_region_001}.amazonaws.com"
			},
			"Action": [
				"kms:Encrypt*",
				"kms:Decrypt*",
				"kms:ReEncrypt*",
				"kms:GenerateDataKey*",
				"kms:Describe*"
			],
			"Resource": "*",
			"Condition": {
				"ArnLike": {
					"kms:EncryptionContext:aws:logs:arn": "arn:aws:logs:${var.aws_region_001}:${data.aws_caller_identity.current.account_id}:log-group:${var.cloudwatch_log_group_name}"
				}
			}
		}
	]
}
POLICY
}


