variable "AWS_REGION" {
  description = "The AWS region"
  default     = "us-east-1"
}

variable "AWS_ACCESS_KEY" {
  description = "The AWS access"
  default     = "access-key"
}

variable "AWS_SECRET_KEY" {
  description = "The AWS secret key"
  default     = "key"
}

variable "AWS_ACCOUNT_ID" {
  description = "AWS Account ID"
}

variable "VPC_ID" {
  description = "VPC ID"
}

variable "AWS_SUBNET_ID" {
  description = "Subnet ID"
}

variable "SSH_KEY_NAME" {
  description = "SSH Key name"  
}