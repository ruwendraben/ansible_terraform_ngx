provider "aws" {
  access_key = "AKIAQVPYKVJ37DLGAXFQ"
  secret_key = "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"
  region     = "ap-southeast-2"
}

resource "aws_instance" "ansible-tf-excetel" {
  ami           = "ami-039bcff1755c61982"
  instance_type = "t2.micro"
  tags = {
    Name = "webserver_ngx"
  }

}

