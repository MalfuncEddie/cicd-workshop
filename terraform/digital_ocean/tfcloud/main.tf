# This will provision the elements in the terraform cloud platform

terraform {

  required_version = ">= 1.2.0"

  required_providers {
    tfe = {
      version = "~> 0.41.0"
    }
  }
}

resource "tfe_organization" "org" {
  name  = var.org_name
  email = var.org_email
}

resource "tfe_workspace" "ws_iac_do_k8s" {
  name         = var.workspace_name
  organization = var.org_name
  execution_mode = var.execution_mode
  tag_names    = ["k8s_cluster", "cicd-workshop"]
}

resource "tfe_workspace" "ws_do_k8s_deploy" {
  name         = "${var.workspace_name}-deployment"
  organization = var.org_name
  execution_mode = var.execution_mode
  tag_names    = ["k8s_deployment", "cicd-workshop-app"]
}