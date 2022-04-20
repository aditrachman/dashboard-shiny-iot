options(digits = 2)  
library(shiny)
library(shinydashboard)
library(tidyverse)
library(plotly)
library(glue)
library(readxl)
library(lubridate)
library(ggthemes)
library(ggplot2)
library(googlesheets4)
library(timetk)

gs4_deauth()
gs4_auth(email = "aditrachman23@gmail.com", cache = ".secrets")
mesin5a <-
  read_sheet(
    "https://docs.google.com/spreadsheets/d/1pkPaUAAsSLWPLdCKCDNZq3-o2xVUmiRUCGZ8o-gR9nI/edit#gid=905998952",
    sheet = "mesin5_a",
  )

mesin5b <-
  read_sheet(
    "https://docs.google.com/spreadsheets/d/1pkPaUAAsSLWPLdCKCDNZq3-o2xVUmiRUCGZ8o-gR9nI/edit#gid=905998952",
    sheet = "mesin5_b",
  )

pphne <- mesin5a %>% summarise_by_time(.date_var = waktu, .by = 'day', jumlah_hari = sum(abs(qty) / 4 )) %>%
  mutate(pph = jumlah_hari / (3 * 7))
data <- pphne$pph
rata <- mean(data)

plot5a <- mesin5a %>%
  summarise_by_time(.date_var = waktu,
                    .by = 'hour',
                    tabel1 = sum(qty)) %>%
  mutate(mingguke1 = week(waktu)) %>%
  select(waktu, mingguke1, tabel1)


plot5b <- mesin5b %>%
  summarise_by_time(.date_var = waktu,
                    .by = 'hour',
                    tabel1 = sum(qty)) %>%
  mutate(mingguke2 = week(waktu)) %>%
  select(waktu, mingguke2, tabel1)








gs4_deauth()
gs4_auth(email = "aditrachman23@gmail.com", cache = ".secrets")
primary <-
  read_sheet(
    "https://docs.google.com/spreadsheets/d/1TfqECSPfB_9vNfOv-3NsKO-n3ulq0r1ESm-mEx5yAxg/edit#gid=464822429",
    sheet = "Laporan harian produksi",
  )
dsb <- primary %>%
  select(Tanggal, `Jumlah Finish Goods`) %>%
  mutate(Bulan = month(Tanggal,label = T))

fg_sum <- dsb %>%
  group_by(Bulan) %>%
  summarise(total_fg = sum(`Jumlah Finish Goods`))







gs4_deauth()
gs4_auth(email = "aditrachman23@gmail.com", cache = ".secrets")
finishgd <-
  read_sheet(
    "https://docs.google.com/spreadsheets/d/1TfqECSPfB_9vNfOv-3NsKO-n3ulq0r1ESm-mEx5yAxg/edit#gid=1318158175",
    sheet = "Persediaan FFP2",
  )

