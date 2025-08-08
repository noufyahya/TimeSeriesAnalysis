#auther : Nouf Yahya

#description : this is an analysis of air passengers data set that resides in R
#this analysis works with air passengers as it's a time series, features include 
# plotting the data, decomposing the data to it's original competent which are seasonal, 
#trend and observed 



AirPassengers
str(AirPassengers) #returns the object with the structure
class(AirPassengers) #returns only the object of the data
summary(AirPassengers)
frequency(AirPassengers) # 12 which means monthly
plot(AirPassengers, main="Monthly Air Passengers", 
     xlab="months", ylab="passengers")
decomp_add <- decompose(AirPassengers, type="additive")
decomp_mult <- decompose(AirPassengers, type="multiplicative")
# Plot Additive Decomposition
plot(decomp_add)
# Plot Multiplicative Decomposition
plot(decomp_mult)
