# TerraFormの基本シンタックス

一般的な言語の関数とTerraFormのブロックの違い

```js
function create_ec2(name, type) {
    ec2 = aws.create_instance(name, type)
    print(ec2.instance_ip)
}
```

TerraFormの場合


```
resource "aws_ec2_instance" "create_ec2" {
    name = "test"
    type = "t2.micro"
}

output "instance_ip" {
    value = aws_ec2_instance.create_ec2.ipv4_address
}
```

`output` で関数呼び出しの返り値のように利用することができる。

`ip_v4`という変数に "aws_ec2_instance" の "create_ec2"というリソースのv4IPアドレスを指定している。

