#Variables de conexion a cuenta AWS
variable "AWS_REGION" {}
variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}

#Variables para el internet gateway
variable "nombre-igw" {
  description = "Tag Name para el internet gateway"
  type        = string
}
#Variables para la VPC
variable "cidr-vpc" {
  description = "CIDR para la VPC"
  type        = string
}
#Variables de bloque de direcciones IP para la subnet publica 1a
variable "cidr-publics" {
  description = "bloque de direcciones publicas"
  type        = list(string)
  default     = ["193.168.1.0/24","193.168.2.0/24"]
}
#Variable para el nombre del el grupo de seguridad publico
variable "nombre-sg-public" {
  description = "nombre grupo de seguridad publico"
  type        = string
}
#Variable para el grupo de seguridad privado
variable "nombre-sg-private" {
  description = "nombre grupo seguridad privada"
  type        = string
}
#Variable para la bloque de direcciones ip de la subred privada 1a
variable "cidr-privates" {
  description = "bloque de direcciones subred privada 1a"
  type        = list(string)
  default     = ["193.168.8.0/24","193.168.9.0/24"]
}
#variable de nombre de llave ssh
variable "key_pair_name" {
  type = string
  default = "proyfinkey"
}
#variable para llave publica de la ssh
variable "pulic_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD3BVBp88VgmeWU0ERBBP0C0wIvC9iaFuvOrwwU01EF13e2wjT7XQ8aIvj3CvvVXvoFK5rbms+i2Ky6F0okAS/M+il2PJgKfSUZuKiLUgr652NTADyBTxmDiMCVg/ytT/oBWxW8EF0Iu8cHkjxr1a+gIxQAZV3AgAsCVhs7gYdT5n28gZncYdCfuUp2+dAe9QvJ6RkBSy/ObaC7WrnXI/ld6BsZNJeLVpOzPjbgbRgmMOXKX87vERdi0vQ64QW7DnE/AjhR4SZ8GWxsty8sJvcuvzX2QOA5TUFtteuFE0rqFjXXCwzuysveXYwHqphs0d6LneHkRDj23ChGKaha8pLvharjq8DUtlVZ3UCBRbsT4/joeM/S71LANkhnatqTsIISP+Sg8MCt21oABvQLAcTV0j/OuDH3h+iPavkm5/EbhbZHDqavW54C4RhreKGBNjWifz1X0HByHg+z/niiEOTAfYfB0X9jqmx9r1a+iOoiPc4NBOVBWxBzq718G6xt1rEXwfmOQol0LI+mVGRBmMLgPGBvniXQv04rQqhQmRvkXHDj8nlXhNoaoXMR0pzvFuxRq/AZnCbaDRRWbEbmUREWLNFB+ZPa0qSMIBH1u8+3p3TxOumnQWw3TxRtSVfTwIPuxjFNyjCe4SyEh90aEK5P/IAPhe9x+O435Z+Es9331Q== preeti@LAPTOP-AT9G4G0G" 
}
#variables para el nombre del bucket S3 de logs del balanceador de aplicaciones
variable "bucket-logs-alb" {
  description = "bucket para los logs del balanceador de carga de aplicaciones"
  type        = string
}
#Variable para el nombre del balanceador de aplicaciones
variable "lba-app-bootcamp" {
  description = "nombre del balanceador de carga para la app"
  type        = string
}
#Variable para el nombre de la base de datos
variable "nombre-bd-mysql" {
  description = "nombre de la base de datos para la app"
  type        = string
}
#Variable para el usuario de la base de datos
variable "username-bd" {
  description = "Usuario para la BD MySQL"
  type        = string
}
#Variable para el parrword de la base de datos
variable "password-bd" {
  description = "password del usuario de la BD"
  type        = string
}
#Variable para el token del EFS para la persistencia de la información de las instancias EC2
variable "efs-token-name" {
  description = "token para el EFS de las instancias"
  type        = string
}