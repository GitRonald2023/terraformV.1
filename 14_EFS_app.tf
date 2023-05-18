#Creacion de la EFS para almacenamiento persistente de las instancias back1-1a y back2-1b

resource "aws_efs_file_system" "efs-app" {
  creation_token   = var.efs-token-name
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = "true"
  tags = {
    Name = "${var.efs-token-name}"
    Prod = "Back"
  }
}

#Asignacion de la subred privada y grupo de seguridad para el EFS creado anteriormente
resource "aws_efs_mount_target" "efs-mount" {
  file_system_id  = aws_efs_file_system.efs-app.id
  subnet_id       = element(aws_subnet.private_1a_bootcamp.*.id,0)
  security_groups = ["${aws_security_group.sg-private.id}"]
}