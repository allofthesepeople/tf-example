resource "aws_instance" "app1" {
  instance_type = "t2.nano"
  ami           = "ami-0aa7d40eeae50c9a9"
  tags = {
    "team"       = "app-team"
    "costcentre" = "engineering"
  }
}

resource "aws_s3_bucket" "iac-bucket" {
  bucket = "iac-main-bucket"
}

output "app1" {
  value = aws_instance.app1.id
}
