module "security_group" {
  source      = "./modules/security_group"
  name        = "son-jen-apache2-sec"
  description = "Allow TLS inbound traffic and all outbound traffic"
  ingress_ports = [22, 80, 443, 8080, 9000]
}

module "instance_sonar" {
  source             = "./modules/instance"
  ami                = "ami-0e86e20dae9224db8"
  instance_type      = "t2.medium"
  key_name           = "POC-Server"
  security_group_ids = [module.security_group.id]
  user_data_file     = "./sonar_install.sh"
  user_data_vars     = {}
  name               = "POC-sonar"
  root_volume_size   = 15
}

module "instance_jenkins" {
  source             = "./modules/instance"
  ami                = "ami-0e86e20dae9224db8"
  instance_type      = "t2.micro"
  key_name           = "POC-Server"
  security_group_ids = [module.security_group.id]
  user_data_file     = "./jenkins_install.sh"
  user_data_vars     = {}
  name               = "POC-jenkins"
  root_volume_size   = 14
}
