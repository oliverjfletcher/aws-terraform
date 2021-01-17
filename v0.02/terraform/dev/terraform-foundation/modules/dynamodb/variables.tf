/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for DynamoDB table
########################################################################
variable "dynamodb_table_name" {
  description = "DynamoDB table name"
  type        = string
}

variable "dynamodb_table_read_capacity" {
  description = "DynamoDB table read capacity"
  type        = number
}

variable "dynamodb_table_write_capacity" {
  description = "DynamoDB table write capacity"
  type        = number
}

variable "dynamodb_table_hash_key" {
  description = "DynamoDB hash key"
  type        = string
}

variable "attribute" {
  description = "DynamoDB table attributes"
  type        = list(object({ name = string, type = string }))
}