if exists("b:current_syntax")
  finish
endif

syntax keyword potionKeyword to times
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return

syntax keyword potionFunction print join string

syntax match potionComment "\v#.*$"
syntax match potionOperator "\v\*\=?"
syntax match potionOperator "\v\/="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v/"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v\?"

highlight link potionKeyword Keyword
highlight link potionFunction Function
highlight link potionComment Comment
highlight link potionOperator Operator

let b:current_syntax = "potion"