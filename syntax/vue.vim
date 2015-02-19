if exists('b:current_syntax')
	finish
endif

if !exists('main_syntax')
	let main_syntax = 'html'
endif

syntax case ignore

syn keyword htmlSpecialTagName contained template

silent! runtime syntax/html.vim
unlet! b:current_syntax

silent! syntax include @jadeSyntax syntax/jade.vim
unlet! b:current_syntax

silent! syntax include @stylusSyntax syntax/stylus.vim
unlet! b:current_syntax

syntax region jadeRegion start=+<template lang="jade">+ end=+</template>+ keepend contains=@jadeSyntax,htmlTag,htmlEndTag
syntax region stylusRegion start=+<style lang="stylus">+ end=+</style>+ keepend contains=@stylusSyntax,htmlTag,htmlEndTag

let b:current_syntax = 'vue'

