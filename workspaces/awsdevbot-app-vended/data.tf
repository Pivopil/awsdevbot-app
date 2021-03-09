data "terraform_remote_state" "baseline" {
  backend = "remote"
  config = {
    hostname = "app.terraform.io"
    organization = var.organization
    workspaces = {
      name = var.workspace
    }
  }
}

data "aws_route53_zone" "public" {
  name         = var.public_subdomain
  private_zone = false
}
