data "aws_route53_zone" "public" {
  name         = var.public_subdomain
  private_zone = false
}

module "tags" {
  // git::https://github.com/Pivopil/awsdevbot-app.git//modules/tags?ref=main
  source = "../../modules/tags"
  prefix = var.prefix
}


module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "2.12.0"

  create_certificate = true
  domain_name        = var.public_subdomain
  zone_id            = data.aws_route53_zone.public.zone_id
  subject_alternative_names = [
    "api.${var.public_subdomain}",
    "www.${var.public_subdomain}",
    "app.${var.public_subdomain}",
    "alb.${var.public_subdomain}",
    "ecs.${var.public_subdomain}",
    "*.ecs.${var.public_subdomain}"
  ]
  tags = merge(module.tags, {
    Name = "${var.prefix}:${var.public_subdomain}:${acm}"
  })
}
