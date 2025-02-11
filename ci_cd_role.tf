resource "aws_iam_role" "ci_cd_iam_role" {
  count = var.create_ci_cd_role ? 1 : 0

  name                = "ci_cd_access_role"
  assume_role_policy  = data.aws_iam_policy_document.ci_cd_policy_document[0].json

  dynamic "inline_policy" {
    for_each = var.ci_cd_role_inline_policies

    content {
      name   = inline_policy.key
      policy = inline_policy.value
    }
  }
}

resource "aws_iam_role_policy_attachments_exclusive" "ci_cd_iam_role_attach" {
  count = var.create_ci_cd_role ? 1 : 0

  role_name   = aws_iam_role.ci_cd_iam_role.name[0]
  policy_arns = var.ci_cd_role_managed_policies
}

data "aws_iam_policy_document" "ci_cd_policy_document" {
  count = var.create_ci_cd_role ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = var.trusted_roles_ci_cd
    }
  }
}
