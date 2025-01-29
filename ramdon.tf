#--random/main--

resource "random_string" "unique_suffix" {
  length  = 3
  special = false
}