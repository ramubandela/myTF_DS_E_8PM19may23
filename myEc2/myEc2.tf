
# varibles
variable "region" {
    default = "us-east-2"
}
variable "access_key" {
    default = "AKIAR5TMHQ5UCQ6K6CPX"
}
variable "secret_key" {
    default = "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"
}

variable "myamiid" {
        default = "ami-06c4532923d4ba1ec"
}

variable "instancetype" {
        default = "t2.micro"
}

variable "keyname" {
        default = "myOhiokey"
}



# provider

provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

# Reosources
resource "aws_instance" "myawsintance" {
  ami           = "${var.myamiid}"
  instance_type = "${var.instancetype}"
  key_name      = "${var.keyname}"

  tags = {
    Name = "myawsinstance"
  }
}


# output

output "instance_public_dns" {
  value = "${aws_instance.myawsintance.public_ip}"
}



