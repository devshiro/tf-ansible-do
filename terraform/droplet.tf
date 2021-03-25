resource "digitalocean_droplet" "www-1" {
  image = "ubuntu-18-04-x64"
  name = "www-1"
  region = "fra1"
  size = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [data.digitalocean_ssh_key.ssh_key.id]
}

resource "digitalocean_domain" "default" {
  name = "devshiro.com"
}

resource "digitalocean_record" "www-1" {
  domain = digitalocean_domain.default.name
  type   = "A"
  name   = "www-1"
  value  = digitalocean_droplet.www-1.ipv4_address
}