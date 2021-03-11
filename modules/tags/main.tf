locals {
  keys = compact(list([
    coaelse(var.app_env_name, "app:env"),
    coaelse(var.app_env_version, "app:version"),
    coaelse(var.app_env_component_name, "app:component:name"),
    coaelse(var.app_env_component_version, "app:component:varsion"),
  ]))
  values = compact(list([
    var.app_env_name,
    var.app_env_version,
    var.app_env_component_name,
    var.app_env_component_version,
  ]))
  tags = zipmap(local.keys, local.values)
}

module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=master"
  namespace  = null
  stage      = var.prefix
  name       = null
  attributes = []
  delimiter  = "-"

  tags = local.tags
}






//1) cosnle org and resource groups
//
//// component = org = root public domain
//var.app_env_component_name      "app:component:name" -> "awsdevbot.com"
//
//// org, env, app
//
//var.app_env_component_version   "app:component:version" -> "0.0.1"  // https://semver.org
//var.support_email  (contact email) "john.smith@anycompany.com"

