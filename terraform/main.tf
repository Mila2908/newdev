terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "${file("../index.html")}" > /var/www/html/index.html
              EOF

  tags = {
    Name = "web-instance"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
