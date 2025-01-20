# What does the following code do?
# Tip: `%%` is the remainder operator. E.g. 10 %% 4 is 2.
instrument_deployed_hm <- c(730, 915, 1345)
# hm stands for hour minute
# the first line (instrument_deployed_hm) is a vector for instrument_deployed_hm
instrument_deployed_h <- floor(instrument_deployed_hm / 100)
# divides by 100 and then floor is rounding down
# the second line (instrument_deployed_h) is a conditional operator that
# represents the
instrument_deployed_hdec <- (instrument_deployed_hm %% 100) / 60
# hdec means hour decimal
instrument_deployed <- instrument_deployed_h + instrument_deployed_hdec
# finding the variable for the instrument was deployed by adding two vectors
# that affected by each other

# Based on the code above, calculate the duration of instrument deployments
# using the instrument recovery times below. What units do the durations have?
instrument_recovered_hm <- c(1600, 1920, 2015)
# units = time (hour:minutes)
instrument_recovered_h <- floor(instrument_recovered_hm / 100)
instrument_recovered_hdec <- (instrument_recovered_hm %% 100) / 60

instrument_recovered <- instrument_recovered_h + instrument_recovered_hdec
# units
instrument_durations <- instrument_recovered - instrument_deployed

# Which site had the largest duration? Use conditional indexing,
site <- c("Santa Cruz", "Santa Rosa", "San Miguel")
site[instrument_durations == max(instrument_durations)]


