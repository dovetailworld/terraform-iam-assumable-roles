# Cloudwatch Share role

resource "aws_iam_role" "cloudwatch_share_role" {
  count              = var.create_cloudwatch_share_role ? 1 : 0
  name               = "CloudWatch-CrossAccountSharingRole"
  assume_role_policy = data.aws_iam_policy_document.cloudwatch_share_policy_document[0].json
}

data "aws_iam_policy_document" "cloudwatch_share_policy_document" {
  count = var.create_cloudwatch_share_role ? 1 : 0
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.monitor_account_id}:root"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "cloudwatch_share_policy" {
  count      = var.create_cloudwatch_share_role ? 1 : 0
  role       = aws_iam_role.cloudwatch_share_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}
