#read in and extract the data we need

shelter<-read.csv('train.csv',header=TRUE)
shelter<-shelter[ ,c(4,6,8,9)]

#----------------------------------
# check data quality

sum(is.na(shelter$OutcomeType))
sum(is.na(shelter$AnimalType))
sum(is.na(shelter$AgeuponOutcome))
sum(is.na(shelter$Breed))

#-------------------------------
#coding our columns

shelter$dog<-1
rows<-which(shelter$AnimalType == 'Cat')
shelter$dog[rows]<-0
shelter$AnimalType<-NULL

shelter$outcome<-1
rows<-which(shelter$OutcomeType != 'Adoption')
shelter$outcome[rows]<-0
shelter$OutcomeType<-NULL

shelter$age<-1
rows<-which(str_detect(shelter$AgeuponOutcome,'year'))
shelter$age[rows]<-0
shelter$AgeuponOutcome<-NULL

shelter$pb<-1
rows<-which(!str_detect(shelter$Breed,'Pit Bull'))
shelter$pb[rows]<-0
shelter$Breed<-NULL
