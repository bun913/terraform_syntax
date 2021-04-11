locals {
  is_create_vpc = true
  # ３項演算子のように条件分岐が可能
  # ternaryオペレーターという
  num_of_subnets = local.is_create_vpc == true ? 3 : 0
}

# 結果の出力
output "result" {
  value = local.num_of_subnets
}