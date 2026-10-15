variable "vpc_cidr" {
  description = "name of vpc"
  type = string
  default = "10.0.0.0/16"
}
variable "region" {
  type = string
  description = "region of the vpc"
  default = "eu-west-2"
}

variable "private_subnet" {
  type = object({
    "terraTut_pri_subnet_1" = {
      azs = "eu-west-2a"
      cidr = "10.0.1.0/24"
    }
    "terraTut_pri_subnet_2" = {
      azs = "eu-west-2b"
      cidr = "10.0.2.0/24"
    }
  })
}
variable "public_subnet" {
  type = object({
    "terraTut_pub_subnet_1" = {
      azs = "eu-west-2a"
      cidr = "10.0.11.0/24"
    }
    "terraTut_pub_subnet_2" = {
      azs = "eu-west-2b"
      cidr = "10.0.12.0/24"
    }
  })
}