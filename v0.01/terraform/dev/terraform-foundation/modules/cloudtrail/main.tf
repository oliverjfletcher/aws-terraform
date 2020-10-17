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
  tags = merge(
      {
        "name" = var.cloudtrail_name
      },
      var.standard_tags,
      )  
  depends_on = [
    var.s3_cloudtrail_id
  ]
}
