resource "aws_security_group" "this" {
  name        = var.name
  description = var.description

  ingress = [
    for port in var.ingress_ports : {
      description     = "Inbound rules"
      from_port       = port
      to_port         = port
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  ]

  egress = [
    {
      description     = "Outbound rules"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Name = var.name
  }
}
