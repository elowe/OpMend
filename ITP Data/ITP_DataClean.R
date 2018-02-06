# ITP_DataClean.R
# working R script to clean/process data for Operation Mend ITP
# written by Eric Lowe

# load required libraries, some may not be needed right away
library(tidyverse) # data cleaning, data reading
library(readxl) # read in excel files
library(lubridate) # work with dates more easily
library(ggplot2) # for data visualization
library(janitor) # examine and clean "dirty" data

#*******************DATA IMPORT*************************************************
# Data stored in subdirectory "Data Files/"

# store ITP patient demographic info in ITP_PtInfo, can use to sort into who was
# accepted to ITP
ITP_PtInfo <- read_csv("Data Files/ITP_PtInfo.csv")

# store PCL, PHQ, GAD, and QOL scores for ITP patients in ITP_Scores as tibble
ITP_Scores <- read_csv("Data Files/ITP_PCL_PHQ_GAD_QOL.csv")

# Store working database of ITP patients and screener/demographic info
ITP_Pts_Screeners <- read_excel("~/ITP Data/ITP_Pts_Screeners.xlsx")


# Filtering down database to subset of what we want, first by filtering on
# completed screeners
Filtered_ITP <- dplyr::filter(ITP_Pts_Screeners, ScreenerStatus %in%
  c("Complete", "Completed"), PatientExitStatus %in% c("Complete", "Completed"))
# Then filtering by distinct names
# TODO: Make sure rows discarded don't have data we want to use!
Filtered_ITP <- distinct(Filtered_ITP, PatientName, .keep_all = TRUE)
# NB: If patient left ITP early or has not finished their assessments, they will
# be excluded by the filtering.
# TODO: filter based on number of days between visits (didn't attend ITP)
#*****************FUNCTION DEFINITIONS******************************************
#
#
# FUNCTION: Initialize data structure
# Create empty data structure to hold data in form we want it in
#
#
# FUNCTION: Get patient information needed
# Patient Info needed: Name (?), Patient ID, DOB (?), Branch, Rank (?),
# Num deployments, location deployed, Screener scores
#
#
#
