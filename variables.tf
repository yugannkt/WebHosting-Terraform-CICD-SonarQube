# variables.tf

variable "ami_sonar" {
  type        = string
  description = "AMI ID for the SonarQube instance."
  default     = "ami-0e86e20dae9224db8"
}

variable "instance_type_sonar" {
  type        = string
  description = "Instance type for SonarQube."
  default     = "t2.medium"
}

variable "ami_jenkins" {
  type        = string
  description = "AMI ID for the Jenkins instance."
  default     = "ami-0e86e20dae9224db8"
}

variable "instance_type_jenkins" {
  type        = string
  description = "Instance type for Jenkins."
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Key pair name."
  default     = "POC-Server"
}

variable "name_sonar" {
  type        = string
  description = "Name of the SonarQube instance."
  default     = "SonarQube-Server"
}

variable "name_jenkins" {
  type        = string
  description = "Name of the Jenkins instance."
  default     = "Jenkins-Server"
}

variable "root_volume_size_sonar" {
  type        = number
  description = "Root volume size for SonarQube."
  default     = 15
}

variable "root_volume_size_jenkins" {
  type        = number
  description = "Root volume size for Jenkins."
  default     = 14
}

variable "security_group_name" {
  type        = string
  description = "Name of the security group."
  default     = "son-jen-apache2-sec"
}

variable "security_group_description" {
  type        = string
  description = "Description of the security group."
  default     = "Allow inbound traffic"
}

variable "security_group_ingress_ports" {
  type        = list(number)
  description = "List of ports to allow inbound traffic."
  default     = [22, 80, 443, 8080, 9000]
}
