variable "ami" {
  type        = string
  description = "AMI ID for the instance."
}

variable "instance_type" {
  type        = string
  description = "Instance type."
}

variable "key_name" {
  type        = string
  description = "Key pair name."
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs."
}

variable "user_data_file" {
  type        = string
  description = "Script file for user data."
}

variable "user_data_vars" {
  type        = map(any)
  description = "The variables to pass to the user data template."
}

variable "name" {
  type        = string
  description = "Name of the instance."
}

variable "root_volume_size" {
  type        = number
  description = "Size of the root volume."
}
