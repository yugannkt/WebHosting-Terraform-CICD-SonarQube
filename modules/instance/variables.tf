variable "ami" {
  type        = string
  description = "AMI ID for the instance."
}

variable "instance_type" {
  type        = string
  description = "instance type."
}

variable "key_name" {
  type        = string
  description = "key"
}

variable "security_group_ids" {
  type        = list(string)
  description = "security group"
}

variable "user_data_file" {
  type        = string
  description = "Script file."
}

variable "user_data_vars" {
  type        = map(any)
  description = "The variables to pass to the user data template."
}

variable "name" {
  type        = string
  description = "name "
}

variable "root_volume_size" {
  type        = number
  description = "Volume."
}
