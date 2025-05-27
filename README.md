# iam-assumable-roles

Creates predefined IAM roles (admin, poweruser and readonly) which can be assumed by trusted resources.

Trusted resources can be any [IAM ARNs](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns) - typically, AWS accounts and users.

```
module "iam-roles" {
  source = "git@github.com:kabisa/terraform-iam-assumable-roles.git?ref=[version]"

  trusted_role_arns = [
    "arn:aws:iam::${local.dovetail-iam}:root",
    "arn:aws:iam::${local.kabisa-iam}:root",
  ]

  create_ci_cd_role = true

  trusted_roles_ci_cd = [
    "arn:aws:iam::{[account-id]}:role/github_actions_role",
  ]

  ci_cd_role_managed_policies = [
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  ]

  ci_cd_role_inline_policies = {
    "example_inline_policy" : data.aws_iam_policy_document.example.json,
    "example2" : data.aws_iam_policy_document.example2.json
  }

  create_admin_role     = true
  create_poweruser_role = true
  create_readonly_role  = true
}

data "aws_iam_policy_document" "example" {
  statement {
    actions   = ["ssm:*", "ec2:*"]
    effect    = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "example2" {
  statement {
    actions   = ["s3:*"]
    effect    = "Allow"
    resources = ["*"]
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.datadog_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ec2_check_reboot_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.sla_reporter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ci_cd_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.cloudwatch_share_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.datadog_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ec2_check_reboot_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.nagios_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.poweruser](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.sla_reporter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cloudwatch_share_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.datadog_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2_check_reboot_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.nagios_cloudwatch_budget_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.nagios_cloudwatch_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.poweruser](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.sla_reporter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachments_exclusive.ci_cd_iam_role_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachments_exclusive) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_with_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ci_cd_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cloudwatch_share_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.datadog_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ec2_check_reboot_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ec2_check_reboot_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.nagios_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sla_reporter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_role_name"></a> [admin\_role\_name](#input\_admin\_role\_name) | IAM role with admin access | `string` | `"admin"` | no |
| <a name="input_admin_role_path"></a> [admin\_role\_path](#input\_admin\_role\_path) | Path of admin IAM role | `string` | `"/"` | no |
| <a name="input_admin_role_policy_arn"></a> [admin\_role\_policy\_arn](#input\_admin\_role\_policy\_arn) | Policy ARN to use for admin role | `string` | `"arn:aws:iam::aws:policy/AdministratorAccess"` | no |
| <a name="input_admin_role_requires_mfa"></a> [admin\_role\_requires\_mfa](#input\_admin\_role\_requires\_mfa) | Whether admin role requires MFA | `bool` | `true` | no |
| <a name="input_ci_cd_role_inline_policies"></a> [ci\_cd\_role\_inline\_policies](#input\_ci\_cd\_role\_inline\_policies) | Inline policies map with policy name as key and json as value. | `map(string)` | `{}` | no |
| <a name="input_ci_cd_role_managed_policies"></a> [ci\_cd\_role\_managed\_policies](#input\_ci\_cd\_role\_managed\_policies) | Managed policies list. | `list(string)` | `[]` | no |
| <a name="input_create_admin_role"></a> [create\_admin\_role](#input\_create\_admin\_role) | Whether to create admin role | `bool` | `false` | no |
| <a name="input_create_ci_cd_role"></a> [create\_ci\_cd\_role](#input\_create\_ci\_cd\_role) | Wheter ci\_cd\_role has to be created | `bool` | `false` | no |
| <a name="input_create_cloudwatch_share_role"></a> [create\_cloudwatch\_share\_role](#input\_create\_cloudwatch\_share\_role) | Whether cloudwatch share role has to be created | `bool` | `false` | no |
| <a name="input_create_datadog_role"></a> [create\_datadog\_role](#input\_create\_datadog\_role) | Whether datadog role has to be created | `bool` | `false` | no |
| <a name="input_create_instance_scheduler_role"></a> [create\_instance\_scheduler\_role](#input\_create\_instance\_scheduler\_role) | Whether instance scheduler role has to be created | `bool` | `false` | no |
| <a name="input_create_nagios_budget_role"></a> [create\_nagios\_budget\_role](#input\_create\_nagios\_budget\_role) | Whether nagios budget role has to be created | `bool` | `false` | no |
| <a name="input_create_nagios_role"></a> [create\_nagios\_role](#input\_create\_nagios\_role) | Whether nagios role has to be created | `bool` | `false` | no |
| <a name="input_create_poweruser_role"></a> [create\_poweruser\_role](#input\_create\_poweruser\_role) | Whether to create poweruser role | `bool` | `false` | no |
| <a name="input_create_readonly_role"></a> [create\_readonly\_role](#input\_create\_readonly\_role) | Whether to create readonly role | `bool` | `false` | no |
| <a name="input_create_sla_reporter_role"></a> [create\_sla\_reporter\_role](#input\_create\_sla\_reporter\_role) | Create role used by SLA report generator | `bool` | `false` | no |
| <a name="input_instance_scheduler_trusted_account_id"></a> [instance\_scheduler\_trusted\_account\_id](#input\_instance\_scheduler\_trusted\_account\_id) | AWS account id where the master instance scheduler is running | `string` | `""` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum CLI/API session duration in seconds between 3600 and 43200 | `number` | `28800` | no |
| <a name="input_mfa_age"></a> [mfa\_age](#input\_mfa\_age) | Max age of valid MFA (in seconds) for roles which require MFA | `number` | `86400` | no |
| <a name="input_monitor_account_id"></a> [monitor\_account\_id](#input\_monitor\_account\_id) | Monitor AWS account id where the master Cloudwatch Dashboard is configured | `string` | `""` | no |
| <a name="input_nagios_role_arn"></a> [nagios\_role\_arn](#input\_nagios\_role\_arn) | arn of principal which assumes nagios role | `list(string)` | `[]` | no |
| <a name="input_poweruser_role_name"></a> [poweruser\_role\_name](#input\_poweruser\_role\_name) | IAM role with poweruser access | `string` | `"poweruser"` | no |
| <a name="input_poweruser_role_path"></a> [poweruser\_role\_path](#input\_poweruser\_role\_path) | Path of poweruser IAM role | `string` | `"/"` | no |
| <a name="input_poweruser_role_policy_arn"></a> [poweruser\_role\_policy\_arn](#input\_poweruser\_role\_policy\_arn) | Policy ARN to use for admin role | `string` | `"arn:aws:iam::aws:policy/PowerUserAccess"` | no |
| <a name="input_poweruser_role_requires_mfa"></a> [poweruser\_role\_requires\_mfa](#input\_poweruser\_role\_requires\_mfa) | Whether poweruser role requires MFA | `bool` | `true` | no |
| <a name="input_readonly_role_name"></a> [readonly\_role\_name](#input\_readonly\_role\_name) | IAM role with readonly access | `string` | `"readonly"` | no |
| <a name="input_readonly_role_path"></a> [readonly\_role\_path](#input\_readonly\_role\_path) | Path of readonly IAM role | `string` | `"/"` | no |
| <a name="input_readonly_role_policy_arn"></a> [readonly\_role\_policy\_arn](#input\_readonly\_role\_policy\_arn) | Policy ARN to use for readonly role | `string` | `"arn:aws:iam::aws:policy/ReadOnlyAccess"` | no |
| <a name="input_readonly_role_requires_mfa"></a> [readonly\_role\_requires\_mfa](#input\_readonly\_role\_requires\_mfa) | Whether readonly role requires MFA | `bool` | `true` | no |
| <a name="input_trusted_role_arns"></a> [trusted\_role\_arns](#input\_trusted\_role\_arns) | ARNs of AWS entities who can assume these roles | `list(string)` | `[]` | no |
| <a name="input_trusted_roles_ci_cd"></a> [trusted\_roles\_ci\_cd](#input\_trusted\_roles\_ci\_cd) | ARNs of AWS entities who can assume these roles for CI/CD | `list(string)` | `[]` | no |
| <a name="input_trusted_user_ec2_check_reboot"></a> [trusted\_user\_ec2\_check\_reboot](#input\_trusted\_user\_ec2\_check\_reboot) | Provide a user that is allowed to check and reboot EC2 instances with SSM. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_iam_role_arn"></a> [admin\_iam\_role\_arn](#output\_admin\_iam\_role\_arn) | ARN of admin IAM role |
| <a name="output_admin_iam_role_name"></a> [admin\_iam\_role\_name](#output\_admin\_iam\_role\_name) | Name of admin IAM role |
| <a name="output_admin_iam_role_path"></a> [admin\_iam\_role\_path](#output\_admin\_iam\_role\_path) | Path of admin IAM role |
| <a name="output_admin_iam_role_requires_mfa"></a> [admin\_iam\_role\_requires\_mfa](#output\_admin\_iam\_role\_requires\_mfa) | Whether admin IAM role requires MFA |
| <a name="output_datadog_role_name"></a> [datadog\_role\_name](#output\_datadog\_role\_name) | Datadog role name |
| <a name="output_poweruser_iam_role_arn"></a> [poweruser\_iam\_role\_arn](#output\_poweruser\_iam\_role\_arn) | ARN of poweruser IAM role |
| <a name="output_poweruser_iam_role_name"></a> [poweruser\_iam\_role\_name](#output\_poweruser\_iam\_role\_name) | Name of poweruser IAM role |
| <a name="output_poweruser_iam_role_path"></a> [poweruser\_iam\_role\_path](#output\_poweruser\_iam\_role\_path) | Path of poweruser IAM role |
| <a name="output_poweruser_iam_role_requires_mfa"></a> [poweruser\_iam\_role\_requires\_mfa](#output\_poweruser\_iam\_role\_requires\_mfa) | Whether poweruser IAM role requires MFA |
| <a name="output_readonly_iam_role_arn"></a> [readonly\_iam\_role\_arn](#output\_readonly\_iam\_role\_arn) | ARN of readonly IAM role |
| <a name="output_readonly_iam_role_name"></a> [readonly\_iam\_role\_name](#output\_readonly\_iam\_role\_name) | Name of readonly IAM role |
| <a name="output_readonly_iam_role_path"></a> [readonly\_iam\_role\_path](#output\_readonly\_iam\_role\_path) | Path of readonly IAM role |
| <a name="output_readonly_iam_role_requires_mfa"></a> [readonly\_iam\_role\_requires\_mfa](#output\_readonly\_iam\_role\_requires\_mfa) | Whether readonly IAM role requires MFA |
<!-- END_TF_DOCS -->