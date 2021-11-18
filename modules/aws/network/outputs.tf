output "vpc-terraform-id" {
  value = aws_vpc.vpc-terraform.id
}

output "sn-a-public-id" {
  value = aws_subnet.sn-a-public.id
}

output "sn-b-public-id" {
  value = aws_subnet.sn-b-public.id
}

output "sn-a-private-id" {
  value = aws_subnet.sn-a-private.id
}

output "sn-b-private-id" {
  value = aws_subnet.sn-b-private.id
}