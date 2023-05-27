variable "my_object" {
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}

locals {
  get_value =  # Function to get value by key from object
    lambda(object, key) -> string {
      return element(object, key)
    }
}

output "function_output" {
  value = local.get_value(var.my_object, "key2")
}
