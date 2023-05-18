#Asociacion de VPC a nat-gateway
resource "aws_eip" "nat_gateway_eip" {
  vpc = true
}

#Creacion de nat-gateway para subredes privadas
resource "aws_nat_gateway" "nat-gw-bootcamp" {
  allocation_id     = aws_eip.nat_gateway_eip.id
  connectivity_type = "public"
  subnet_id         = element(aws_subnet.public_1a_bootcamp.*.id, 0)
  tags = {
    "Name" = "nat-gw-subnet-public"
  }
}
