ami_sonar          = "ami-0e86e20dae9224db8"
instance_type_sonar = "t2.medium"
name_sonar         = "SonarQube-Server"
root_volume_size_sonar = 15

ami_jenkins        = "ami-0e86e20dae9224db8"
instance_type_jenkins = "t2.micro"
name_jenkins       = "Jenkins-Server"
root_volume_size_jenkins = 14

key_name           = "POC-Server"

security_group_name        = "son-jen-apache2-sec"
security_group_description = "Allow inbound traffic"
security_group_ingress_ports = [22, 80, 443, 8080, 9000]
