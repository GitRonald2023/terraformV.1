#Creacion de grupo de seguridad publico
resource "aws_security_group" "sec_group_public" {
  name        = var.nombre-sg-public
  vpc_id      = aws_vpc.VPCBootCamp.id
  description = "grupo de seguridad sunredes publicas"
  tags = {
    "Name" = "${var.nombre-sg-public}"
  }
}

#Asignación de reglas para salida a internet
resource "aws_security_group_rule" "salida-internet" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sec_group_public.id
}

#Asignación de regla para ssh desde internet
resource "aws_security_group_rule" "entrada-internet-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sec_group_public.id
}

#Asignacion de regla para http desde internet
resource "aws_security_group_rule" "entrada-internet-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sec_group_public.id
}

#Asignacion de regla para ssm 
resource "aws_security_group_rule" "entrada-internet-ssm" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sec_group_public.id
}
