provider "aws" {
  version = "~> 1.21"
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
