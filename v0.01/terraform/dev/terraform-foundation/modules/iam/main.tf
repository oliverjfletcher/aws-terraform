/**
 * AWS Terraform Demo
 */
######################################################################
# Define IAM Role for replicating Terraform Backend on S3
######################################################################
resource "aws_iam_role" "replication" {
  name = var.iam_role_name_001

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}
######################################################################
# Define IAM Policy for replicating Terraform Backend on S3
######################################################################
resource "aws_iam_policy" "replication" {
  name   = var.iam_policy_name_001
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetReplicationConfiguration",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::${var.s3_bucket_name_001}"
      ]
    },
    {
      "Action": [
        "s3:GetObjectVersion",
        "s3:GetObjectVersionAcl"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::${var.s3_bucket_name_001}"
      ]
    },
    {
      "Action": [
        "s3:ReplicateObject",
        "s3:ReplicateDelete"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.s3_bucket_name_002}"
    }
  ]
}
POLICY
}
######################################################################
# Define IAM Policy attachment for replicating Terraform Backend on S3
######################################################################
resource "aws_iam_role_policy_attachment" "replication" {
  role       = aws_iam_role.replication.name
  policy_arn = aws_iam_policy.replication.arn
  depends_on = [
    aws_iam_role.replication,
    aws_iam_policy.replication
  ]
}

