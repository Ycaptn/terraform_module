output "public_ip" {
  description = "instance public ip"
  value       = aws_instance.my_instance.public_ip
  depends_on  = [aws_instance.my_instance]
}

output "elastic_ip" {
  description = "instance private ip"
  value       = aws_eip.web_eip.public_ip
  depends_on  = [aws_eip.web_eip]
}

output "instance_public_dns" {
  description = "the public dns"
  value       = aws_eip.web_eip.public_dns
  depends_on  = [aws_eip.web_eip]
}

output "database_endpoint" {
  description = "the endpoint of the database"
  value       = aws_db_instance.my_rds_instance.address
}

output "database_port" {
  description = "The port of my database"
  value       = aws_db_instance.my_rds_instance.port

} 