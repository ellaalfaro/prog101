##########################################################################
## Driver: (Name) (GitHub Handle)                                       ##
## Navigator: (Name) (GitHub Handle)                                    ##
## Date: (YYYY-MM-DD)                                                   ##
##########################################################################

library(marinecs100b)

# Guiding questions -------------------------------------------------------

# What does KEFJ stand for? Kenai Fjords National Park

# How was temperature monitored? HOBO V2 temperature loggers

# What's the difference between absolute temperature and temperature anomaly?
# Absolute temperature is any individual reading
# Temperature anomaly how unusual that reading is (distance from that individual reading to the long term mean
# line)

# Begin exploring ---------------------------------------------------------

# How many kefj_* vectors are there? 6
?kefj
# How long are they? 2187966

# What do they represent? They represent the different characteristics of the
# testing sites (i.e. temperature, site, date/time, tidelevel, exposure, season)

# Link to sketch
# https://docs.google.com/document/d/1m4WZnYbQa80iImhQG4WEIuFiS_32O7z9IfYQ9KoXOak/edit?usp=sharing

length(kefj_datetime)

kefj_Aialik_datetime <- kefj_datetime[kefj_site == "Aialik"]
kefj_Aialik_interval <- kefj_Aialik_datetime[2:length(kefj_Aialik_datetime)] - kefj_Aialik_datetime[1:(length(kefj_Aialik_datetime)-1)]
table(kefj_Aialik_interval)

30     60    120    150    180    240    750   8730 498600
262735      3      5      1      1      2      1      1      1
# first row is intervals in minutes
# second row is a frequency row

# Problem decomposition ---------------------------------------------------

# When and where did the hottest and coldest air temperature readings happen?

kefj_Aialik_temp <- kefj_temperature[kefj_site == "Aialik"]
max(kefj_Aialik_temp)
# hottest air temperature reading is 36.092 at .......
min(kefj_Aialik_temp)
# hottest air temperature reading is -11.613 at .......

max(kefj_temperature)
min(kefj_temperature)


# Link to sketch

# Plot the hottest day

hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct("2018-07-03 00:00:00", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-03 23:59:59", tz = "Etc/GMT+8")
hotday_idx <- kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)

# Repeat for the coldest day

coldest_idx <- which.min(kefj_temperature)
coldest_time <- kefj_datetime[coldest_idx]
coldest_site <- kefj_site[coldest_idx]
coldday_start <- as.POSIXct("2013-01-27 00:00:00", tz = "Etc/GMT+8")
coldday_end <- as.POSIXct("2013-01-27 23:59:59", tz = "Etc/GMT+8")
coldday_idx <- kefj_site == coldest_site &
  kefj_datetime >= coldday_start &
  kefj_datetime <= coldday_end
coldday_datetime <- kefj_datetime[coldday_idx]
coldday_temperature <- kefj_temperature[coldday_idx]
coldday_exposure <- kefj_exposure[coldday_idx]
plot_kefj(coldday_datetime, coldday_temperature, coldday_exposure)

# What patterns do you notice in time, temperature, and exposure? Do those
# patterns match your intuition, or do they differ?
# extreme air/transition for both exposure
# differences .............

# How did Traiger et al. define extreme temperature exposure?

# Translate their written description to code and calculate the extreme heat
# exposure for the hottest day.

# Compare your answer to the visualization you made. Does it look right to you?

# Repeat this process for extreme cold exposure on the coldest day.


# Putting it together -----------------------------------------------------

# Link to sketch

# Pick one site and one season. What were the extreme heat and cold exposure at
# that site in that season?

# Repeat for a different site and a different season.

# Optional extension: Traiger et al. (2022) also calculated water temperature
# anomalies. Consider how you could do that. Make a sketch showing which vectors
# you would need and how you would use them. Write code to get the temperature
# anomalies for one site in one season in one year.
