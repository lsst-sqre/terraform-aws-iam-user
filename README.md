terraform `aws_iam_user` module
===

[![Build Status](https://travis-ci.org/lsst-sqre/terraform-aws-iam-user.png)](https://travis-ci.org/lsst-sqre/terraform-aws-iam-user)

Usage
---

### Example

```hcl
module "lfs_user" {
  source = "github.com/lsst-sqre/tf_aws_iam_user"

  name = "${local.fqdn}-push"

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
```

Arguments & Attributes
---

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | IAM user name | string | n/a | yes |
| policy | IAM policy to attach to IAM user | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id |  |
| name |  |
| secret |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

`pre-commit` hooks
---

```bash
go get github.com/segmentio/terraform-docs
pip install --user pre-commit
pre-commit install

# manual run
pre-commit run -a
```

See also
---

* [`terraform`](https://www.terraform.io/)
* [`terragrunt`](https://github.com/gruntwork-io/terragrunt)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs)
* [`pre-commit`](https://github.com/pre-commit/pre-commit)
* [`pre-commit-terraform`](https://github.com/antonbabenko/pre-commit-terraform)
