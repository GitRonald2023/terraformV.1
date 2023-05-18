#Salida para informar la creacion de la VPC
output "informacion-vpc" {
  value = ["VPC Id = ${aws_vpc.VPCBootCamp.id}",
  "Nombre VPC = ${aws_vpc.VPCBootCamp.tags.Name}"]
}
#Salida para informar la creacion del internet gateway
output "Informacion-Internet-Gateway" {
  value = ["IGW ID = ${aws_internet_gateway.internet-gateway-vpcbootcamp.id}",
  "Asociado a VPC = ${aws_internet_gateway.internet-gateway-vpcbootcamp.tags.Name}"]
}
#Salida para informar la creacion de las subnets publicas en AZ 1a y 1b
output "informacion-publics" {
  value = aws_subnet.public_1a_bootcamp.*.id
}
#Salida para informar la creacion de la tabla de ruta publica 
output "informacion-tabla-ruta-publica" {
  value = ["VPC de la Ruta Tabla Publica = ${aws_vpc.VPCBootCamp.tags.Name}",
  "Nombre de la Tabla de Rutas Publicas = ${aws_route_table.public_route.tags.Name}"]
}
#Salida para informar la creacion de los grupos de seguridad publicos y privados 
output "grupos-seguridad" {
  value = ["ID Grupo seguridad publico: ${aws_security_group.sec_group_public.id}",
  "ID Grupo de seuridad privado: ${aws_security_group.sg-private.id}"]
}
#Salida para informar la creacion de la red privada en 1a
output "subnet-privada-1a" {
  value = aws_subnet.private_1a_bootcamp.*.id
}
#Salida para informar la creacion del NAT Gateway para alcanzar internet de los equipos en subred privadas
output "nat-gw-bootcamp" {
  value = ["ID gateway subnet 1a: ${aws_nat_gateway.nat-gw-bootcamp.id}",
  "Nombre de nat gw: ${aws_nat_gateway.nat-gw-bootcamp.tags.Name}"]
}
#Salida para informar la creacion de la tabla de ruta privada
output "rt-private" {
  value = ["ID rt private: ${aws_route_table.rt-private.id}",
  "Nombre rt privada: ${aws_route_table.rt-private.tags.Name}"]
}
#Salida para informar la creacion de la llave SSH
output "llave-ssh" {
  value = ["ID de la llave creada para ec2: ${aws_key_pair.sshkey.id}"]
}
#Salida para informar la creacion de la instancia bastion 
output "ec2-bastion" {
  value = ["ID bastion creado: ${aws_instance.bastion.id}",
  "Nombre del Bastion: ${aws_instance.bastion.tags.Name}"]
}
#Salida para informar la creacion de la instancia back1-1a
output "ec2-back1" {
  value = aws_instance.back1-1a.*.id
}
#Salida para informar la creación del bucket S3 para los logs del balanceador de carga de aplicaciones
output "bucket-creado-lba" {
  value = ["ID del bucket para los logs del loadbalancer: ${aws_s3_bucket.alb-logs.id}",
  "Nombre del bucket: ${var.bucket-logs-alb}"]
}
#Salidad para informar la creacion del balanceador
output "lba-app" {
  value = ["ID del lba para la app: ${aws_lb.alb-app-bootcamp.id}",
  "Nombre del Balancedor de carga de aplicaciones: ${aws_lb.alb-app-bootcamp.tags.Name}"]
}
#Salida para informa la creacion de la instancia y BD MySQL de la app
output "mysql-db-app" {
  value = ["ID de la BD para la app: ${aws_db_instance.myinstance.id}",
  "EL nombre de la BD es: ${aws_db_instance.myinstance.db_name}"]
}
#Salida para informar la creación del EFS persistente para las instancias
output "efs-app" {
  value = ["ID del EFS para los equipos de la app: ${aws_efs_file_system.efs-app.id}",
  "EFS creado: ${aws_efs_file_system.efs-app.creation_token}"]
}
