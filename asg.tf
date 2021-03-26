module "asg" {
  source = "git::https://github.com/SrimaanPenugonda/terraform-asg.git"
} // calling other sources as asg module

output "sample" {
  value = module.asg.sample  // using this module here
}
