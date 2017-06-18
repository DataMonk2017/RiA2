#------------------------------------#
# R in Action (2nd ed): Chapter 1    #
# Introduction to R                  #
#------------------------------------#

#General help.
help.start()

#Help on function read.csv (the quotation marks are optional).
?read.csv
help('read.csv')


data()#List all available example datasets contained in currently loaded packages.
vignette()#List all available vignettes for currently installed packages.
vignette('FAQ')#Display specific vignettes for topic 'FAQ'.


getwd()#List hte current working directory.
setwd('my directory')#Change the current working directory to my directory.
ls()#List the objects in the current workspace
rm(objectlist) #Remove(delete) one or more objects
help(options)#learn about available options
options()#View or set current options.


#history(#)#Display your last # commands (default=25)
savehistory('myfile')#Save the commands history to myfile (default = .Rhistory)
loadhistory('myfile')#Reload a command's history(default = .Rhistory)
save.image('myfile')#Save the workspace to my file (default =.RData)
save(objectlist,file = 'myfile')#save specific objects to a file
load("my file")#load a workspace into the currrent seesion
q()#quit R

#fuctions for saving graphic output
pdf("filename.pdf") #PDF file
win.metafile("filename.wmf") #Windows metafile
png("filename.png") #PBG file
jpeg("filename.jpg") #JPEG file
bmp("filename.bmp") #BMP file
postscript("filename.ps") #PostScript file


# A sample R session
# q() is commented out so you don't accidently exit

# Listing 1.1 - A Sample R session

age <- c(1,3,5,2,11,9,3,9,12,3)
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
mean(weight)
sd(weight)
cor(age,weight)
plot(age,weight)
# q()


# Listing 1.2 - An example of commands used to manage the R Workspace. 

setwd("C:/myprojects/project1") # change the path to one of your directories
options()
options(digits=3)
x <- runif(20)
summary(x)
hist(x)
savehistory()
save.image()
# q()


# Listing 1.3 - Working with a new package

help.start()
install.packages("vcd")
help(package="vcd")
library(vcd)
help(Arthritis)
Arthritis
example(Arthritis)
# q()

source("script1.R")
sink("myoutput",append=True, split=True)
pdf('mygraphs.pdf')
scource('script2.R')
sink()
dev.off()
source('script3.R')
