resource "aws_instance" "app1" {
  instance_type = "t2.nano"
  ami           = "ami-0aa7d40eeae50c9a9"
  tags = {
    "team"       = "app-team-4"
    "costcentre" = "engineering"
  }
}

resource "aws_s3_bucket" "iac-bucket" {
  bucket = "iac-main-bucket-roj"
}

variable "myvar" {
  description = "alwaus testing"
  type        = string
}

output "app1" {
  value = aws_instance.app1.id
}

output "secretinfo" {
  value     = "the value"
  sensitive = true
}

output "varvalue" {
  value     = var.myvalue
}
