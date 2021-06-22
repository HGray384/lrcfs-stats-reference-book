[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5012718.svg)](https://doi.org/10.5281/zenodo.5012718)

# LRCFS statistics reference book
This is the repository for the [LRCFS statistics reference book](https://lrcfs.dundee.ac.uk/lr-book/). The book is built using the R package [`bookdown`](https://bookdown.org/yihui/bookdown/) with embedded interactive examples from the [LRCFS Interactive Probability and Statistics Application](https://lrcfs.dundee.ac.uk/apps/interactive-lr/) made using [R `shiny`](https://shiny.rstudio.com/) and interactive questions made using [`h5p`](https://h5p.org/) javascript snippets.

## Table of contents
- [LRCFS statistics reference book](#lrcfs-statistics-reference-book)
  - [Table of contents](#table-of-contents)
  - [Folder structure](#folder-structure)
  - [Build instructions for BOOK development](#build-instructions-for-book-development)
  - [Build instructions for SHINY development](#build-instructions-for-shiny-development)
  - [Running the shiny examples within the book in development version](#running-the-shiny-examples-within-the-book-in-development-version)
  - [Common issues](#common-issues)

## Folder structure

To understand the structure of the base directory of this repository, please see the [`bookdown` documentation](https://bookdown.org/yihui/bookdown/). This documentation explains the majority of folders and files found in the base directory.

The `markdown` files which combine to form the chapters of the book can be found in the `./markdown/` folder.

Useful global helper functions and variables for the book can be found in the `./code/` folder.

The `shiny` application that accompanies this book can be found in the `./interactive-shiny/` folder.

The code for the self-hosted `h5p` interactive questions can be found in the `./interactive-questions/` folder.

Any data files used to generate examples in the book is stored in the `./dat/` folder. Please note that this is not currently in use in the live version of the book.
## Build instructions for BOOK development
To build the book on your local machine, first clone or download this repository. Using RStudio open the `stats-reference-book.Rproj` project or and follow the prompts to use `renv` package manager to install the required dependencies.
```
# install renv dependencies
renv::restore()
```

To generate the book in HTML format run the following command or make use of the `build.sh` file.
```
# render the book
rmarkdown::render_site(output_format = 'bookdown::gitbook', encoding = 'UTF-8')
```

##  Build instructions for SHINY development

Part of the code in this repository contains a shiny application with interactive probability and statistics examples. To run this application and its graphical user interface open the `interactive-shiny/interactive-shiny.Rproj` in RStudio and install the dependencies managed by renv.
```
# install renv dependencies
renv::restore()
```

Next select the `/interactive-shiny/app.R` file and select `Run App`  just above the editing panel. 

## Running the shiny examples within the book in development version

The html version of the stats book embeds the `shiny` application within the relevant sections of its text. To make this run correctly, follow the steps above to run the `shiny` application first, preferably in a separate window of RStudio using the `shiny` Rproj file described above. 

Once the shiny application is running, keep it open and copy the http address at the top left of the shiny application, it should look something like `http://127.0.0.1:6319`. This is the location of the running application instance on your local machine. Once this is copied, open the [code/useful-variables.R](code/useful-variables.R) file and paste the location into the `SHINY_HOST` variable. Build the book again with the shiny application still running and now the book will include interactive `shiny` examples. You will need to do this each time you open a new R session as the location of the application will change.

DO NOT PUSH CHANGES MADE TO THE `SHINY_HOST` VARIABLE TO GITHUB. Simply delete the change when you decide to commit any other code.

## Common issues

- Be sure to have the latest versions of R, Rstudio (if that's what you use), bookdown, and the other major packages that this book depends upon. When these packages have major updates, things can break. We use `renv` as a package manager to ensure that all dependencies and the correct versions can be installed automatically. Simply open the .Rproj file and run the command that is prompted by `renv` in the console.

- A failed build will lead to the `stats-reference-book.Rmd` file being created in the base directory. This file needs to be **manually** deleted before the build will work (even after resolving the error which caused the build to fail initially).
