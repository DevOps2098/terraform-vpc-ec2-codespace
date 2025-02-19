resource "aws_instance" "public" {
  ami                    = "ami-0abcdef1234567890"
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids  # No square brackets here
  key_name               = var.key_name

  tags = {
    Name = "Public-EC2"
  }
}

resource "aws_instance" "private" {
  ami                    = "ami-0abcdef1234567890"
  instance_type          = "t2.micro"
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids  # No square brackets here
  key_name               = var.key_name

  tags = {
    Name = "Private-EC2"
  }
}
