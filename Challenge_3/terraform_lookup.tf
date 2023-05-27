variable "my_object" {
  type = map(string)
  default = {
    key1 = "Azure"
    key2 = "Aws"
    key3 = "Gcp"
  }
}

locals {
  get_value =  # Function to get value by key from object
    cloud(object, key) -> string {
      return element(object, key)
    }
}

output "function_output" {
  value = local.get_value(var.my_object, "key2")
}
