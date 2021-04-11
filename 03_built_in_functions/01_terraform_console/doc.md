```sh
# start interactive console
$ terraform console

#　リストから最大値をリターン
max(5, 12, 9)
12

#　絶対値をリターン
abs(-12.4)
12.4

#　少数点を捨て、次に大きい整数をリターン
ceil(5.1)
6

# 小文字に変換する
lower("HELLO")
hello

# delimiter(以下の例ではコンマ”,”)を使って、StringをSeparateする
split(",", "foo,bar,baz")
[
  "foo",
  "bar",
  "baz",
]

# substringを取る（２番目にArgは最初のCharのIndex、３番目は最後のCharのIndex）。この場合、１から４番目までのCharsを切り抜く
substr("hello world", 1, 4)
ello

# ２番目のArgument（この場合はスペース” ”）の文字を、Stringの最初と最後から取り除く
trim(" hello   ", " ")
hello

# takes any number of arguments and returns the first one that isn't null or an empty string
# リストの中から、一番最初のNullかEmptyでないアイテムをリターン
coalesce("", "a", "b")
a

# takes two or more lists and combines them into a single list
# 複数のリストを合算
concat(["a", ""], ["b", "c"])
[
  "a",
  "",
  "b",
  "c",
]

# retrieves a single element from a list
# リストから、Argであるインデックスのアイテムをリターン
element(["a", "b", "c"], 1)
b

# リストのリスト（Nestedリスト）を、リストに変換する
flatten([["a", "b", "c"], [], ["c"]])
["a", "b", "c", "c"]

# リストサイズをリターン
length(["a", "b"])
2

# Mapから、２つ目のArgであるKeyのValueをリターンする。もし見つからない場合は、３番目のメッセージをリターン
lookup({a="1", b="2"}, "a", "couldn't find it")
1

lookup({a="1", b="2"}, "c", "couldn't find it")
couldnt find it


$ exit 

$ touch test.txt && echo "hello" > test.txt && cat test.txt
hello

$ terraform console

# 現在いるフォルダー内のファイルを読み込み、Stringとして表示
file("${path.module}/test.txt")
hello
```
