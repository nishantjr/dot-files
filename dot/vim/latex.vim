" ===== LaTeX abbreviations ================================================
" Build a aligned environment around the cursor
iabbr $$a $$\begin{aligned}<Return>\end{aligned}$$<Esc>k$a
iabbr ALIGNED \begin{aligned}<Return>\end{aligned}<Esc>k$a
iabbr CASES \begin{cases}<Return>\end{cases}<Esc>k$a
iabbr MATRIX \begin{bmatrix}<Return>\end{bmatrix}<Esc>k$a

iabbr BB  \mathbb
iabbr CAL \mathcal
iabbr SCR \mathscr
iabbr TT  \text

iabbr .:  \therefore

" Use this in aligned env for typesetting the reason for a statement
iabbr COZ &\quad\ldots&\text{

iabbr IMPLIES \Longrightarrow
iabbr IFF \Longleftrightarrow
iabbr INV ^{-1}
iabbr ROOT \sqrt

iabbr eps \epsilon
iabbr PHI \varphi
iabbr ISO \cong

iabbr bbC \mathbb C
iabbr bbN \mathbb Q
iabbr bbR \mathbb R
iabbr bbZ \mathbb Z

iabbr SCR \mathscr
iabbr CAL \mathcal

function! s:abbrSubscripts(letter_string)
    let letters = split(a:letter_string, '\zs')
    let subscripts = split("0123ijkmn", '\zs')
    for l in letters
	for s in subscripts
	    execute ('iabbr '. l . s . ' ' .l. '_'.s)
	endfor
    endfor
endfunction

call s:abbrSubscripts("bcpqruvwxyz")
call s:abbrSubscripts("BCGXYZ")

" Automated deduction
iabbr TERMALG T_{\sigma(X)}
iabbr REWRITESTO \to_{R/B}
iabbr NARROWSTO \leadsto_R
iabbr BMATCHES \sqsupseteq_B
