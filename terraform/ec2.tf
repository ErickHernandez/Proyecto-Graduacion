resource "aws_instance" "playsms-tf-1" {
  ami           = lookup(var.ami, var.aws_region)
  instance_type = "t2.micro"
  
  # AZ
    #availability_zone = var.aws_availability_zone_a
  # Subnet
   #subnet_id = "subnet-186f1547"
   subnet_id = aws_subnet.playsms-subnet-public-1.id

  # Security Group
  #vpc_security_group_ids = ["sg-04536a46202071eff"]
   vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

  # the Public SSH key
  key_name = "proyectograd"

  tags = {
    Name = "playsms-tf-1"
  }
}

resource "aws_instance" "playsms-tf-2" {
  ami           = lookup(var.ami, var.aws_region)
  instance_type = "t2.micro"
  
  # AZ
    #availability_zone = var.aws_availability_zone_b
  # Subnet
  # subnet_id = "subnet-186f1547"
    subnet_id = aws_subnet.playsms-subnet-public-2.id

  # Security Group
  #vpc_security_group_ids = ["sg-04536a46202071eff"]
   vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  
  # the Public SSH key
  key_name = "proyectograd"

  tags = {
    Name = "playsms-tf-2"
  }
}