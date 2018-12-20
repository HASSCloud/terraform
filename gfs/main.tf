resource "openstack_blockstorage_volume_v2" "volume" {
  count             = "${var.num_instances}"
  name              = "gfs-vol-${count.index}"
  size              = "${var.volume_size}"
  availability_zone = "${var.availability_zone}"
}

resource "openstack_compute_instance_v2" "instance" {
  count             = "${var.num_instances}"
  name              = "gfs-node-${count.index}"
  image_name        = "NeCTAR CentOS 7 x86_64"
  flavor_name       = "m2.medium"
  key_pair          = "${openstack_compute_keypair_v2.keypair.name}"
  security_groups   = ["kubenode", "http"]
  availability_zone = "${var.availability_zone}"

  metadata {
    groups = "kube-node,gluster"
    role   = "gluster"
  }

  network {
    name = "hasstinker"
  }
}

resource "openstack_compute_volume_attach_v2" "volume_attach" {
  count       = "${var.num_instances}"
  instance_id = "${element(openstack_compute_instance_v2.instance.*.id, count.index)}"
  volume_id   = "${element(openstack_blockstorage_volume_v2.volume.*.id, count.index)}"
}
