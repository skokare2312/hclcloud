resource "tls_private_key" "keypair" {

  algorithm = "RSA"

  rsa_bits  = 4096

}

resource "aws_key_pair" "keypair" {

  key_name   = "thinknyxkeypair"

  public_key = tls_private_key.keypair.public_key_openssh

  tags       = local.tags

}

resource "aws_instance" "aws_instance" {

  ami                           = "ami-0e62a7626e25342b2"

  instance_type                 = "t2.micro"

  key_name                      = aws_key_pair.keypair.key_name

}
