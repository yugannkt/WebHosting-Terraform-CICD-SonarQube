variable "ami_sonar" {
  type        = string
  description = "AMI ID for the SonarQube instance."
}

variable "instance_type_sonar" {
  type        = string
  description = "Instance type for SonarQube."
}

variable "ami_jenkins" {
  type        = string
  description = "AMI ID for the Jenkins instance."
}

variable "instance_type_jenkins" {
  type        = string
  description = "Instance type for Jenkins."
}

variable "key_name" {
  type        = string
  description = "Key pair name."
}

variable "name_sonar" {
  type        = string
  description = "Name of the SonarQube instance."
}

variable "name_jenkins" {
  type        = string
  description = "Name of the Jenkins instance."
}

variable "root_volume_size_sonar" {
  type        = number
  description = "Root volume size for SonarQube."
}

variable "root_volume_size_jenkins" {
  type        = number
  description = "Root volume size for Jenkins."
}

variable "security_group_name" {
  type        = string
  description = "Name of the security group."
}

variable "security_group_description" {
  type        = string
  description = "Description of the security group."
}

variable "security_group_ingress_ports" {
  type        = list(number)
  description = "List of ports to allow inbound traffic."
}
