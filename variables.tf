variable "create_alb" {
  description = "create alb"
  type = bool
  default = false
}

variable "alb_internal" {
  description = "is alb internal"
  type = bool
  default = false
}

variable "load_balancer_name" {
 description = "name of the alb"
 type = string
 default = ""
}

variable "security_groups" {
  description = "sg for the alb"
  type = list(string)
  default = []
}

variable "subnets" {
  description = "subnets for the alb"
  type = list(string)
  default = []
}

variable "tg_name" {
  description = "target group name"
  type = string
  default = ""
}

variable "vpc_id" {
  description = "id of the vpc"
  type = string
  default = ""
}
