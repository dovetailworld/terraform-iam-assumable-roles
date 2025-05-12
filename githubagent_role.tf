data "aws_iam_policy_document" "ec2_check_reboot_assume_role_policy" {
  count = var.trusted_user_ec2_check_reboot != "" ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [var.trusted_user_ec2_check_reboot]
    }
  }
}

resource "aws_iam_role" "ec2_check_reboot_role" {
  count = var.trusted_user_ec2_check_reboot != "" ? 1 : 0

  name               = "EC2CheckRebootRole"
  assume_role_policy = data.aws_iam_policy_document.ec2_check_reboot_assume_role_policy[0].json
}

data "aws_iam_policy_document" "ec2_check_reboot_policy" {
  count = var.trusted_user_ec2_check_reboot != "" ? 1 : 0

  statement {
    sid = "ListEC2Instances"

    actions = [
      "ec2:DescribeInstances",
    ]

    resources = [
      "*",
    ]
  }
  statement {
    sid = "SendSSMCommands"

    actions = [
      "ssm:SendCommand",
      "ssm:ListCommands",
      "ssm:ListCommandInvocations",
      "ssm:DescribeInstanceInformation",
    ]

    resources = [
      "*",
    ]
  }
  statement {
    sid = "RebootEC2Instances"

    actions = [
      "ec2:RebootInstances",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "ec2_check_reboot_policy" {
  count = var.trusted_user_ec2_check_reboot != "" ? 1 : 0

  name   = "EC2CheckRebootPolicy"
  policy = data.aws_iam_policy_document.ec2_check_reboot_policy[0].json
}

resource "aws_iam_role_policy_attachment" "ec2_check_reboot_attach" {
  count = var.trusted_user_ec2_check_reboot != "" ? 1 : 0

  role       = aws_iam_role.ec2_check_reboot_role[0].name
  policy_arn = aws_iam_policy.ec2_check_reboot_policy[0].arn
}
