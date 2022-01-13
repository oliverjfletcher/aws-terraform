/**
 * AWS Terraform Demo
 */
######################################################################
# Define Launch Configuration
######################################################################
resource "aws_launch_configuration" "launch_configuration" {
  name              = var.launch_configuration_name
  image_id          = var.launch_configuration_image_id
  instance_type     = var.launch_configuration_instance_type
  key_name          = var.launch_configuration_key_name
  security_groups   = [var.security_group_ec2_id]
  user_data         = local.launch_configuration_user_data
  enable_monitoring = var.launch_configuration_monitoring
}

locals {
  launch_configuration_user_data = <<EOF
    #!/bin/bash
    sudo yum -y update
    sudo yum -y install httpd
    sudo chkconfig httpd on
    sudo service httpd start
    ec2hostname=$(hostname)
    sudo echo -e '<!DOCTYPE html>\n<html>\n<body>\n\n<h1>Hello World from '$ec2hostname'</h1>\n\n</body>\n</html>' | sudo tee /var/www/html/index.html
    sudo service httpd restart
  EOF
}