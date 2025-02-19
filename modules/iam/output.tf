output "iam_role_arn" {
  description = "ARN of the IAM Role"
  value       = aws_iam_role.ec2_vpc_role.arn
}

output "iam_policy_arn" {
  description = "ARN of the IAM Policy"
  value       = aws_iam_policy.ec2_vpc_policy.arn
}
