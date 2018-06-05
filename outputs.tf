output "name" {
  sensitive = true
  value     = "${aws_iam_access_key.iam_user.user}"
}

output "id" {
  sensitive = true
  value     = "${aws_iam_access_key.iam_user.id}"
}

output "secret" {
  sensitive = true
  value     = "${aws_iam_access_key.iam_user.secret}"
}
