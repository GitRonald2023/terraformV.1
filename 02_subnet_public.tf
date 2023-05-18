#consulta de zonas de disponibilidad de la region
data "aws_availability_zones" "available" {}

#Creacion Subred publica en AZ 1a
resource "aws_subnet" "public_1a_bootcamp" {
  count                   = length(var.cidr-publics)
  vpc_id                  = aws_vpc.VPCBootCamp.id
  cidr_block              = var.cidr-publics[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "SubnetPublic${data.aws_availability_zones.available.names[count.index]}"
  }
}
