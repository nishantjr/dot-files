" ===== LaTeX abbreviations ================================================
" Build a aligned environment around the cursor
iabbr <buffer> $$a $$\begin{aligned}<Return>\end{aligned}$$<Esc>k$a
iabbr <buffer> ALIGNED \begin{aligned}<Return>\end{aligned}<Esc>k$a
iabbr <buffer> CASES \begin{cases}<Return>\end{cases}<Esc>k$a
iabbr <buffer> MATRIX \begin{bmatrix}<Return>\end{bmatrix}<Esc>k$a

iabbr <buffer> BB  \mathbb
iabbr <buffer> CAL \mathcal
iabbr <buffer> SCR \mathscr
iabbr <buffer> TT  \text

iabbr <buffer> .:  \therefore

" Use this in aligned env for typesetting the reason for a statement
iabbr <buffer> COZ &\quad\ldots&\text{

iabbr <buffer> IMPLIES \Longrightarrow
iabbr <buffer> IFF \Longleftrightarrow
iabbr <buffer> INV ^{-1}
iabbr <buffer> ROOT \sqrt

iabbr <buffer> eps \epsilon
iabbr <buffer> PHI \varphi
iabbr <buffer> ISO \cong

iabbr <buffer> bbC \mathbb C
iabbr <buffer> bbN \mathbb Q
iabbr <buffer> bbR \mathbb R
iabbr <buffer> bbZ \mathbb Z

iabbr <buffer> SCR \mathscr
iabbr <buffer> CAL \mathcal

function! s:abbrSubscripts(letter_string)
    let letters = split(a:letter_string, '\zs')
    let subscripts = split("0123ijkmn", '\zs')
    for l in letters
	for s in subscripts
	    execute ('iabbr <buffer> '. l . s . ' ' .l. '_'.s)
	endfor
    endfor
endfunction

call s:abbrSubscripts("bcpqruvwxyz")
call s:abbrSubscripts("BCGXYZ")

" Automated deduction
iabbr <buffer> TERMALG T_{\sigma(X)}
iabbr <buffer> REWRITESTO \to_{R/B}
iabbr <buffer> NARROWSTO \leadsto_R
iabbr <buffer> BMATCHES \sqsupseteq_B
