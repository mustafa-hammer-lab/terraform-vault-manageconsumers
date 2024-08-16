variable "namespace" {
  description = "Name of namespace to apply this module to"
  type        = string
}

variable "team_name" {
  description = "Name of team"
  type        = string
}

variable "github_token" {
  description = "Github Token"
  type        = string
}

variable "owner_email" {
  description = "Email for owner"
  type        = string
}

variable "charge_back" {
  description = "Charge back number for finance"
  type        = string
}
