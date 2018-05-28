/* Initialization of AWS provider */

# Deploy App in Virginia Region
module "application_virginia" {
  source     = "modules/application/"
  region     = "us-east-1"
  ami_id     = "ami-a4dc46db"
  azs        = ["us-east-1a", "us-east-1b", "us-east-1c"]
  default_sg = "sg-06cefd00513fda0f4"
  keyname    = "jorgehrn-us-east-1"
}

# Deplouy App in Sydney
module "application_sydney" {
  source     = "modules/application/"
  region     = "ap-southeast-2"
  ami_id     = "ami-963cecf4"
  azs        = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  default_sg = "sg-001c7a9fa0fe3c057"
  keyname    = "jorgehrn-ap-southeast-2"
}
