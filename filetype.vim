if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
    au! BufRead,BufNewFile *.tmpl setfiletype tt2
    au! BufRead,BufNewFile *.tt setfiletype tt2
augroup END
