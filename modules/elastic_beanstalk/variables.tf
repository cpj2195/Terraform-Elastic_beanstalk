variable "namespace" {
  type        = "string"
  description = "Namespace, which could be your organization name/project

variable "stage" {
  type        = "string"
  description = "Stage, e.g. 'prod', 'staging', 'dev', or 'test'"
}

variable "name" {
  default     = "app"
  description = "Solution name"
}

variable "app_description" {
  default     = ""
  description = "Short description of the Application"
}

variable "env_description" {
  default     = ""
  description = "Short description of the Elastic beanstalk Environment"
}

variable "tier" {
  default     = "WebServer"
  description = "Elastic Beanstalk Environment tier, e.g. ('WebServer', 'Worker')"
}

variable "solution_stack_name" {
  default     = "64bit Amazon Linux 2018.03 v2.7.6 running Python 3.6"
  description = "Elastic Beanstalk stack, e.g. Docker, Python, Node, Java, IIS. [Read more](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html)"
}

###--------------------** Logs to cloudwatch ** -----------------###

variable "enable_stream_logs" {
  default     = true
  description = "Whether to create groups in CloudWatch Logs for proxy and deployment logs, and stream logs from each instance in your environment."
}

variable "logs_delete_on_terminate" {
  default     = true
  description = "Whether to delete the log groups when the environment is terminated. If false, the logs are kept RetentionInDays days."
}

variable "logs_retention_in_days" {
  default     = "7"
  description = "The number of days to keep log events before they expire."
}

###-------------------** Load balancer **------------------###

variable "loadbalancer_type" {
  default     = "classic"
  description = "Load Balancer type, e.g. 'application' or 'classic'"
}

variable "loadbalancer_certificate_arn" {
  default     = ""
  description = "Load Balancer SSL certificate ARN. The certificate must be present in AWS Certificate Manager"
}

variable "loadbalancer_security_groups" {
  type        = "list"
  default     = []
  description = "Load balancer security groups"
}

variable "http_listener_enabled" {
  default     = "true"
  description = "Enable port 80 (http)"
}


###------------------------** VPC & Subnets **--------------------###

variable "vpc_id" {
  description = "ID of the VPC in which to provision the AWS resources"
}

variable "public_subnets" {
  type        = "list"
  description = "List of public subnets to place Elastic Load Balancer"
}

variable "private_subnets" {
  type        = "list"
  description = "List of private subnets to place EC2 instances"
}

variable "root_volume_size" {
  default     = "8"
  description = "The size of the EBS root volume"
}

variable "root_volume_type" {
  default     = "gp2"
  description = "The type of the EBS root volume"
}

variable "availability_zones" {
  default     = "Any 2"
  description = "Choose the number of AZs for your instances"
}

variable "updating_min_in_service" {
  default     = "1"
  description = "Minimum count of instances up during update"
}

variable "ssh_source_restriction" {
  default     = "0.0.0.0/0"
  description = "Used to lock down SSH access to the EC2 instances."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Instances type"
}

variable "associate_public_ip_address" {
  default     = "true"
  description = "Specifies whether to launch instances in your VPC with public IP addresses."
}

variable "autoscale_measure_name" {
  default     = "CPUUtilization"
  description = "Metric used for your Auto Scaling trigger"
}

variable "autoscale_statistic" {
  default     = "Average"
  description = "Statistic the trigger should use, such as Average"
}

variable "autoscale_unit" {
  default     = "Percent"
  description = "Unit for the trigger measurement, such as Bytes"
}

variable "autoscale_lower_bound" {
  default     = "20"
  description = "Minimum level of autoscale metric to remove an instance"
}

variable "autoscale_lower_increment" {
  default     = "-1"
  description = "How many Amazon EC2 instances to remove when performing a scaling activity."
}

variable "autoscale_upper_bound" {
  default     = "80"
  description = "Maximum level of autoscale metric to add an instance"
}

variable "autoscale_upper_increment" {
  default     = "1"
  description = "How many Amazon EC2 instances to add when performing a scaling activity"
}

variable "autoscale_min" {
  default     = "1"
  description = "Minumum instances in charge"
}

variable "autoscale_max" {
  default     = "3"
  description = "Maximum instances in charge"
}

variable "wait_for_ready_timeout" {
  default = "20m"
}


###-------------** ** --------------###

# From: http://docs.aws.amazon.com/general/latest/gr/rande.html#elasticbeanstalk_region
# Via: https://github.com/hashicorp/terraform/issues/7071
variable "alb_zone_id" {
  type = "map"

  default = {
    ap-northeast-1 = "Z1R25G3KIG2GBW"
    ap-northeast-2 = "Z3JE5OI70TWKCP"
    ap-south-1     = "Z18NTBI3Y7N9TZ"
    ap-southeast-1 = "Z16FZ9L249IFLT"
    ap-southeast-2 = "Z2PCDNR3VC2G1N"
    ca-central-1   = "ZJFCZL7SSZB5I"
    eu-central-1   = "Z1FRNW7UH4DEZJ"
    eu-west-1      = "Z2NYPWQ7DFZAZH"
    eu-west-2      = "Z1GKAAAUGATPF1"
    sa-east-1      = "Z10X7K2B4QSOFV"
    us-east-1      = "Z117KPS5GTRQ2G"
    us-east-2      = "Z14LCN19Q5QHIC"
    us-west-1      = "Z1LQECGX5PH1X"
    us-west-2      = "Z38NKT9BP95V3O"
    eu-west-3      = "ZCMLWB8V5SYIT"
  }

  description = "ALB zone id"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "env_default_key" {
  default     = "DEFAULT_ENV_%d"
  description = "Default ENV variable key for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}

variable "env_default_value" {
  default     = "UNSET"
  description = "Default ENV variable value for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}

variable "env_vars" {
  default     = {}
  type        = "map"
  description = "Map of custom ENV variables to be provided to the Jenkins application running on Elastic Beanstalk, e.g. `env_vars = { JENKINS_USER = 'admin' JENKINS_PASS = 'xxxxxx' }`"
}

variable "version_label" {
  default     = ""
  description = "Elastic Beanstalk Application version to deploy"
}
