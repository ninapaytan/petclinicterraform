output "For_connecting_to_web_page_use" {
  description = "instance DNS name for connecting to web page"
  value = "${module.compute.ws-petclinic-ip}:8080"
}