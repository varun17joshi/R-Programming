########
#Help and Documentation 
########
help.start()   # general help
help(foo)      # help about function foo
?foo           # same thing 

??foo
apropos("foo") # list all functions containing string foo
example(foo)   # show an example of function foo

# search for foo in help manuals and archived mailing lists
RSiteSearch("foo")

# get vignettes on using installed packages
vignette()      # show available vingettes
vignette("foo") # show specific vignette

#####Package Management in R

sessionInfo() # Get the loaded packages and session info

packageVersion("base")
packageVersion("snow")


"base" %in% loadedNamespaces()
##to know which packages are installed in the system
packinfo <- installed.packages(fields = c("Package", "Version"))
packinfo[,c("Package", "Version")]

###TO install a package in R

install.packages('forecast')

##
