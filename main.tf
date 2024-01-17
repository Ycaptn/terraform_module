resource "aws_key_pair" "aws-kp" {
  key_name   = "aws_kp"
  public_key = file("aws_kp.pem")
}

resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.my_subnet[var.subnet_count % length(aws_subnet.my_subnet)].id
  key_name      = aws_key_pair.aws-kp.key_name

  vpc_security_group_ids = [aws_security_group.snap_web.id]
  tags = {
    Name = "${var.ami_id}"
  }
}

resource "aws_db_instance" "my_rds_instance" {
  identifier          = "my-rds-instance"
  allocated_storage   = var.db_allocated_storage
  engine              = var.db_engine
  engine_version      = var.db_engine_version
  instance_class      = var.db_instance_class
  username            = var.db_username
  password            = var.db_password
  publicly_accessible = false
  multi_az            = false
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.my_db_sg.id]
  db_subnet_group_name   = var.db_subnet_group_name
  tags = {
    Name = "MyRDSInstance"
  }

  depends_on = [aws_db_subnet_group.my_db_subnet_group]
}

resource "aws_dynamodb_table" "dynamodb-table" {
  name         = var.dynamodb_table_name
  billing_mode = var.dynamodb_billing_mode


  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity
  hash_key       = var.dynamodb_hash_key

  attribute {
    name = var.dynamodb_hash_key
    type = "S"
  }

  ttl {
    attribute_name = var.dynamodb_ttl_attribute_name
    enabled        = var.dynamodb_ttl_enabled
  }

  tags = {
    Name = "${var.dynamodb_table_name}"
  }
}

resource "aws_eip" "web_eip" {
  instance = aws_instance.my_instance.id
  vpc      = true
  tags = {
    Name = "${var.ami_id}"
  }
}