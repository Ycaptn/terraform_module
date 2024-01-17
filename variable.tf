# Provider.tf 
variable "aws_region" {
  description = "The AWS region to deploy resources into."
  type        = string
  default     = "us-east-1" # Set your default region here or remove this line if you prefer to specify it when running Terraform
}

# Main.tf 
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c7217cdde317cfec"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
  type        = string
  default     = ""
}

variable "security_group_ids" {
  description = "The list of security group IDs for the EC2 instance"
  type        = list(string)
  default     = ["default"]
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instance"
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "The database engine for the RDS instance"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The database engine version for the RDS instance"
  type        = string
  default     = "5.7"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "The name of the database for the RDS instance"
  type        = string
  default     = "mydatabase"
}

variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  default     = "your_password"
}


variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "my-terraform-lock-table"
}

variable "dynamodb_billing_mode" {
  description = "The billing mode for the DynamoDB table"
  type        = string
  default     = "PROVISIONED"
}

variable "dynamodb_read_capacity" {
  description = "The read capacity for the DynamoDB table"
  type        = number
  default     = 5
}

variable "dynamodb_write_capacity" {
  description = "The write capacity for the DynamoDB table"
  type        = number
  default     = 5
}

variable "dynamodb_hash_key" {
  description = "The hash key for the DynamoDB table"
  type        = string
  default     = "LockId"
}

variable "dynamodb_ttl_enabled" {
  description = "Flag to enable or disable TTL for DynamoDB table"
  type        = bool
  default     = false
}

variable "dynamodb_ttl_attribute_name" {
  description = "The attribute name for TTL in DynamoDB table"
  type        = string
  default     = "TimeToExist"
}


# VPC.tf file
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "name for the VPC"
  type        = string
  default     = "MYVPC"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "subnet_name" {
  description = "name for the Subnet"
  type        = string
  default     = "MYSUBNET"
}

variable "subnet_count" {
  description = "number of Subnet"
  type        = number
  default     = 2
}



# Bucket.tf file
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "my-tfstate-bucket"
}

variable "folder_key" {
  description = "The key for the S3 bucket folder"
  type        = string
  default     = "tf.state/"
}

variable "folder_source" {
  description = "The source for the S3 bucket folder content"
  type        = string
  default     = "/dev/null"
}



# security
variable "web_sg_name" {
  description = "Name for the web security group"
  type        = string
  default     = "my_snap_web_sg"
}

variable "web_sg_description" {
  description = "Description for the web security group"
  type        = string
  default     = "Allow inbound traffic"
}

variable "web_sg_ingress_port" {
  description = "Ingress port for the web security group"
  type        = number
  default     = 80
}

variable "db_sg_name" {
  description = "Name for the database security group"
  type        = string
  default     = "my_db_sg"
}

variable "db_sg_description" {
  description = "Description for the database security group"
  type        = string
  default     = "Allow inbound MySQL traffic"
}

variable "db_sg_ingress_port" {
  description = "Ingress port for the database security group"
  type        = number
  default     = 3306
}

variable "db_subnet_group_name" {
  description = "Name for the database subnet group"
  type        = string
  default     = "my-db-subnet-group"
}

variable "db_subnet_group_tag_name" {
  description = "Tag name for the database subnet group"
  type        = string
  default     = "MyDBSubnetGroup"
}
