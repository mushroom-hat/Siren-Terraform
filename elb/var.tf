variable "mainVPC_id" {}
variable "subnet01_id" {}
variable "subnet02_id" {}
variable "internet_gateway_id" {}
variable "default_security_group_id" {}
variable "tg_name" {
	default = "SirenTG"
}

variable "lb_name" {
	default = "SirenLBTF"
}
