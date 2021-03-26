module "asg" {
  source = "git::https://github.com/SrimaanPenugonda/terraform-asg.git"
}

output "sample" {
  value = module.asg.sample
}