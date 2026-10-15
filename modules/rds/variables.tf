variable "db_name" {
  type = string
  description = "name of the database"
}
variable "db_username" {
  type = string
  description = "values of the username of the db"
}
variable "db_password" {
  type = string
  description = " password values of the db"
}
variable "db_subnet_group" {
  type = list()
  description = "subnet id which specific which vpc the rds to be created in"
}
variable "region" {
  type = string
  description = "this specify region in which rds to be created"
}
variable "instance_class" {
  type = string
  description = "this specify class of the rds"
}
variable "engine" {
  type = string
  description = "this specify rds engine type"
}
variable "engine_version" {
  type = string
  description = "this specify rds engine version"
}
variable "allocated_storage" {
  type = number
  description = "this specify the rds storage size"
}
variable "tag_name" {
  type = string
  description = "this give the rds a tag name inside aws console"
}
variable "parameter_group_name" {
  type = string
  description = "this specify the rds parameter group name"
}
