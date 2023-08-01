terraform {
  cloud {
    organization = "mushroomhat"

    workspaces {
      name = "Siren"
    }
  }
}

provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = var.region
}

module "s3" {
    source = ".//s3"
    bucket_name = var.bucket_name      
}

module "vpc" {
    source = ".//vpc"
}


module "elb" {
    source = ".//elb"
    mainVPC_id  = module.vpc.mainVPC_id
    subnet01_id = module.vpc.subnet01_id
    subnet02_id = module.vpc.subnet02_id
    internet_gateway_id = module.vpc.internet_gateway_id
    default_security_group_id = module.vpc.default_security_group_id

}
