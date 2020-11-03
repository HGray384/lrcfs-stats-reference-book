#!/bin/sh

#Generate HTML
Rscript -e "options(bookdown.render.file_scope = FALSE); bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
open './output/index.html'

#Generate PDF
# Rscript -e "options(bookdown.render.file_scope = FALSE); bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
# open './output/stats-reference-book.pdf'

#Generate Word
# Rscript -e "options(bookdown.render.file_scope = FALSE); bookdown::render_book('index.Rmd', 'bookdown::word_document2')"
# open './output/stats-reference-book.docx'

#Generate Ebook
#Rscript -e "options(bookdown.render.file_scope = FALSE); bookdown::render_book('index.Rmd', 'bookdown::epub_book')"
#open './output/stats-reference-book.epub'