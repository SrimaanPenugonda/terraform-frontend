module "asg" {
  source = "https://github.com/SrimaanPenugonda/terraform-asg.git"
}

output "sample" {
  value = module.asg.sample
}