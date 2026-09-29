variable "aws_region" {
  description = "Aws region where resource will be created"
  type        = string
  default     = "ap-southeast-1"

}

variable "instance_type" {
  description = "Ec2 instance type"
  type        = string
  default     = "t3.micro"

}

variable "ami_id" {
  description = "ubuntu ami id"
  type        = string
}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string
}

variable "website_folder" {
  description = "website folder to deploy from github"
  type        = string
  default     = "cafe"

}
