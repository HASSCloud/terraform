# HASSCloud Terraform

[Terraform](https://www.terraform.io/) configuration for HASSCloud / Tinker
infrastructure. This repository currently contains Terraform HCL for the
following resources:

- GlusterFS Nodes

If you have not used Terraform before please read one of the following guides:

- [A Comprehensive Guide to TerraForm](https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca)
- [Getting Started](https://learn.hashicorp.com/terraform/getting-started/)

## Usage

Clone this repo:

```#!bash
$ git clone https://github.com/HASSCloud/terraform
$ cd Terraform
```

Initialize Terraform:

```#!bash
$ terraform init
```

## Workflows

### Creating resources

- Create a directory for your resources to house your new Terraform HCL
  configuration files.
- Then run:

```#!bash
$ terraform plan
$ terraform apply -var-file=<var-file>
```

## Modifying Resources

- Make changes to the Terraform HCL configuration files of the resources you
  wish to modify
- Then run:

```#!bash
$ terraform plan
$ terraform apply -var-file=<var-file>
```

## Deleting Resources

```#!bash
$ cd <resource>
$ terraform destroy
```

## Managing State

Right now state is managed directly in this repository so after making changes
to the infrastructure you **should** also commit the changes to the `*.tfstate`
files. Ideally you should do this in a Pull-Request with an Approval from
one or more Reviewers.

**NOTE:** Because we are not using a shared
[Remote State](https://www.terraform.io/docs/state/remote.html) it is entirely
possible and highly likely that in a team environment one or more engineers
may well cause conflicts. In that case it is recommended that state be moved
to a "central" and "shared" location that supports locking. For the moment
this issue can be managed with good communication.
