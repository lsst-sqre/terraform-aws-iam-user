terraform `aws_iam_user` module
===

[![Build Status](https://travis-ci.org/lsst-sqre/tf_aws_iam_user.png)](https://travis-ci.org/lsst-sqre/tf_aws_iam_user)

Usage
---

    module "lfs_user" {
      source = "github.com/lsst-sqre/tf_aws_iam_user"

      name = "${data.template_file.fqdn.rendered}-push"

      policy = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "1",
          "Effect": "Allow",
          "Action": [
            "s3:GetObject",
            "s3:PutObject",
            "s3:PutObjectAcl"
          ],
          "Resource": [
            "${aws_s3_bucket.lfs_objects.arn}/*",
            "${aws_s3_bucket.lfs_objects_backup.arn}/*"
          ]
        },
        {
          "Sid": "2",
          "Effect": "Allow",
          "Action": [
            "s3:ListObjects",
            "s3:ListBucket"
          ],
          "Resource": [
            "${aws_s3_bucket.lfs_objects.arn}",
            "${aws_s3_bucket.lfs_objects_backup.arn}"
          ]
        }
      ]
    }
    EOF
    }

Variables
---

* `name`

IAM user name

* `policy`

IAM policy to attach to IAM user

Outputs
---

* `name`
* `id`
* `secret`

Resources created
---

* `aws_iam_user.iam_user`
* `aws_iam_access_key.iam_user`
* `aws_iam_user_policy.iam_user`

See Also
---

* [`terraform`](https://www.terraform.io/)
