resource "null_resource" "example" {
  triggers = {
    message = "iac is alive"
  }
}