module "terminal" {
  source = "./modules/terminal"

  instance_name = var.instance_name
  ami           = var.ami  # Replace with the desired AMI ID
  instance_type = var.instance_type             
  subnet_id     = var.subnet_id
  env           = var.env          
  instance_count = 1                     
  vpc           = var.vpc          
  associate_public_ip_address = true 
  
  iam_instance_profile = module.iam.profile

}    
module "adserver" {
  source = "./modules/adserver"
  ad_instance_name = var.ad_instance_name
  ami           = var.ami  # Replace with the desired AMI ID
  instance_type = var.instance_type             
  subnet_id     = var.subnet_id
  ad_env           = var.ad_env          
  instance_count = 1                     
  ad_vpc           = var.ad_vpc          
  associate_public_ip_address = true 
  iam_instance_profile = module.iam.profile
}    

module "iam" {
  source = "./modules/iam"

  iam_role_name          = var.iam_role_name
  iam_instance_profile_name = var.iam_instance_profile_name

}

# main.tf

module "cloudwatch" {
  source        = "./modules/cloudwatch"
  instance_ids  = ["module.terminal.instance_id", "module.adserver.instance_id"]
  alarm_names   = ["terminalserverCPUalarm","adserverCPUalarm"]
  period        = 300
  threshold     = 80
}

