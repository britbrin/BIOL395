library(readr)
library(raster)
library(rgdal)
library(ggplot2)
# download packages 

hurliang <- read_csv("~/Desktop/SeniorSpring/BIOL395/GitHub/Vireo-olivaceus/uniq_ads_CI_grid_ids_tmin.csv")
View(hurliang)
# import HurlbertLiang2012 dataset

myspecies = hurliang[hurliang$species == 'Vireo olivaceus', ]
View(myspecies)
# extract only data on Vireo olivaceus 

yr_lat_long_temp = data.frame(myspecies$year, myspecies$long1, myspecies$lat1)
# create new dataframe for year, latitude, longitude, and temperature (7 day span around arrival day)
names(yr_lat_long_temp) = c("year", "lat", "long")
# rename columns 
View(yr_lat_long_temp)

yr_lat_long_temp[,"D1"]=NA
yr_lat_long_temp[,"D2"]=NA
yr_lat_long_temp[,"D3"]=NA
yr_lat_long_temp[,"D4_arrival"]=NA
yr_lat_long_temp[,"D5"]=NA
yr_lat_long_temp[,"D6"]=NA
yr_lat_long_temp[,"D7"]=NA
# create new columns for Julian day (within a week range of arrival day - D4)

yr_lat_long_temp$D4_arrival = myspecies$xmid
# add arrival day (D4) from myspecies dataframe 

yr_lat_long_temp$D3 = yr_lat_long_temp$D4_arrival - 1
yr_lat_long_temp$D2 = yr_lat_long_temp$D4_arrival - 2
yr_lat_long_temp$D1 = yr_lat_long_temp$D4_arrival - 3
yr_lat_long_temp$D5 = yr_lat_long_temp$D4_arrival + 1
yr_lat_long_temp$D6 = yr_lat_long_temp$D4_arrival + 2
yr_lat_long_temp$D7 = yr_lat_long_temp$D4_arrival + 3
# calculate julian day for 7 day range 

yr_lat_long_temp[,"D1_temp"]=NA
yr_lat_long_temp[,"D2_temp"]=NA
yr_lat_long_temp[,"D3_temp"]=NA
yr_lat_long_temp[,"D4_arrival_temp"]=NA
yr_lat_long_temp[,"D5_temp"]=NA
yr_lat_long_temp[,"D6_temp"]=NA
yr_lat_long_temp[,"D7_temp"]=NA
# create columns for temperatures at each day 


