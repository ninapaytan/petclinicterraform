# Web Server
resource "aws_instance" "ws-petclinic" {
  ami= data.aws_ami.amazon-linux-2.id
  subnet_id = data.aws_subnet.dsn-a-public.id
  instance_type = "t2.micro"
  key_name = var.key-name
  user_data = file("../../modules/aws/compute/petclinic-web.sh")
  vpc_security_group_ids = [var.port22-8080-sg-id]
  tags = {
    Name = "ws-petclinic"
  }
}