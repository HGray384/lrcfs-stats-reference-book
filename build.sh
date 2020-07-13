#!/bin/sh

Rscript -e "options(bookdown.render.file_scope = FALSE); bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "browseURL('output/index.html')"
