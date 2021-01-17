/**
 * AWS Terraform Demo
 */
######################################################################
# Define AWS Terraform Provider, Credentials, Project and Region
######################################################################
provider "aws" {
  region = var.aws_region_001
}

provider "aws" {
  alias  = "west1"
  region = var.aws_region_001
}

provider "aws" {
  alias  = "west2"
  region = var.aws_region_002
}
######################################################################
# Define AWS Resources
######################################################################
module "s3_tfstate" {
  source                              = "../modules/s3/tfstate"
  standard_tags                       = var.standard_tags
  s3_bucket_name_001                  = var.s3_bucket_name_001
  s3_bucket_acl                       = var.s3_bucket_acl
  s3_bucket_versioning                = var.s3_bucket_versioning
  s3_bucket_lifecycle                 = var.s3_bucket_lifecycle
  s3_bucket_replication_rule_id       = var.s3_bucket_replication_rule_id
  s3_bucket_replication_rule_prefix   = var.s3_bucket_replication_rule_prefix
  s3_bucket_replication_status        = var.s3_bucket_replication_status
  s3_bucket_replication_storage_class = var.s3_bucket_replication_storage_class
  iam_role_replication_arn            = module.iam.iam_role_replication_arn
  s3_bucket_tfstate_arn               = module.s3_tfstate_replication.s3_tf_state_replication_arn
  kms_key_arn_tf                      = module.kms.kms_key_arn_tf
  sse_algorithm                       = var.sse_algorithm
}

module "s3_tfstate_replication" {
  source = "../modules/s3/tfstate-replication"
  providers = {
    aws = aws.west2
  }
  standard_tags        = var.standard_tags
  s3_bucket_name_002   = var.s3_bucket_name_002
  s3_bucket_acl        = var.s3_bucket_acl
  s3_bucket_versioning = var.s3_bucket_versioning
  s3_bucket_lifecycle  = var.s3_bucket_lifecycle
  kms_key_arn_tf       = module.kms.kms_key_arn_tf
  sse_algorithm        = var.sse_algorithm
}

module "s3_cloudtrail" {
  source               = "../modules/s3/cloudtrail"
  standard_tags        = var.standard_tags
  s3_bucket_name_003   = var.s3_bucket_name_003
  s3_bucket_acl        = var.s3_bucket_acl
  s3_bucket_versioning = var.s3_bucket_versioning
  s3_bucket_lifecycle  = var.s3_bucket_lifecycle
  kms_key_arn_ct       = module.kms.kms_key_arn_ct
  sse_algorithm        = var.sse_algorithm
}

module "dynamodb_table" {
  source                        = "../modules/dynamodb"
  dynamodb_table_name           = var.dynamodb_table_name
  dynamodb_table_read_capacity  = var.dynamodb_table_read_capacity
  dynamodb_table_write_capacity = var.dynamodb_table_write_capacity
  dynamodb_table_hash_key       = var.dynamodb_table_hash_key
  attribute                     = var.attribute
}

module "iam" {
  source              = "../modules/iam"
  iam_role_name_001   = var.iam_role_name_001
  iam_policy_name_001 = var.iam_policy_name_001
  s3_bucket_name_001  = var.s3_bucket_name_001
  s3_bucket_name_002  = var.s3_bucket_name_001
}

module "kms" {
  source                      = "../modules/kms"
  kms_deletion_window_in_days = var.kms_deletion_window_in_days
  kms_enable_key_rotation     = var.kms_enable_key_rotation
  standard_tags               = var.standard_tags
  kms_description_tf          = var.kms_description_tf
  kms_description_ct          = var.kms_description_ct
}

module "cloudtrail" {
  source                         = "../modules/cloudtrail"
  standard_tags                  = var.standard_tags
  cloudtrail_name                = var.cloudtrail_name
  s3_cloudtrail_id               = module.s3_cloudtrail.s3_cloudtrail_id
  s3_cloudtrail_bucket_policy_id = module.s3_cloudtrail.s3_cloudtrail_bucket_policy_id
  s3_cloudtrail_prefix           = var.s3_cloudtrail_prefix
  include_global_service_event   = var.include_global_service_event
  enable_log_file_validation     = var.enable_log_file_validation
  enable_logging                 = var.enable_logging
  is_multi_region_trail          = var.is_multi_region_trail
  is_organization_trail          = var.is_organization_trail
  kms_key_arn_ct                 = module.kms.kms_key_arn_ct
  read_write_type                = var.read_write_type
  include_management_events      = var.include_management_events
  data_resource_type             = var.data_resource_type
  data_resource_values           = var.data_resource_values
}

######################################################################
# Define Outputs from Modules to be used
######################################################################
output "iam_role_replication_arn" {
  value       = module.iam.iam_role_replication_arn
  description = "ARN for IAM Role for S3 replication "
}

output "s3_tf_state_replication_arn" {
  value       = module.s3_tfstate_replication.s3_tf_state_replication_arn
  description = "ARN for IAM Role for S3 replication"
}

output "s3_cloudtrail_id" {
  value       = module.s3_cloudtrail.s3_cloudtrail_id
  description = "ARN for Cloudtrail trail S3 Bucket"
}

output "s3_cloudtrail_bucket_policy_id" {
  value       = module.s3_cloudtrail.s3_cloudtrail_bucket_policy_id
  description = "ARN for Cloudtrail trail S3 Bucket Policy"
}

output "kms_key_arn_tf" {
  value       = module.kms.kms_key_arn_tf
  description = "ARN for KMS Key for S3 for Terraform State"
}

output "kms_key_arn_ct" {
  value       = module.kms.kms_key_arn_ct
  description = "ARN for KMS Key for S3 for CloudTrail"
}


