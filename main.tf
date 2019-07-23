resource "aws_codedeploy_app" "cd_app" {
  name = "${var.env}-cd-${var.name}"
}

//resource "aws_codedeploy_deployment_config" "cd_app_config" {
//  deployment_config_name = "cd_app_config"
//
//  minimum_healthy_hosts {
//    type  = "HOST_COUNT"
//    value = 2
//  }
//}

resource "aws_codedeploy_deployment_group" "cd_app_group" {
  app_name              = "${aws_codedeploy_app.cd_app.name}"
  deployment_group_name = "${var.env}-dg-${var.name}"
  service_role_arn      = "${aws_iam_role.cd_role.arn}"
//  deployment_config_name = "${aws_codedeploy_deployment_config.foo.id}"
  deployment_config_name = "CodeDeployDefault.OneAtATime"

  ec2_tag_filter {
    key   = "${var.ec2_filter_key}"
    type  = "KEY_AND_VALUE"
    value = "${var.ec2_filter_value}"
  }

  //trigger_configuration {
  //  trigger_name       = "trigger_sns_topic"
  //  trigger_events     = ["DeploymentSuccess", "DeploymentFailure", "DeploymentStop", "DeploymentRollback"]
  //  trigger_target_arn = "${var.trigger_sns_arn}"
  //}

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

//  alarm_configuration {
//    alarms  = ["my-alarm-name"]
//    enabled = true
//  }
}
