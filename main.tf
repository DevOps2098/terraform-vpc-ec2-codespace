module "iam" {
  source        = "./modules/iam"
  iam_user_name = "Prasanna-user"  # Existing IAM user
  account_id    = "491085415494"  # Replace with your actual AWS account ID
}
