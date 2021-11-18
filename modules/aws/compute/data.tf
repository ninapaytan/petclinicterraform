data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_subnet" "dsn-a-public" {
  id = var.sn-a-public
}

data "aws_subnet" "dsn-b-public" {
  id = var.sn-b-public
}

data "aws_subnet" "dsn-a-private" {
  id = var.sn-a-private
}

data "aws_subnet" "dsn-b-private" {
  id = var.sn-b-private
}

data "aws_security_group" "dport22-8080-sg" {
  id = var.port22-8080-sg
}