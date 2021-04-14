# LRCFS statistics reference book
This is the repository for the [LRCFS statistics reference book](https://lrcfs.dundee.ac.uk/lr-book/). The book is built using the R package [`bookdown`](https://bookdown.org/yihui/bookdown/) with embedded interactive examples from the [LRCFS Interactive Probability and Statistics Application](https://lrcfs.dundee.ac.uk/apps/interactive-lr/) made using [R `shiny`](https://shiny.rstudio.com/) and interactive questions made using [`h5p`](https://h5p.org/) javascript snippets.

## Table of contents
* [Folder structure](#folder-structure)
* [Accessing the book and shiny application](#accessing-the-book-and-shiny-application)
* [Build instructions](#build-instructions-for-development-version)
* [Running the shiny application in development version](#running-the-shiny-application-in-development-version)
* [Running the shiny examples within the book in development version](#running-the-shiny-examples-within-the-book-in-development-version)
* [Common issues](#common-issues)

## Folder structure

To understand the structure of the base directory of this repository, please see the [`bookdown` documentation](https://bookdown.org/yihui/bookdown/). This documentation explains the majority of folders and files found in the base directory.

The `markdown` files which combine to form the chapters of the book can be found in the ./markdown/ folder.

Useful global helper functions and variables for the book can be found in the ./code/ folder.

The `shiny` application that accompanies this book can be found in the ./interactive-shiny/ folder.

The code for the self-hosted `h5p` interactive questions can be found in the ./interactive-questions/ folder.

Any data files used to generate examples in the book is stored in the ./dat/ folder. Please note that this is not currently in use in the live version of the book.

## Accessing the book and shiny application

The book has three versions in its development life cycle: development, test, and live.

### Development version

This is the version that lives on your local computer. Clone this repository to your local computer using `git clone` or create your own fork of this repository to begin your own local development version of the code.

### Test version

This is the version that lives in this repository and is stored on the LRCFS internal test server. Webhooks automatically sync the code in this repository with the test server. For internal LRCFS access to the test server, the book and shiny application can be accessed in two steps:

1. Connect to the University of Dundee VPN
2. Go to the [test server book](https://lrcfs-shiny.test.dundee.ac.uk/internal/stats-book/), and the [test server app](https://lrcfs-shiny.test.dundee.ac.uk/internal/interactive-stats-book/).
3. Sign in using your UoD login and explore the resources

### Live version

This is the version that can be publicly accessed on the LRCFS website. Here are the links for the [book](https://lrcfs.dundee.ac.uk/lr-book/) and [app](https://lrcfs.dundee.ac.uk/apps/interactive-lr/).

## Build instructions for development version
To build the book on your local machine, first clone or download this repository. Open R or RStudio in the base directory of the folder and run the following code:
```
# install bookdown and its dependencies
install.packages("bookdown")

# render the book
rmarkdown::render_site(output_format = 'bookdown::gitbook', encoding = 'UTF-8')
```

Or, if you use RStudio, install the `bookdown` package as above and then open [stats-reference-book.Rproj](stats-reference-book.Rproj). Go to the Build tab on the top right-hand panel, and click "Build all". If you don't see this option then ensure you have the latest version of R, Rstudio, and `bookdown` installed.

Following these instructions will build the book but will not load the interactive examples from the `shiny` application. To do this you must follow the instructions in the next two sections below.

You can also build the book in both pdf and word formats. To do this, comment/uncomment the relevant code snippets in the [build.sh](build.sh) file.

## Running the shiny application in development version

Part of the code in this repository contains a shiny application with interactive probability and statistics examples. To run this application and its graphical user interface, first install R `shiny` using 
```
# install shiny
install.packages("shiny")
```
Then open the /interactive-shiny/app.R file and run the application. In RStudio, this is done by opening the file and clicking 'Run App' just above the editing panel. 

If you use RStudio, simply open the ./interactive-shiny/interactive-shiny.Rproj file in a new window of RStudio and work with the `shiny` application from there.

## Running the shiny examples within the book in development version

The html version of the stats book embeds the `shiny` application within the relevant sections of its text. To make this run correctly, follow the steps above to run the `shiny` application first, preferably in a separate window of RStudio using the `shiny` Rproj file described above. 

Once the shiny application is running, keep it open and copy the http address at the top left of the shiny application, it should look something like `http://127.0.0.1:6319`. This is the location of the running application instance on your local machine. Once this is copied, open the [code/useful-variables.R](code/useful-variables.R) file and paste the location into the `SHINY_HOST` variable. Build the book again with the shiny application still running and now the book will include interactive `shiny` examples. You will need to do this each time you open a new R session as the location of the application will change.

DO NOT PUSH CHANGES MADE TO THE `SHINY_HOST` VARIABLE TO GITHUB. Simply delete the change when you decide to commit any other code.

## Common issues

- Be sure to have the latest versions of R, Rstudio (if that's what you use), bookdown, and the other major packages that this book depends upon. When these packages have major updates, things can break. We use `renv` as a package manager to ensure that all dependencies and the correct versions can be installed automatically. Simply open the .Rproj file and run the command that is prompted by `renv` in the console.

- A failed build will lead to the `stats-reference-book.Rmd` file being created in the base directory. This file needs to be **manually** deleted before the build will work (even after resolving the error which caused the build to fail initially).

- After making edits to the shiny application /views files, you need to make a final edit in the app.R file before reload the app in order to make the changes appear. If you edit the /models files, then you can just reload the app as normal.

- Viewing new `h5p` examples within the book is not yet possible until they have been added to the live server. We are working on changing this.
