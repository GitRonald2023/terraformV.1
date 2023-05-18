
#Creacion de private key para la ssh
resource "tls_private_key" "privatekey" {
  algorithm = "RSA"
  rsa_bits = 4096
}
#Creacion de la llave ssh (publica y privada) y descargar en linux
resource "aws_key_pair" "sshkey" {
  key_name = var.key_pair_name
  public_key = tls_private_key.privatekey.public_key_openssh
  provisioner "local-exec" {
    command = nonsensitive ("echo '${tls_private_key.privatekey.private_key_pem}' >> ./${var.key_pair_name}.pem")
  }
}

#Creacion de la instacia EC2 "bastion" en subred publica 1a para gestion de plataforma a traves de la misma desde internet con ssh 
resource "aws_instance" "bastion" {
  ami                         = "ami-069aabeee6f53e7bf"
  instance_type               = "t2.micro"
  key_name                    = var.key_pair_name
  associate_public_ip_address = true
  availability_zone           = element(data.aws_availability_zones.available.*.id,0)
  subnet_id                   = element(aws_subnet.public_1a_bootcamp.*.id, 0)
  tenancy                     = "default"
  security_groups             = [aws_security_group.sec_group_public.id]
  tags = {
    "Name" = "Bastion"
    "Prod" = "Front"
  }
}

#Creacion de la instancia EC2 "back1-1a" en el back subred privada 1a para la APP
resource "aws_instance" "back1-1a" {
  count                       = length(var.cidr-publics) 
  ami                         = "ami-069aabeee6f53e7bf"
  instance_type               = "t2.micro"
  key_name                    = var.key_pair_name
  associate_public_ip_address = false
  availability_zone           = data.aws_availability_zones.available.names[count.index]
  subnet_id                   = element(aws_subnet.public_1a_bootcamp.*.id, 0)
  tenancy                     = "default"
  security_groups             = [aws_security_group.sg-private.id]
  tags = {
    "Name" = "Back${data.aws_availability_zones.available.names[count.index]}"
    "Prod" = "Back"
  }
}