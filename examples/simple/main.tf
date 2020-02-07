provider "aws" {
  profile = "default"
  region  = "ap-southeast-2"
}

data "aws_ami" "amzn-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.amzn-2.id
  instance_type = "t2.micro"
}
