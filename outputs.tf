#output "abc" {
#  value = "Hello\nWorld"
#}
#
#output "abc1" {
#  value = "hello"
#}

variable "abc" {
  default = "100"
}

output "abc" {
  value = var.abc
}

variable "abc1" {}

output "abc1" {
  value = var.abc1
}
