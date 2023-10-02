module "s3" {
  source = "git::https://github.com/BensGits/tickets.git//s3-module"
  access_key = var.access_key
  secret_key = var.secret_key
}
