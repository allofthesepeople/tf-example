include "root" {
  path = find_in_parent_folders()
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

terraform {
  source = "../../../modules/ec2"
}

inputs = {
  environment    = local.env_vars.locals.environment
  instance_type  = local.env_vars.locals.instance_type
  instance_count = local.env_vars.locals.instance_count
}
