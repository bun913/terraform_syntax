variable "object" {
  #objectはmapと違ってそれぞれ違うタイプを集合体として定義できる
  # mapの場合全て同じタイプでないとならない
  # またアトリビュートは定義しているキーしか使えない
  type = object({
      vpc_name = string
      num_of_subnets = number
      create_igw = bool
  })

  default = {
      vpc_name = "test"
      num_of_subnets = 3
      create_igw = true
  }
}

output "object" {
    value = var.object
}
