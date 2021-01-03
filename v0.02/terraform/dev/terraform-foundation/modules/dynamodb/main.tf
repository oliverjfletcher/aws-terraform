/**
 * AWS Terraform Demo
 */
######################################################################
# Define DynamoDB Table for Terraform State Locking
######################################################################
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = var.dynamodb_table_name
  read_capacity  = var.dynamodb_table_read_capacity
  write_capacity = var.dynamodb_table_write_capacity
  hash_key       = var.dynamodb_table_hash_key

  dynamic "attribute" {
    for_each = var.attribute
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
}
