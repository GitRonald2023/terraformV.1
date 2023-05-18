#Asociacion en la tabla de ruta ptrivada a internet de la subnet privada 1a 
resource "aws_route_table_association" "asociacion-rt-privada-1a" {
  route_table_id = aws_route_table.rt-private.id
  subnet_id      = element(aws_subnet.private_1a_bootcamp.*.id, 0)
}

#Asociacion en la tabla de ruta privada a internet de la subnet privada 1b
resource "aws_route_table_association" "asociacion-rt-privada-1b" {
  route_table_id = aws_route_table.rt-private.id
  subnet_id      = element(aws_subnet.private_1a_bootcamp.*.id, 1)
}