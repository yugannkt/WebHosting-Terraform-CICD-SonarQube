variable "name" {
  type        = string
  description = "The name of the security group."
}

variable "description" {
  type        = string
  description = "The description of the security group."
}

variable "ingress_ports" {
  type        = list(number)
  description = "List of ports to allow inbound traffic."
}
