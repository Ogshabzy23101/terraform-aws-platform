output "vpc_id" {
  value = aws_vpc.devop_lab_vpc.id
}
output "pri_subnet_id" {
  value = values(aws_subnet.devop_lab_pri_subnet)[*].id
}