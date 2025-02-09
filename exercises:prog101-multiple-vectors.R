# What does the following code do?
# Tip: `%%` is the remainder operator. E.g. 10 %% 4 is 2.
instrument_deployed_hm <- c(730, 915, 1345)
# hm stands for hour minute, for example, 7 is the hour and 30 is the minute
# the first line (instrument_deployed_hm) is a vector for instrument_deployed_hm
instrument_deployed_h <- floor(instrument_deployed_hm / 100)
# divides by 100 and then floor is rounding down. They become 7, 9, 13.
# An example is the first one 730, when divided by 100 becomes 7.3, and then is
# rounded down to 7. The resulting values in the context of the problem are in
# hours.
# the second line (instrument_deployed_h) is a conditional operator that
# represents the
instrument_deployed_hdec <- (instrument_deployed_hm %% 100) / 60
# hdec means hour decimal, for example, 730 is 0.5 out of an hour, or 915 is
# 0.25 out of an hour
instrument_deployed <- instrument_deployed_h + instrument_deployed_hdec
# finding the variable for the instrument was deployed by adding two vectors
# that affected by each other. For example, it takes the 7 from 730 and the 0.5
# out of an hour and adds them together to make 7.5, and the 9 from 915 and the
# 0.25 out of an hour, and makes 9.25 etc

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


