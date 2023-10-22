#0. Create DB Subnet Group

resource "aws_db_subnet_group" "dbsubnetgroup" {
  name       = "${var.project_name}-dbsng"
  subnet_ids = [aws_subnet.private-subnets-data[0].id, aws_subnet.private-subnets-data[1].id]

  tags = {
    Name = "${var.project_name}-dbsng"
  }
}
