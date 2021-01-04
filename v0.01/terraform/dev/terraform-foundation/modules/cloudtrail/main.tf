/**
 * AWS Terraform Demo
 */
######################################################################
# Define Cloudtrail trail
######################################################################
resource "aws_cloudtrail" "master_cloudtrail" {
  name                          = var.cloudtrail_name
  s3_bucket_name                = var.s3_cloudtrail_id
  s3_key_prefix                 = var.s3_cloudtrail_prefix
  include_global_service_events = var.include_global_service_event
  enable_log_file_validation    = var.enable_log_file_validation
  enable_logging                = var.enable_logging
  is_multi_region_trail         = var.is_multi_region_trail
  is_organization_trail         = var.is_organization_trail
  kms_key_id                    = var.kms_key_arn_ct
  event_selector {
    read_write_type           = var.read_write_type
    include_management_events = var.include_management_events
    data_resource {
      type   = var.data_resource_type
      values = [var.data_resource_values]
    }
  }               
  tags = merge(
      {
        "name" = var.cloudtrail_name
      },
      var.standard_tags,
      )  
  depends_on = [
    var.s3_cloudtrail_id,
    var.s3_cloudtrail_bucket_policy_id,
    var.kms_key_arn_ct
  ]
}
