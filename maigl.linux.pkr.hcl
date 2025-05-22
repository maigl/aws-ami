packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "dreggn" {
    ami_name      = "dreggn-maigl-{{timestamp}}"
    # we would like to use this instance size
    instance_type = "m6a.xlarge"

    ssh_username   = "ubuntu"
    communicator   = "ssh"

    source_ami_filter {
      filters = {
        name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
        root-device-type    = "ebs"
      }
      most_recent = true
      owners   = ["amazon", "099720109477"]
    }

    launch_block_device_mappings {
      device_name           = "/dev/sda1"
      volume_size           = 50
      volume_type           = "gp3"
      delete_on_termination = false

      # actually we also want encryption but I disabled it to have a minimal test
      encrypted  = false
    }
}

build {
  sources = ["source.amazon-ebs.dreggn"]

  provisioner "shell" {
    inline = [
      "echo 'Hello, World!'"
    ]
  }
}
