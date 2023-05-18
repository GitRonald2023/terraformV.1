#Creacion tabla de rutas para alcanzar internet desde subred privadas a traves de nat-gateway
resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.VPCBootCamp.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw-bootcamp.id
  }
  tags = {
    "Name" = "rt-private"
  }

}