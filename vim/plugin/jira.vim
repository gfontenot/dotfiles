function! g:jira#transform(word)
  for pattern in g:jira_patterns
    let l:match = matchstr(a:word, pattern)
    if l:match != ""
      return g:jira_root_domain . l:match
    endif
  endfor
endfunction
