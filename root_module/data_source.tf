data "template_file" "webserver" {
  template = file("user_data.sh")
  vars = {
    env = var.env
  }
}