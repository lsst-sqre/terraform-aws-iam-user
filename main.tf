variable "name" {
  description = "IAM user name"
}

variable "policy" {
  description = "IAM policy to attach to IAM user"
}

resource "aws_iam_user" "iam_user" {
  name = "${var.name}"
}

resource "aws_iam_access_key" "iam_user" {
  user = "${aws_iam_user.iam_user.name}"
}

resource "aws_iam_user_policy" "iam_user" {
  name   = "${aws_iam_user.iam_user.name}-policy"
  user   = "${aws_iam_user.iam_user.name}"
  policy = "${var.policy}"
}

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
