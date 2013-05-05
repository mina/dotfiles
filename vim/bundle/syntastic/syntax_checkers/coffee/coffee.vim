"============================================================================
"File:        coffee.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Lincoln Stoll <l@lds.li>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
function! SyntaxCheckers_coffee_coffee_IsAvailable()
    return executable("coffee")
endfunction

function! SyntaxCheckers_coffee_coffee_GetLocList()
    let makeprg = syntastic#makeprg#build({
                \ 'exe': 'coffee',
                \ 'args': '-c -l -o /tmp' })
    let errorformat =  'Syntax%trror: In %f\, %m on line %l,%EError: In %f\, Parse error on line %l: %m,%EError: In %f\, %m on line %l,%W%f(%l): lint warning: %m,%-Z%p^,%W%f(%l): warning: %m,%-Z%p^,%E%f(%l): SyntaxError: %m,%-Z%p^,%-G%.%#'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'coffee',
    \ 'name': 'coffee'})
