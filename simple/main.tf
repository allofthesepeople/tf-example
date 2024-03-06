resource "aws_instance" "app1" {
  instance_type = "t2.micro"
  ami           = "ami-0aa7d40eeae50c9a9"
  tags = {
    "team"       = "app-team"
    "costcentre" = "engineering"
  }
}

resource "aws_s3_bucket" "iac-bucket" {
  bucket = "iac-main-bucket-roj"
  tags = {
    "team"       = "app-team"
    "costcentre" = "engineering"
  }
}

output "app1" {
  value = aws_instance.app1.id
}
