# "aws_instance"というタイプのresourceを定義し、 そのリソースに"web"というローカルネームをつける
# 以下はVPC, security_group / subnetなどを全く指定していないため環境によりapply失敗する(default vpcの設定等)
resource "aws_instance" "web" {  # <----- function create_ec2(name, type)のTerraformのSyntax

  # aws_instance resourceのArguments
  ami           = "ami-0992fc94ca0f1415a"
  instance_type = "t2.micro"
}

# local nameはユニークでなければいけない（"web"は再定義不可）
resource "aws_instance" "app" { # <----- 同じfunction aws_instance()のAlias/local nameの"web"は上に定義されているので、使用不可。違う名前の"app"にする　
  ami           = "ami-0992fc94ca0f1415a"
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
