variable "aws_region" {
  description = "Value of the Name of the Region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "aws_availability_zone_a" {
  description = "Value of the Name of the Region where resources will be created"
  type        = string
  default     = "us-east-1a"
}

variable "aws_availability_zone_b" {
  description = "Value of the Name of the Region where resources will be created"
  type        = string
  default     = "us-east-1b"
}

variable "ami" {
  description = "Map containing the accepted ami-id's by region"
  type        = map(any)
  default = {
    "us-east-1" : "ami-02e3e1579e18a6125"
  }
}