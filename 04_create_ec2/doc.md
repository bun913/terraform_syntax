# TerraFormベストプラクティスなフォルダ構成

公式サイトから引用するディレクトリの標準構造

- https://www.terraform.io/docs/language/modules/develop/index.html#standard-module-structure
- https://qiita.com/bigwheel/items/2b420183639416b5c6bb

```
.
├── examples
│   └── basic
│       └── main.tf  [可能な限り] このモジュールのミニマムな使用例を書きます
|                                何も変更せずともこのbasicディレクトリで
|                                terraform init && terraform apply が通るようにします
├── modules          [必要に応じて] ネストしたモジュール(このモジュール内でのみ使用するモジュール)はここで宣言します
│   ├── master-nodes [必要に応じて]
│   └── worker-nodes [必要に応じて]
├── LICENSE          [必要に応じて] 公開モジュールの場合は必ず置きましょう
├── README.md        [必須] モジュールの概要と用途を書きます。場合によっては図を含めましょう
|                           使用例は examples/basic 以下に実際に動くコードとして書き、
|                           ここからはリンクするにとどめたほうがよいです
|── variables.tf     [必須] 何もvariableがない場合でも空のファイルを作ります。
|                           またvariableのdescriptionは必ず書きます。
|                           単にリソースのargumentへ引き回しており自明に思えるときは
|                           https://www.terraform.io/docs/providers/aws/r/instance.html#ami
|                           などそのargument項目へのリンクを書くと良いです。
├── main.tf          [必須] 基本的にはここへリソース宣言を置きます。
├── another.tf       [必要に応じて] main.tfが長くなりすぎた場合はRoot Moduleと同じく
|                                 種別ごとにtfファイルを分けて書きます。
└── outputs.tf       [必須] 何もoutputがない場合でも空のファイルを作ります。
                            またoutputのdescriptionは必ず書きます。
                            単にリソースのoutputを引き回しており自明に思えるときは
                            https://www.terraform.io/docs/providers/aws/r/instance.html#id
                            などそのoutput項目へのリンクを書くと良いです。
```

今回の学習でも

`outputs.tf` と　`variables.tf` を作成している

variables.tfでvariablesの宣言を行い、固定値は terraform.tfvarsでデフォルト値を設定している。

また、`provider`ブロックはルートにprovider.tfとして記載しておく。(main.tfの中に記載しない)

