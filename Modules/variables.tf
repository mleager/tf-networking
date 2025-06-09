variable "vpc_name" {
  type        = string
  default     = "vpc"
  description = "The name of the VPC"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The CIDR block for the VPC"
}

variable "azs" {
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"]
  description = "List of Availability Zones for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "List of CIDR blocks for the public subnets"
}

variable "private_subnets" {
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
  description = "List of CIDR blocks for the private subnets"
}

variable "env" {
  type        = string
  default     = "development"
  description = "The environment for the VPC (e.g., development, staging, production)"
}

