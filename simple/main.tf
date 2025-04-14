resource "aws_instance" "app1" {
  instance_type = "t2.micro"
  ami           = "ami-0aa7d40eeae50c9a9"
  tags = {
    "team"       = "app-team-4"
    "costcentre" = "engineering"
  }
}

resource "aws_s3_bucket" "iac-bucket" {
  bucket = "iac-main-bucket-roj"
}

output "app1" {
  value = aws_instance.app1.id
}

output "secretinfo" {
  value     = "the value"
  sensitive = true
}
