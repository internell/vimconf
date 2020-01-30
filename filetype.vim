if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
    au! BufRead,BufNewFile *.tmpl setfiletype tt2html
    au! BufRead,BufNewFile *.tt setfiletype tt2html
    au! BufRead,BufNewFile *.org setfiletype org
augroup END

