# IMPORTANT! -------------------------------------------------------------------
# run the following code only once (until the three lines)!


# setup environment ------------------------------------------------------------
# if the package renv is not installed, run install.packages("renv")
renv::activate()
renv::restore()

# set coder name ---------------------------------------------------------------
coder <- "aa"
# coder <- "ch"

# setup annotation environment -------------------------------------------------
source("scripts/setup.R")

################################################################################
################################################################################
################################################################################

# IMPORTANT! -------------------------------------------------------------------
# run this every time you want to continue your annotation

# start validation -------------------------------------------------------------
start_annotator("data/annotinder_jobs/val.db", background = TRUE)


################################################################################
################################################################################
################################################################################

# IMPORTANT! -------------------------------------------------------------------
# run this only once if you are fully done to save your annotations

library(readr)
library(magrittr)
library(annotinder)

gimme_annotations("data/annotinder_jobs/val.db") %>% 
  write_csv("data/coding_done.csv")
