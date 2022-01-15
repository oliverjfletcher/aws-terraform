/**
 * AWS Terraform Demo
 */
######################################################################################################
# Define values for variables to be used for Amazon Web Services Region and Credentials
######################################################################################################
aws_region_001 = "us-west-2"
aws_region_002 = "us-west-1"
sts_duration   = "120"
#######################################################################################################
# Define values for tags for Amazon Web Services Resources
#######################################################################################################
standard_tags = {
  department  = "engineering"
  contact     = "oliverjamesfletcher@protonmail.com"
  environment = "development"
}
#######################################################################################################
# Define values for variables to be used for S3 Bucket for Terraform State
#######################################################################################################
s3_bucket_name_001                  = "useds3b000"
s3_bucket_name_002                  = "useds3b001"
s3_bucket_name_003                  = "useds3b002"
s3_bucket_acl                       = "private"
s3_bucket_versioning                = "true"
s3_bucket_lifecycle                 = "true"
s3_mfa_delete                       = "true"
s3_bucket_replication_rule_id       = "terraform"
s3_bucket_replication_rule_prefix   = "dev"
s3_bucket_replication_status        = "Enabled"
s3_bucket_replication_storage_class = "STANDARD"
#######################################################################################################
# Define values for variables to be used for IAM for Terraform State S3 Replication
#######################################################################################################
iam_role_name_001   = "terraform-replication-role"
iam_policy_name_001 = "terraform-replication-policy"
#######################################################################################################
# Define values for variables to be used for KMS keys
#######################################################################################################
kms_deletion_window_in_days = "14"
kms_enable_key_rotation     = "true"
kms_description_tf          = "terraform state s3 bucket kms key"
kms_description_ct          = "terraform state cloudtrail kms key"
sse_algorithm               = "aws:kms"
#######################################################################################################
# Define values for variables to be used for KMS keys
#######################################################################################################
cloudtrail_name              = "master-trail"
s3_cloudtrail_prefix         = "cloudtrail"
include_global_service_event = "true"
enable_log_file_validation   = "true"
enable_logging               = "true"
is_multi_region_trail        = "true"
is_organization_trail        = "true"
read_write_type              = "All"
include_management_events    = "true"
data_resource_type           = "AWS::S3::Object"
data_resource_values         = "arn:aws:s3:::"
#######################################################################################################
# Define values for variables to be used for DynamoDB Table
#######################################################################################################
dynamodb_table_name           = "terraform-state"
dynamodb_table_read_capacity  = "1"
dynamodb_table_write_capacity = "1"
dynamodb_table_hash_key       = "LockID"
attribute = [{
  name = "LockID"
  type = "S"
}]