resource "openstack_compute_keypair_v2" "keypair" {
  name       = "ansible-seed"
  public_key = "${var.public_ssh_key}"
}
