variable "sn-a-public" {
  type = any
}

variable "sn-b-public" {
  type = any
}

variable "sn-a-private" {
  type = any
}

variable "sn-b-private" {
  type = any
}

variable "port22-8080-sg" {
  type = any
}

variable "key-name" {
  description = "Key name for SSH into EC2"
  default = "bianca-tf"
}