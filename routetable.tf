#Route table
resource "aws_route_table" "rtablen" {
  vpc_id = aws_vpc.vpctest.id

    route {
    cidr_block = var.egress_route
    gateway_id = aws_internet_gateway.igwn.id
  }

  tags = {
    Name = "task1-route-table"
  }
}
#route IGW
# resource "aws_route" "internet_gateway" {
#   route_table_id         = aws_route_table.rtablen.id
#   destination_cidr_block = var.egress_route
#   gateway_id             = aws_internet_gateway.igwn.id
# }

resource "aws_route_table_association" "main_association" {
  subnet_id      = aws_subnet.subnetn.id
  route_table_id = aws_route_table.rtablen.id
}