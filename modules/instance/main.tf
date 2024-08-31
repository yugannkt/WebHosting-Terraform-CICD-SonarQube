resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids
  user_data              = templatefile(var.user_data_file, var.user_data_vars)

  tags = {
    Name = var.name
  }

  root_block_device {
    volume_size = var.root_volume_size
  }
}
