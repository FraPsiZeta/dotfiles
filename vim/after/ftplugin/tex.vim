" Mappings:
"
inoremap <buffer> ,mm <Esc>:wa <bar> !pdflatex %<ENTER>
inoremap <buffer> ,kk <Esc>:wa <bar> !pdflatex % && open %:r.pdf<ENTER>
noremap <buffer> ,mm <Esc>:wa <bar> !pdflatex %<ENTER>
noremap <buffer> ,kk <Esc>:wa <bar> !pdflatex % && open %:r.pdf<ENTER>
inoremap <buffer> ,e \begin{equation}<Enter><Enter>\end{equation}<Esc>ki
inoremap <buffer> ,emp \emph{}<Esc>i
inoremap <buffer> ,bf \textbf{}<Esc>i
inoremap <buffer> ,it \textit{}<Esc>i
inoremap <buffer> ,ee $$<Esc>i
inoremap <buffer> ,lab \label{}<Esc>i
inoremap <buffer> ,beg \begin{}<Esc>i
inoremap <buffer> ,end \end{}<Esc>i
inoremap <buffer> ,sec \section{}<Esc>i
inoremap <buffer> ,ssec \subsection{}<Esc>i
inoremap <buffer> ,sssec \subsubsection{}<Esc>i
inoremap <buffer> ,cha \chapter{}<Esc>i
inoremap <buffer> ,fig \begin{figure}[ht]<Enter>\centering<Enter>\makebox[\textwidth][c]{\includegraphics[width=12cm]{Immagini/.jpg}}<Enter>\caption{<Space>}<Enter>\label{<Spa
ce>}<Enter>\end{figure}<Esc>3k$5hi
inoremap <buffer> ,item \begin{itemize}<Enter>\itemsep-1mm<Enter>\item<Space><Enter>\end{itemize}<Esc>kA
inoremap <buffer> ,flalign \begin{flalign}<Enter><Space>&&<Enter>\end{flalign}<Esc>kI
inoremap <buffer> ,ffig \begin{figure}[ht]<Enter>\centering<Enter>\begin{subfigure}{.5\textwidth}<Enter><Space>\centering<Enter><Space><Space>\includegraphics[width=1.\linewidth]{Immagini/.jpg}<Enter><Space><Space>\caption{<Space>}<Enter><Space><Space>\label{<Space>}<Enter>\end{subfigure}%<Enter>\begin{subfigure}{.5\textwidth}<Enter><Space><Space>\centering<Enter><Space><Space>\includegraphics[width=1.\linewidth]{Immagini/.jpg}<Enter><Space><Space>\caption{<Space>}<Enter><Space><Space>\label{<Space>}<Enter>\end{subfigure}<Enter>\caption{<Space>}<Enter>\label{<Space>}<Enter>\end{figure}<Esc>12k$4hi                                                                                                

