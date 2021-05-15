module "asg" {
  source          = "git::https://github.com/SrimaanPenugonda/terraform-asg.git" #shows error ignore
  COMPONENT       = var.COMPONENT
  ENV             = var.ENV
  INSTANCE_TYPE   = var.INSTANCE_TYPE
  bucket          = var.bucket //pass the bucket name to access the VPC state file
  region          = var.region
  PORT            = 80
  HEALTH          = "/"
  APP_ARTIFACT_VERSION = var.APP_ARTIFACT_VERSION
} // calling other module(terraform-asg) as asg module also pass the variables to it.


resource "aws_lb_listener" "frontend" {
  load_balancer_arn = data.terraform_remote_state.alb.outputs.PUBLIC_ALB_LISTENER_ARN
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = module.asg.TG_ARN
  }
}