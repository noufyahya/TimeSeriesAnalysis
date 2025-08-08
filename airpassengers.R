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

#ACF 

# Remove NA values from residuals
resid_add <- na.omit(decomp_add$random)
resid_mult <- na.omit(decomp_mult$random)

# Plot ACF (Autocorrelation Function) of residuals
par(mfrow = c(1, 2))
acf(resid_add, main = "Additive Residuals")
acf(resid_mult, main = "Multiplicative Residuals")

# Extract seasonal components
seasonal_add <- decomp_add$seasonal
seasonal_mult <- decomp_mult$seasonal

# Plot side-by-side with matching ylim
par(mfrow = c(1, 2))  # 1 row, 2 columns

# Additive seasonal plot
plot(decomp_add$seasonal, 
     main = "Additive Seasonality",
     ylab = "Effect",
     col = "blue",
     lwd = 2,
     ylim = c(-50,50))  # Force same y-axis

# Multiplicative seasonal plot
plot(decomp_mult$seasonal, 
     main = "Multiplicative Seasonality",
     ylab = "Effect",
     col = "red",
     lwd = 2,
     ylim = c(-5,5))  # Force same y-axis


# Quantify residual variance (lower = better)
var_add <- var(resid_add, na.rm = TRUE)
var_mult <- var(resid_mult, na.rm = TRUE)

cat("Additive residuals variance:", var_add, "\nMultiplicative residuals variance:", var_mult)
