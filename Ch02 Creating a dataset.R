#-----------------------------------#
# R in Action (2nd ed): Chapter 2   #
# Creating a dataset                #
#-----------------------------------#

#rows: observations
#columns: variables
#mode:type of object

#Vectors
#Arrays
#Data frames
#Matrix
#list of vectors/arrays/data frames/lists

#  Creating vectors
a <- c(1, 2, 5, 3, 6, -2, 4)
b <- c("one", "two", "three")
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)


# Using vector subscripts
a <- c(1, 2, 5, 3, 6, -2, 4)
a[3]
a[c(1, 3, 5)]
a[2:6]                     


a <- c("k", "j", "h", "a", "c", "m")
a[3]
a[c(1, 3, 5)]
a[2:6]


# Listing 2.1 - Creating Matrices
y <- matrix(1:20, nrow=5, ncol=4)
y
cells    <- c(1,26,24,68)
rnames   <- c("R1", "R2")
cnames   <- c("C1", "C2") 
#fill by row
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE,
                   dimnames=list(rnames, cnames)) 
mymatrix
#fill by column
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=FALSE,
                   dimnames=list(rnames, cnames))
mymatrix


# Listing 2.2 - Using matrix subscripts
x <- matrix(1:10, nrow=2)
x
x[2,]
x[,2]
x[1,4]
x[1, c(4,5)]


# Listing 2.3 - Creating an array
dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2,3,4), dimnames=list(dim1, dim2, dim3))
z


# Listing 2.4 - Creating a dataframe
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata


# Listing 2.5 - Specifying elements of a dataframe
patientdata[1:2] #interesting
patientdata[c("diabetes","status")]
patientdata$age                       

table(patientdata$diabetes, patientdata$status)

#the following 2 codes are the same
summary(mtcars$mpg)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)

attach(mtcars)
summary(mpg)
plot(mpg, disp)
plot(mpg, wt)
detach(mtcars)

#If you need to create objects that will exist outside of the with() construct, use the
#special assignment operator <<- instead of the standard one (<-).
with(mtcars, {
nokeepstats <- summary(mpg)
keepstats <<- summary(mpg)
})

#set patientID as rowname
patientdata <- data.frame(patientID, age, diabetes, status,
row.names=patientID)

# Listing 2.6 - Using factors
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
diabetes <- factor(diabetes) #catergorical
status <- factor(status, order=TRUE) #ordinal categorical
patientdata <- data.frame(patientID, age, diabetes, status)
str(patientdata) #provides information on an object in R                              
summary(patientdata) #provides the minimum, maximum, mean, and quartiles for the continuous variable age, and frequency counts

#set the order of factor
status <- factor(status, order=TRUE,
levels=c("Poor", "Improved", "Excellent"))

# Listing 2.7 - Creating a list
g <- "My First List"
h <- c(25, 26, 18, 39)
j <- matrix(1:10, nrow=5)
k <- c("one", "two", "three")
mylist <- list(title=g, ages=h, j, k)
mylist


# Entering data interactively from the keyboard
mydata <- data.frame(age=numeric(0),
                     gender=character(0), weight=numeric(0))
mydata <- edit(mydata)


# Entering data inline
mydatatxt <- "
age gender weight
25 m 166
30 f 115
18 f 120
"
mydata <- read.table(header=TRUE, text=mydatatxt)


# Importing data from a delimited text file

# First, save the following 4 lines in a file named 
# "studentgrades.csv" in the current working directory
StudentID,First,Last,Math,Science,Social Studies
011,Bob,Smith,90,80,67
012,Jane,Weary,75,,80
010,Dan,"Thornton, III",65,75,70
040,Mary,"O'Leary",90,95,92

# Next, read the data into R using the read.table() function
grades <- read.table("studentgrades.csv", header=TRUE,
                     row.names="StudentID", sep=",")
grades # print data frame
str(grades) # view data frame structure

# Alternatively, import the data while specifying column classes 
grades <- read.table("studentgrades.csv", header=TRUE,
                     row.names="StudentID", sep=",",
                     colClasses=c("character", "character", "character",
                                  "numeric", "numeric", "numeric"))
grades # print data frame
str(grades) # view data frame structure

#change the second variable names
names(patientdata)[2] <- "Age at hospitalization (in years)"

#
#length(object) Number of elements/components.
#dim(object) Dimensions of an object.
#str(object) Structure of an object.
#class(object) Class or type of an object.
#mode(object) How an object is stored.
#names(object) Names of components in an object.
#c(object, object,...) Combines objects into a vector.
#cbind(object, object, ...) Combines objects as columns.
#rbind(object, object, ...) Combines objects as rows.
#object Prints the object.
#head(object) Lists the first part of the object.
#tail(object) Lists the last part of the object.
#ls() Lists current objects.
#rm(object, object, ...) Deletes one or more objects. The statement
#rm(list = ls()) will remove most objects
#from the working environment.
#newobject <- edit(object) Edits object and saves as newobject.
#fix(object) Edits in place.


#odbcConnect(dsn,uid="",pwd="") Open a connection to an ODBC database
#sqlFetch(channel,sqltable) Read a table from an ODBC database into a data frame
#sqlQuery(channel,query) Submit a query to an ODBC database and return the results
#sqlSave(channel,mydf,tablename =sqtable,append=FALSE) Write or update (append=TRUE) a data frame to a table in the ODBC database
#sqlDrop(channel,sqtable) Remove a table from the ODBC database
#close(channel) Close the connection

library(RODBC)
myconn <-odbcConnect("mydsn", uid="Rob", pwd="aardvark")
crimedat <- sqlFetch(myconn, Crime)
pundat <- sqlQuery(myconn, "select * from Punishment")
close(myconn)
