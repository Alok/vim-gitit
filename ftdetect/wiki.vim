if !exists('g:gitit_dir_location')
    let g:gitit_dir_location = '~/wiki/wikidata'
endif

autocmd BufRead,BufNewFile g:gitit_dir_location/*.md setlocal filetype=wiki.pandoc
