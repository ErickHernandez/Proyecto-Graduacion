output "alb_public_dns" {
  value = aws_lb.proyectograd-web-alb.dns_name
}

output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.proyectograd.address
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.proyectograd.port
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.proyectograd.username
}

output "rds_replica_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.proyectograd-replica.address
}

output "rds_replica_port" {
  description = "RDS instance port"
  value       = aws_db_instance.proyectograd-replica.port
}

output "rds_replica_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.proyectograd-replica.username
}