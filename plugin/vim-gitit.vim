let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:gitit_python_version = 0


if has('python3') 
  let g:gitit_python_version = 3
elseif has('python')
  let g:gitit_python_version = 2
  finish
else
  finish
endif

command! GititCreatePage call GititCreatePage()
function! GititCreatePage()
  execute 'py3file ' . s:path . '/gitit_create_page.py'
endfunc

command! -nargs=1 GititAddCategories call GititAddCategories(<f-args>)
function! GititAddCategories(category)
    let gitit_category = a:category
  execute 'py3file ' . s:path . '/gitit_add_categories.py' 
endfunc

