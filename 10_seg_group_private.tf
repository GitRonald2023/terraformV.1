#Creacion del grupo de seguridad privado con reglas de ingreso y salida 
resource "aws_security_group" "sg-private" {
  name        = var.nombre-sg-private
  vpc_id      = aws_vpc.VPCBootCamp.id
  description = "sg para base de datos y aplicacion web"
  ingress {
    description = "ingreso de conexiones ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "${var.nombre-sg-private}"
  }
}
#Creacion de reglas para el grupo de seguridad privado para la APP en puerto 5000
resource "aws_security_group_rule" "sg-private-aplicacion" {
  type              = "ingress"
  from_port         = 5000
  to_port           = 5000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-private.id
}
#Creacion de regla para el grupo de seguridad privado para la BD MySql en puerto 3306
resource "aws_security_group_rule" "sg-private-base-datos" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-private.id
}

#Creacion de regla para el grupo de seguridad para uso de conexiones SSM
resource "aws_security_group_rule" "sg-private-ssm" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-private.id
}