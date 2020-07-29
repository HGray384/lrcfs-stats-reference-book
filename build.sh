#!/bin/sh

Rscript -e "options(bookdown.render.file_scope = FALSE); bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
open './output/index.html'