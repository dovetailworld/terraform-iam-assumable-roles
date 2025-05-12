variable "trusted_role_arns" {
  description = "ARNs of AWS entities who can assume these roles"
  default     = []
  type        = list(string)
}

variable "mfa_age" {
  description = "Max age of valid MFA (in seconds) for roles which require MFA"
  default     = 86400
  type        = number
}

# Admin
variable "create_admin_role" {
  description = "Whether to create admin role"
  default     = false
  type        = bool
}

variable "admin_role_name" {
  description = "IAM role with admin access"
  default     = "admin"
  type        = string
}

variable "admin_role_path" {
  description = "Path of admin IAM role"
  default     = "/"
  type        = string
}

variable "admin_role_requires_mfa" {
  description = "Whether admin role requires MFA"
  default     = true
  type        = bool
}

variable "admin_role_policy_arn" {
  description = "Policy ARN to use for admin role"
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
  type        = string
}

# Poweruser
variable "create_poweruser_role" {
  description = "Whether to create poweruser role"
  default     = false
  type        = bool
}

variable "poweruser_role_name" {
  description = "IAM role with poweruser access"
  default     = "poweruser"
  type        = string
}

variable "poweruser_role_path" {
  description = "Path of poweruser IAM role"
  default     = "/"
  type        = string
}

variable "poweruser_role_requires_mfa" {
  description = "Whether poweruser role requires MFA"
  default     = true
  type        = bool
}

variable "poweruser_role_policy_arn" {
  description = "Policy ARN to use for admin role"
  default     = "arn:aws:iam::aws:policy/PowerUserAccess"
  type        = string
}

# Readonly
variable "create_readonly_role" {
  description = "Whether to create readonly role"
  default     = false
  type        = bool
}

variable "readonly_role_name" {
  description = "IAM role with readonly access"
  default     = "readonly"
  type        = string
}

variable "readonly_role_path" {
  description = "Path of readonly IAM role"
  default     = "/"
  type        = string
}

variable "readonly_role_requires_mfa" {
  description = "Whether readonly role requires MFA"
  default     = true
  type        = bool
}

variable "readonly_role_policy_arn" {
  description = "Policy ARN to use for readonly role"
  default     = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  type        = string
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  default     = 28800
  type        = number
}

# Instance Scheduler

variable "instance_scheduler_trusted_account_id" {
  description = "AWS account id where the master instance scheduler is running"
  default     = ""
  type        = string
}

variable "create_instance_scheduler_role" {
  description = "Whether instance scheduler role has to be created"
  default     = false
  type        = bool
}

# Cloudwatch Dashboard Sharing

variable "monitor_account_id" {
  description = "Monitor AWS account id where the master Cloudwatch Dashboard is configured"
  default     = ""
  type        = string
}

variable "create_cloudwatch_share_role" {
  description = "Whether cloudwatch share role has to be created"
  default     = false
  type        = bool
}

# Nagios

variable "nagios_role_arn" {
  description = "arn of principal which assumes nagios role"
  default     = []
  type        = list(string)
}

variable "create_nagios_role" {
  description = "Whether nagios role has to be created"
  default     = false
  type        = bool
}

variable "create_nagios_budget_role" {
  description = "Whether nagios budget role has to be created"
  default     = false
  type        = bool
}

# Datadog

variable "create_datadog_role" {
  description = "Whether datadog role has to be created"
  default     = false
  type        = bool
}

# SLA Report

variable "create_sla_reporter_role" {
  description = "Create role used by SLA report generator"
  default     = false
  type        = bool
}

# CI_CD

variable "create_ci_cd_role" {
  description = "Wheter ci_cd_role has to be created"
  default     = false
  type        = bool
}

variable "trusted_roles_ci_cd" {
  description = "ARNs of AWS entities who can assume these roles for CI/CD"
  default     = []
  type        = list(string)
}

variable "ci_cd_role_inline_policies" {
  default     = {}
  description = "Inline policies map with policy name as key and json as value."
  type        = map(string)
}

variable "ci_cd_role_managed_policies" {
  default     = []
  description = "Managed policies list."
  type        = list(string)
}

# GitHub Agent

variable "trusted_user_ec2_check_reboot" {
  default = ""
  type = string
  description = "Provide a user that is allowed to check and reboot EC3 instances with SSM."
}
