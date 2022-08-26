# Creating Security Groups

# Security Group to access by port 22 and 8080
resource "aws_security_group" "port22-8080-sg" {
  name = "port22-8080-sg"
  description = "Security Group to open ports 22 and 8080"
  vpc_id = data.aws_vpc.dvpc-terraform.id
  tags = {
    Name = "port22-8080-sg"
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"  
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

