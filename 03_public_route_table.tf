#Creacion ruta para internet en subredes publicas
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.VPCBootCamp.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway-vpcbootcamp.id
  }
  tags = {
    Name = "rt-public-vpcBootCamp"
  }
}