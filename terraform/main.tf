terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }

  backend "remote" {
    organization = "DevShiro"

    workspaces {
      name = "FlashTalkDemo"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "ssh_key" {
  name = "G551JM Notebook"
}

data "digitalocean_domain" "domain" {
  name = "devshiro.com"
}