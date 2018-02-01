# load required libraries, some may not be needed right away 
library(tidyverse) #data cleaning, data reading
library(readxl) #read in excel files
library(lubridate) #work with dates more easily
library(ggplot2) #for data visualization
library(janitor) #examine and clean "dirty" data

# store ITP patient demographic info in ITP_PtInfo, can use to sort into who was accepted
# to ITP
ITP_PtInfo <- read_csv("ITP_PtInfo.csv")

# store PCL, PHQ, GAD, and QOL scores for ITP patients in ITP_Scores as tibble
ITP_Scores <- read_csv("ITP_PCL_PHQ_GAD_QOL.csv")

# store ITP patient acceptance status in ITP_Accepted as tibble, skipping unnecessary columns
ITP_Accepted <- read_csv("ITP_Accepted.csv", 
                         col_types = cols(`Date Accepted or Denied` = col_skip(), 
                                          `Reason for Denial` = col_skip(), 
                                          `Specify, reason for denial` = col_skip()))

# store ITP patient primary and secondary diagnosis data in ITP_Dx
ITP_Dx <- read_csv("ITP_Dxs.csv")