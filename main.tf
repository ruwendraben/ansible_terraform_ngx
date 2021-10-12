provider "aws" {
  access_key = "AKIAQVPYKVJ3THKNYAF2"
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

