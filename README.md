# LRCFS stats reference book for judges
This is the repository for the reference book.

## Build instructions
To build the book, first clone or download this repository. Open R or RStudio in the base directory of the folder and run the following code:
```
# install bookdown and its dependencies
install.packages("bookdown")

# render the book
rmarkdown::render_site(output_format = 'bookdown::gitbook', encoding = 'UTF-8')
```

Or, if you use RStudio, install the bookdown package as above and then open [stats-reference-book.Rproj](stats-reference-book.Rproj). Go to the Build tab on the top right-hand panel, and click "Build all".

## To run the shiny application

Part of the code in this repository contains a shiny application with interactive probability and statistics examples. To run this application and its graphical user interface, first install R shiny using 
```
# install shiny
install.packages("shiny")
```
Then open the /interactive-shiny/app.R file and run the application. In RStudio, this is done by opening the file and clicking 'Run App' just above the editing panel. 

## To run the interactive examples within the book

The html version of the stats book embeds the shiny application within the relevant sections of its text. To make this run correctly, follow the steps above to run the shiny application first. 

Once the shiny application is running, copy the http address at the top left of the shiny application, it should look something like "http://127.0.0.1:6319". This is the location of the application on your local machine. Once this is copied, open the /code/useful-variables.R file and paste the location into the assignment of variable `SHINY_HOST`. Build the book again with the shiny application still running and now the book will include interactive shiny examples. You will need to do this each time you open a new R session for the book as the location of the application will change.

DO NOT PUSH CHANGES MADE TO THE `SHINY_HOST` VARIABLE TO GITHUB.

## Common issues

- Be sure to have the latest updates for R, Rstudio (if that's what you use), bookdown, and the other major packages that this book depends upon. When these packages have major updates, things can break. We are working on an efficient way to manage the required packages and their versions so that you don't have to.

- A failed build will lead to the `stats-reference-book.Rmd` file being created in the base directory. This file needs to be **manually** deleted before the build will work (even after resolving the error which caused the build to fail initially).

- After making edits to the shiny application /views files, you need to make a final edit in the app.R file before reload the app in order to make the changes appear. If you edit the /models files, then you can just reload the app as normal.