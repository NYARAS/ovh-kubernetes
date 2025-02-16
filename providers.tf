terraform {

  backend "s3" {
    bucket                      = "nsw-main-terraform-state"
    key                         = "prod-terraform"
    region                      = "de"
    endpoint                    = "https://s3.de.io.cloud.ovh.net/"
    skip_credentials_validation = true
    skip_region_validation      = true

    ### variables not allowed
    # access_key = "9e168566e71a4aeb9f5368d4b453c9f2"
    # secret_key = "b21d8cc2b35e40e9a4c29b4c5371a690"
  }

  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.27.0"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.49.0"
    }
  }
  required_version = "~> 1.5.3"
}

provider "ovh" {
  endpoint           = "ovh-eu"                                        # or OVH_ENDPOINT
  application_key    = var.ovh_application_key    # or OVH_APPLICATION_KEY
  application_secret = var.ovh_application_secret # or OVH_APPLICATION_SECRET
  consumer_key       = var.ovh_consumer_key       # or OVH_CONSUMER_KEY
}

# inspired by https://breadnet.co.uk/terraform-ovh-openstack/
# and https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs
provider "openstack" {
  auth_url            = "https://auth.cloud.ovh.net/v3/"            # Authentication URL
  domain_name         = "default"                                   # Domain name - Always at 'default' for OVHcloud
  region              = var.region                                  # or OS_REGION_NAME
  user_domain_name    = "Default"                                   # or OS_USER_DOMAIN_NAME
  project_domain_name = "Default"                                   # or OS_PROJECT_DOMAIN_NAME
  tenant_id           = var.project_id         # or OS_TENANT_ID / OS_PROJECT_ID
  tenant_name         = var.openstack_tenant   # or OS_TENANT_NAME / OS_PROJECT_NAME
  user_name           = var.openstack_user     # or OS_USERNAME
  password            = var.openstack_password # or OS_PASSWORD
}

