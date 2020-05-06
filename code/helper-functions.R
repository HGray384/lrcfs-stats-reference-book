#Clear all lists from memory to avoid unintentional errors
#rm(list = ls())
#Create helper function to check for package and install/load if necessary
#https://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them
needPackages = function(...) {
  requiredLibraries = unlist(list(...)); #Get the list of required libraries from the method parameters
  requireResults = unlist(lapply(requiredLibraries,require,character.only=TRUE)); #Run the "require" method of each package and save the result (using the character.only flag allows you to search by passing in a variable)
  missingLibraries = requiredLibraries[requireResults==FALSE]; #Store the missing libraries where the results of the "require" method are false 
  if(length(missingLibraries > 0)) #If we have any missing libraries
  {
    install.packages(missingLibraries,repos="https://cloud.r-project.org/"); #Install the packages that are missing
    lapply(missingLibraries,library,character.only=TRUE) #Once installed then run the library function to register them
  }
}