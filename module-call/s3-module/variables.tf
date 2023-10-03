variable "name" {
  type    = string
  default = "UGO"
}

# variable "versioning" {
#   type    = string
#   default = "Enabled"
# }

# variable "acl" {
#   type    = string
#   default = "private"
# }

variable "region" {
  type    = string
  default = "us location"
}

variable "access_key" {
  type        = string
  description = "access"
}

variable "secret_key" {
  type        = string
  description = "password"
}
variable "create_vpc" {
  type    = bool
  default = true
}