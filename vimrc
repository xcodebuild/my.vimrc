"{{{ Base
set shell=bash
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set foldmethod=marker
set t_Co=256
"}}}

"{{{ Plugins
    "{{{ Begin of Plug
    call plug#begin('~/.vim/plugged')
    "}}}
    
    "{{{ Plugins
        "{{{ Common
        Plug 'tpope/vim-sensible'
        "}}}
        "{{{ Neo
        Plug 'Shougo/neocomplete.vim'
        Plug 'Shougo/neosnippet'
        Plug 'Shougo/neosnippet-snippets'
        let g:acp_enableAtStartup = 0
        " Use neocomplete.
        let g:neocomplete#enable_at_startup = 1
        " Use smartcase.
        let g:neocomplete#enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
        
        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
                \ }
        
        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'
        
        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplete#undo_completion()
        inoremap <expr><C-l>     neocomplete#complete_common_string()
        
        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
          return neocomplete#close_popup() . "\<CR>"
          " For no inserting <CR> key.
          "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplete#close_popup()
        inoremap <expr><C-e>  neocomplete#cancel_popup()
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        
        " Enable heavy omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
        endif
        let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-k>     <Plug>(neosnippet_expand_target)
        
        " SuperTab like snippets behavior.
        imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: pumvisible() ? "\<C-n>" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
        
        " For snippet_complete marker.
        if has('conceal')
          set conceallevel=2 concealcursor=i
        endif
        "}}}
        "{{{ Appearance
            "{{{ Airline
            Plug 'bling/vim-airline'
            if !exists('g:airline_symbols')
              let g:airline_symbols = {}
            endif

            " unicode symbols
            let g:airline_left_sep = '»'
            let g:airline_left_sep = '▶'
            let g:airline_right_sep = '«'
            let g:airline_right_sep = '◀'
            let g:airline_symbols.linenr = '␊'
            let g:airline_symbols.linenr = '␤'
            let g:airline_symbols.linenr = '¶'
            let g:airline_symbols.branch = '⎇'
            let g:airline_symbols.paste = 'ρ'
            let g:airline_symbols.paste = 'Þ'
            let g:airline_symbols.paste = '∥'
            let g:airline_symbols.whitespace = 'Ξ'

            " powerline symbols
            let g:airline_left_sep = ''
            let g:airline_left_alt_sep = ''
            let g:airline_right_sep = ''
            let g:airline_right_alt_sep = ''
            let g:airline_symbols.branch = ''
            let g:airline_symbols.readonly = ''
            let g:airline_symbols.linenr = ''
 
            "}}}
            Plug 'flazz/vim-colorschemes'
        "}}}
        "{{{ Markdown
        Plug 'godlygeek/tabular'
        Plug 'plasticboy/vim-markdown'
        "}}}
        "{{{ Clang
            "{{{ A nicer highlight
            Plug 'octol/vim-cpp-enhanced-highlight'
            let g:cpp_class_scope_highlight = 1
            let g:cpp_experimental_template_highlight = 1
            "}}}
            "{{{ clang_complete
            Plug 'Shougo/vimproc.vim',{'do':'make'}
            Plug 'osyo-manga/vim-marching'
            let g:marching#clang_command#options = {
            \   "cpp" : "-std=c++11"
            \}
            
            let g:marching_include_paths = [
            \   "/usr/include/c++/4.9/"
            \]
            
            let g:marching_enable_neocomplete = 1
            if !exists('g:neocomplete#force_omni_input_patterns')
              let g:neocomplete#force_omni_input_patterns = {}
            endif
            
            let g:neocomplete#force_omni_input_patterns.cpp =
                \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
            
            set updatetime=200
            
            imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
            
            imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)
            "}}}
        "}}}
    "}}}
    
    "{{{ End
    call plug#end()
    "}}}
"}}}

"{{{ Custom
colorscheme Tomorrow-Night
"}}}
