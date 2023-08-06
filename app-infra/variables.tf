# EC2 variable config
variable "create" {
  description = "Whether to create an instance"
  type        = bool
  default     = true
}

variable "ami_id" {
  description = "AMI ID use for instance"
  type        = string
  default     = "ami-0f5ee92e2d63afc18"
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = list(string)
  default     = ["ap-south-1a","ap-south-1b","ap-south-1c"]
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = null
}

variable "instance_type" {
  description = "instance type for instance"
  type        = string
  default     = "t2.micro"
}


variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
  default     = "arn:aws:iam::625704753971:instance-profile/EC2-role-for-AWS-Services"
}

variable "ipv6_addresses" {
  description = "Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  type        = list(string)
  default     = null
}

variable "metadata_options" {
  description = "Customize the metadata options of the instance"
  type        = map(string)
  default = {
    "http_endpoint"               = "enabled"
    "http_put_response_hop_limit" = 1
    "http_tokens"                 = "optional"
  }
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
  default     = null
}

variable "key_name" {
  description = "Key name to be use for login to the server"
  type        = string
  default     = "devops-key"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = "subnet-060470eb6cbfba33e"
}

variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead"
  type        = string
  default     = null
}

#--------------------------------------------------------

# Terraform provider config

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}


#------------------------------------------------------------------------------

# Resource tags

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}