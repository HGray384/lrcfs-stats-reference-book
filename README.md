# LRCFS stats reference book for judges
This is the repository for the reference book.

## Build instructions
To build the book, first clone or download this repository. Open R or RStudio and run the following code:
```
# install bookdown and its dependencies
install.packages("bookdown")

# render the book
rmarkdown::render_site(output_format = 'bookdown::gitbook', encoding = 'UTF-8')
```

Or, if you use RStudio, open [stats-reference-book.Rproj](stats-reference-book.Rproj), go to the Build tab on the top right panel, and "Build Book".