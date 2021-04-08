module "asg" {
  source          = "git::https://github.com/SrimaanPenugonda/terraform-asg.git"
  COMPONENT       = var.COMPONENT
  ENV             = var.ENV
  INSTANCE_TYPE   = var.INSTANCE_TYPE
  bucket          = var.bucket //pass the bucket name to access the VPC state file
  region          = var.region
} // calling other module(terraform-asg) as asg module also pass the variables to it.

output "sample" {
  value = module.asg.sample  // using this module here
}
