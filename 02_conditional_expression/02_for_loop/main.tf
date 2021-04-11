locals {
    letters = ["c", "a", "t"] #Stringリスト
    # map
    cat = {
        name = "neko"
        gender = "male"
    }
}

output "upper-case-list" {
    # リストの場合forの前に[]
    value = [ 
        for l in local.letters:
         upper(l)
    ]
}

output "upper-case-map" {
    # mapの場合 forの前に {}
    value = {
        for l in local.cat: l => upper(l)
    }
}
