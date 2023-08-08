library(readr)
library(magrittr)
library(dplyr)
library(stringr)
library(annotinder)

# make annotation subsets
if (coder == "aa") {
  units <- 
    read_csv("data/val_aa.csv") %>%
    create_units(id = "val_id",
                 meta = "main_title",
                 set_text("text", jw_desc))
} else if (coder == "ch") {
  units <- 
    read_csv("data/val_ch.csv") %>%
    create_units(id = "val_id",
                 meta = "main_title",
                 set_text("text", jw_desc))
} else if (coder == "double") {
  units <- 
    read_csv("data/val_double.csv") %>%
    create_units(id = "val_id",
                 meta = "main_title",
                 set_text("text", jw_desc))
} else {
  print("Coder name was not set correctly!")
}

# question texts
q1 <- "In diesem Text geht es um das Thema "

q2 <- "Wie zentral behandelt der/die beschriebene Film/Serie das Thema "

# make questions
work_text <- question(name = "work_text", question = str_c(q1, "ARBEIT"),
                      codes = c(green = "Ja",
                                red = "Nein"))

work_title <- question(name = "work_title", question = str_c(q2, "ARBEIT"),
                       codes = c(lightgrey = "1",
                                 lightgrey = "2",
                                 lightgrey = "3",
                                 lightgrey = "4",
                                 lightgrey = "5"))

family_text <- question(name = "family_text", question = str_c(q1, "FAMILIE"),
                        codes = c(green = "Ja",
                                  red = "Nein"))

family_title <- question(name = "family_title", question = str_c(q2, "FAMILIE"),
                         codes = c(lightgrey = "1",
                                   lightgrey = "2",
                                   lightgrey = "3",
                                   lightgrey = "4",
                                   lightgrey = "5"))

friends_text <- question(name = "friends_text", question = str_c(q1, "FREUNDSCHAFT"),
                         codes = c(green = "Ja",
                                   red = "Nein"))

friends_title <- question(name = "friends_title", question = str_c(q2, "FREUNDSCHAFT"),
                          codes = c(lightgrey = "1",
                                    lightgrey = "2",
                                    lightgrey = "3",
                                    lightgrey = "4",
                                    lightgrey = "5"))

relationship_text <- question(name = "relationship_text", question = str_c(q1, "BEZIEHUNG/DATING"),
                              codes = c(green = "Ja",
                                        red = "Nein"))

relationship_title <- question(name = "relationship_title", question = str_c(q2, "BEZIEHUNG/DATING"),
                               codes = c(lightgrey = "1",
                                         lightgrey = "2",
                                         lightgrey = "3",
                                         lightgrey = "4",
                                         lightgrey = "5"))

university_text <- question(name = "university_text", question = str_c(q1, "STUDIUM/AUSBILDUNG"),
                            codes = c(green = "Ja",
                                      red = "Nein"))

university_title <- question(name = "university_title", question = str_c(q2, "STUDIUM/AUSBILDUNG"),
                             codes = c(lightgrey = "1",
                                       lightgrey = "2",
                                       lightgrey = "3",
                                       lightgrey = "4",
                                       lightgrey = "5"))

# create codebook
codebook <- create_codebook(work_text, work_title,
                            family_text, family_title,
                            friends_text, friends_title,
                            relationship_text, relationship_title,
                            university_text, university_title)

# create job
job <- create_job("val", units, codebook)
job_db <- create_job_db(job, path = "data", overwrite = FALSE)
