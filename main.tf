# main.tf

module "security_group" {
  source      = "./modules/security_group"
  name        = var.security_group_name
  description = var.security_group_description
  ingress_ports = var.security_group_ingress_ports
}

module "instance_sonar" {
  source             = "./modules/instance"
  ami                = var.ami_sonar
  instance_type      = var.instance_type_sonar
  key_name           = var.key_name
  security_group_ids = [module.security_group.id]
  user_data_file     = "./scripts/sonar_install.sh"
  user_data_vars     = {}
  name               = var.name_sonar
  root_volume_size   = var.root_volume_size_sonar
}

module "instance_jenkins" {
  source             = "./modules/instance"
  ami                = var.ami_jenkins
  instance_type      = var.instance_type_jenkins
  key_name           = var.key_name
  security_group_ids = [module.security_group.id]
  user_data_file     = "./scripts/jenkins_install.sh"
  user_data_vars     = {}
  name               = var.name_jenkins
  root_volume_size   = var.root_volume_size_jenkins
}
