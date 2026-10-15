resource "aws_instance" "devops_lab_ec2" {
  ami = var.ami
  region = var.region
  instance_type = var.instance_type
  key_name = var.key_name
  #will be in private subnet
  subnet_id = var.subnet_id
  
}