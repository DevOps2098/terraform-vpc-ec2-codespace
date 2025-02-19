resource "aws_iam_role" "ec2_vpc_role" {
  name               = "EC2_VPC_Admin_Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "sts:AssumeRole"
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:user/${var.iam_user_name}"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "ec2_vpc_policy" {
  name        = "EC2_VPC_FullAccess_Policy"
  description = "Policy granting full access to EC2 and VPC"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "ec2:*",
          "vpc:*"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_vpc_role.name
  policy_arn = aws_iam_policy.ec2_vpc_policy.arn
}

resource "aws_iam_user_policy" "allow_assume_role" {
  name   = "AllowAssumeEC2VPCAdminRole"
  user   = var.iam_user_name  # Using the existing IAM user name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = aws_iam_role.ec2_vpc_role.arn
      }
    ]
  })
}
