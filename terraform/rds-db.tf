


resource "aws_db_parameter_group" "proyectograd-pg" {
  name   = "proyectograd"
  family = "mysql5.7"

}

resource "aws_db_instance" "proyectograd" {
  identifier                = "proyectograd-main"
  instance_class            = "db.t3.micro"
  allocated_storage         = 10
  max_allocated_storage     = 50
  engine                    = "mysql"
  engine_version            = "5.7"
  name                      = "prod"
  username                  = "prod"
  password                  = "A4aShqST9L#"
  db_subnet_group_name      = aws_db_subnet_group.db-proyectograd.name
  vpc_security_group_ids    = [aws_security_group.db-allowed.id, aws_security_group.ssh-allowed.id]
  parameter_group_name      = aws_db_parameter_group.proyectograd-pg.name
  publicly_accessible       = true
  skip_final_snapshot       = true
  copy_tags_to_snapshot     = true
  backup_retention_period   = 5
}

resource "aws_db_instance" "proyectograd-replica" {
   identifier             = "proyectograd-replica"
   replicate_source_db    = aws_db_instance.proyectograd.identifier
   instance_class         = "db.t3.micro"
   apply_immediately      = true
   publicly_accessible    = true
   skip_final_snapshot    = true
   vpc_security_group_ids = [aws_security_group.db-allowed.id, aws_security_group.ssh-allowed.id]
   parameter_group_name   = aws_db_parameter_group.proyectograd-pg.name
}