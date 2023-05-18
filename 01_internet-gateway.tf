#Creacion Gateway de internet para subredes publicas
resource "aws_internet_gateway" "internet-gateway-vpcbootcamp" {
  vpc_id = aws_vpc.VPCBootCamp.id
  tags = {
    "Name" = "${var.nombre-igw}"
  }
}