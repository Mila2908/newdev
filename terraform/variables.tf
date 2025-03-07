variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  sensitive   = true
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-xxxxxxxxxxxxxxxxx" # Replace with your AMI
}
