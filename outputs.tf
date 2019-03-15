output "cd_app_id" {
  value = "${aws_codedeploy_app.cd_app.id}"
}

output "cd_group_id" {
  value = "${aws_codedeploy_deployment_group.cd_app_group.id}"
}
