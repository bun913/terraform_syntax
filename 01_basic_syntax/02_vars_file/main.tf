# variableブロックを使って、image_idという変数の名前を定義する
variable "image_id" {
  type = string # [string, number, bool]
  description = "The id of the machine image (AMI) to use for the server." # 任意
  default = "ami-abc123" # 任意のDefault値
  # sensitive = true # 任意, これを設定すると、Terraform planやapplyコマンドのアウトプットに値が表示されなくなる
}

# "aws_instance"というタイプのresourceを定義し、 そのリソースに"web"というローカルネームをつける
resource "aws_instance" "web" {
  # aws_instance resourceのArguments
  ami           = var.image_id
  instance_type = "t2.micro"
}


## 最低限必要なAWS Config (AWS CLIで”aws config”を実行して、Region、Access Keyなどを設定するのと同じ) ##
variable "aws_region" {
  default = "ap-northeast-1"
}
variable "aws_profile" {
  # type = string
  # ここではあらかじめ~/.aws/configに指定するprofileを記載している必要がある
  default = "default"
}
provider "aws" {
    #　Access keyを使ってもよいが、AWSのProfileの方が便利且つ、Secret Access Keyを間違ってGitにコミットしてしまう恐れがなく安全。
    region = var.aws_region
    profile = var.aws_profile
    version = "~> 3.33.0"
}
