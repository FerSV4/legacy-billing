variable "app_port" {
  default = 3000
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0c101f26f147fa7fd"
}

variable "iam_instance_profile" {
  default = "LabInstanceProfile"
}