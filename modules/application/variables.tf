variable ami_id {}

variable default_sg {}

variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type        = "list"
}

variable "region" {}
variable "keyname" {}

/* Not used
data "template_file" "user_data" {
  template = "./application/user-data.tpl"
}
*/

