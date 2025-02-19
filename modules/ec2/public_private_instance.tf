resource "aws_instance" "public" {
  ami             = "ami-0abcdef1234567890"
  instance_type   = "t2.micro"
  subnet_id       = var.public_subnet_id
  security_groups = [var.security_group_id]
  key_name        = var.key_name  # Add Key Pair

  tags = {
    Name = "Public-EC2"
  }
}

resource "aws_instance" "private" {
  ami             = "ami-0abcdef1234567890"
  instance_type   = "t2.micro"
  subnet_id       = var.private_subnet_id
  security_groups = [var.security_group_id]
  key_name        = var.key_name  # Add Key Pair

  tags = {
    Name = "Private-EC2"
  }
}
