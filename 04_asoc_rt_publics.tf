# Asociación de subredes publicas 1a
resource "aws_route_table_association" "asociacion_rt_publics-1a" {
  route_table_id = aws_route_table.public_route.id
  subnet_id      = element(aws_subnet.public_1a_bootcamp.*.id, 0)
}

# Asociación de subredes publicas 1b
resource "aws_route_table_association" "asociacion_rt_publics-1b" {
  route_table_id = aws_route_table.public_route.id
  subnet_id      = element(aws_subnet.public_1a_bootcamp.*.id, 1)
}