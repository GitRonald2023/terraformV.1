#Creacion de subred privada en 1a
resource "aws_subnet" "private_1a_bootcamp" {
  count                   = length(var.cidr-privates) 
  vpc_id                  = aws_vpc.VPCBootCamp.id
  cidr_block              = var.cidr-privates[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = "SubnetPrivate${data.aws_availability_zones.available.names[count.index]}"
  }
}