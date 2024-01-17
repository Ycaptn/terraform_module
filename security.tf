resource "aws_security_group" "snap_web" {
  name        = var.web_sg_name
  description = var.web_sg_description
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "Allow all traffic through HTTP"
    from_port   = var.web_sg_ingress_port
    to_port     = var.web_sg_ingress_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH from my computer"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "my_db_sg" {
  name        = var.db_sg_name
  description = var.db_sg_description
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port       = "3306"
    to_port         = "3306"
    protocol        = "tcp"
    security_groups = [aws_security_group.snap_web.id]
  }
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = [for subnet in aws_subnet.my_subnet : subnet.id]

}