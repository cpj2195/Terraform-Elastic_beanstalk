
provider "aws" {
  region                  = "{your_region_name}"
  shared_credentials_file = "/home/{your_username}/.aws/credentials"
  profile                 = "terraform"
}

module "{your_appname}" {
  source = "./modules/elastic_beanstalk"
  namespace = "${var.namespace}"
  stage = "${var.stage}"
  name = "{your_appname}"
  vpc_id = "{your_vpc_id}"
  public_subnets = ["{your_public_subnetid}"]
  private_subnets = ["{your_private_subnet_id}"]
}
