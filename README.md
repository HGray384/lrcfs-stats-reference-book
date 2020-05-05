# LRCFS stats reference book
This is the repository for the reference book.

# Build instructions
To build the book, first clone or download this repository. Open R or RStudio and run the following code:
```
# install bookdown and its dependencies
install.packages("bookdown")

# render the book
rmarkdown::render_site(output_format = 'bookdown::gitbook', encoding = 'UTF-8')
```