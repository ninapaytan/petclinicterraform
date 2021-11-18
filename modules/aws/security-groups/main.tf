# Creating Security Groups

# Security Group to access by port 22 and 80
resource "aws_security_group" "port22-80-sg" {
  name = "port22-80-sg"
  description = "Security Group to open ports 22 and 80"
  vpc_id = data.aws_vpc.dvpc-terraform.id
  tags = {
    Name = "port22-80-sg"
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
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